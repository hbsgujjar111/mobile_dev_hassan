(function () {
  var KEY = 'theme';
  var root = document.documentElement;
  // Apply the saved choice before the page paints (no flash).
  try {
    var saved = localStorage.getItem(KEY);
    if (saved === 'dark' || saved === 'light') root.setAttribute('data-theme', saved);
  } catch (e) {}
  // One listener for any element marked with data-theme-toggle.
  document.addEventListener('click', function (e) {
    var btn = e.target && e.target.closest ? e.target.closest('[data-theme-toggle]') : null;
    if (!btn) return;
    var current = root.getAttribute('data-theme') ||
      (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
    var next = current === 'dark' ? 'light' : 'dark';
    root.setAttribute('data-theme', next);
    try { localStorage.setItem(KEY, next); } catch (e) {}
  });

  // Time-based greeting (the page is pre-rendered, so this runs in the browser).
  function setGreeting() {
    var h = new Date().getHours();
    var text = h >= 5 && h < 12 ? 'Good Morning'
             : h >= 12 && h < 17 ? 'Good Afternoon'
             : h >= 17 && h < 21 ? 'Good Evening'
             : 'Good Night';
    var els = document.querySelectorAll('[data-greeting]');
    for (var i = 0; i < els.length; i++) els[i].textContent = text;
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', setGreeting);
  else setGreeting();
})();

// Hero photo -> About photo: one card that travels and flips while scrolling (desktop only).
(function () {
  var wide = window.matchMedia('(min-width: 1024px)');
  var reduce = window.matchMedia('(prefers-reduced-motion: reduce)');
  var zone, card, inner, heroImg, aboutImg, m = null, ticking = false;

  function lerp(a, b, t) { return a + (b - a) * t; }
  function ease(t) { return t < 0.5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2; }

  function deactivate() {
    m = null;
    if (zone) zone.classList.remove('flip-active');
  }

  function measure() {
    if (!zone || !wide.matches || reduce.matches) { deactivate(); return; }
    var sy = window.pageYOffset, sx = window.pageXOffset;
    var zr = zone.getBoundingClientRect();
    var h = heroImg.getBoundingClientRect();
    var a = aboutImg.getBoundingClientRect();
    if (!h.width || !a.width) { deactivate(); return; }
    var vh = window.innerHeight;
    m = {
      hX: h.left + sx - (zr.left + sx), hY: h.top + sy - (zr.top + sy), hW: h.width, hH: h.height,
      aX: a.left + sx - (zr.left + sx), aY: a.top + sy - (zr.top + sy), aW: a.width, aH: a.height,
      end: Math.max(1, a.top + sy - (vh - a.height) / 2)
    };
    zone.classList.add('flip-active');
    update();
  }

  function update() {
    ticking = false;
    if (!m) return;
    var p = Math.min(1, Math.max(0, window.pageYOffset / m.end));
    var e = ease(p);
    card.style.width = lerp(m.hW, m.aW, e) + 'px';
    card.style.height = lerp(m.hH, m.aH, e) + 'px';
    card.style.transform = 'translate3d(' + lerp(m.hX, m.aX, e) + 'px,' + lerp(m.hY, m.aY, e) + 'px,0)';
    inner.style.transform = 'perspective(1400px) rotateY(' + (180 * e) + 'deg)';
  }

  function onScroll() {
    if (!ticking) { ticking = true; window.requestAnimationFrame(update); }
  }

  function init() {
    zone = document.querySelector('.flip-zone');
    if (!zone) return;
    heroImg = zone.querySelector('.hero-image .photo');
    aboutImg = zone.querySelector('.about-image .photo');
    if (!heroImg || !aboutImg) return;

    card = document.createElement('div');
    card.className = 'flip-card';
    card.setAttribute('aria-hidden', 'true');
    inner = document.createElement('div');
    inner.className = 'flip-inner';
    var front = document.createElement('img');
    front.className = 'flip-face front';
    front.alt = '';
    front.src = heroImg.currentSrc || heroImg.src;
    var back = document.createElement('img');
    back.className = 'flip-face back';
    back.alt = '';
    back.src = aboutImg.currentSrc || aboutImg.src;
    inner.appendChild(front);
    inner.appendChild(back);
    card.appendChild(inner);
    zone.appendChild(card);

    window.addEventListener('scroll', onScroll, { passive: true });
    window.addEventListener('resize', measure);
    if (window.ResizeObserver) {
      var ro = new ResizeObserver(function () { measure(); });
      ro.observe(zone); ro.observe(heroImg); ro.observe(aboutImg);
    }
    window.addEventListener('load', measure);
    if (wide.addEventListener) wide.addEventListener('change', measure);
    if (document.fonts && document.fonts.ready) document.fonts.ready.then(measure);
    measure();
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();

// Cursor spotlight on cards + active link in the nav while scrolling.
(function () {
  document.addEventListener('pointermove', function (e) {
    var el = e.target && e.target.closest ? e.target.closest('.card') : null;
    if (!el) return;
    var r = el.getBoundingClientRect();
    el.style.setProperty('--mx', (e.clientX - r.left) + 'px');
    el.style.setProperty('--my', (e.clientY - r.top) + 'px');
  }, { passive: true });

  function spy() {
    var links = document.querySelectorAll('.nav-link');
    if (!links.length || !('IntersectionObserver' in window)) return;
    var map = {};
    for (var i = 0; i < links.length; i++) {
      var id = (links[i].getAttribute('href') || '').split('#')[1];
      if (id) map[id] = links[i];
    }
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (!en.isIntersecting) return;
        for (var i = 0; i < links.length; i++) links[i].classList.remove('active');
        var l = map[en.target.id];
        if (l) l.classList.add('active');
      });
    }, { rootMargin: '-45% 0px -50% 0px' });
    Object.keys(map).forEach(function (id) {
      var s = document.getElementById(id);
      if (s) io.observe(s);
    });
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', spy);
  else spy();
})();

// Soft light that follows the cursor across the whole page background.
(function () {
  var raf = 0, x = 0, y = 0;
  window.addEventListener('pointermove', function (e) {
    x = e.clientX; y = e.clientY;
    if (raf) return;
    raf = window.requestAnimationFrame(function () {
      raf = 0;
      document.documentElement.style.setProperty('--gx', x + 'px');
      document.documentElement.style.setProperty('--gy', y + 'px');
    });
  }, { passive: true });
})();

// Subtle particle network behind the hero (pauses off-screen, skipped for reduced motion).
(function () {
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;

  function init() {
    var hero = document.querySelector('.hero');
    if (!hero) return;
    var cv = document.createElement('canvas');
    cv.className = 'hero-canvas';
    cv.setAttribute('aria-hidden', 'true');
    hero.insertBefore(cv, hero.firstChild);
    var ctx = cv.getContext('2d');
    if (!ctx) return;

    var dpr = Math.min(window.devicePixelRatio || 1, 2);
    var W = 0, H = 0, pts = [], running = false, tick = 0, rgb = '122,255,112';
    var mouse = { x: -9999, y: -9999 };

    function readColor() {
      var v = getComputedStyle(document.documentElement).getPropertyValue('--primary-rgb').trim().split(/\s+/);
      if (v.length === 3) rgb = v.join(',');
    }

    function resize() {
      var r = hero.getBoundingClientRect();
      W = r.width; H = r.height;
      cv.width = W * dpr; cv.height = H * dpr;
      ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
      var n = Math.round(Math.min(70, Math.max(22, (W * H) / 22000)));
      pts = [];
      for (var i = 0; i < n; i++) {
        pts.push({
          x: Math.random() * W, y: Math.random() * H,
          vx: (Math.random() - 0.5) * 0.35, vy: (Math.random() - 0.5) * 0.35,
          r: Math.random() * 1.4 + 0.6
        });
      }
    }

    function frame() {
      if (!running) return;
      window.requestAnimationFrame(frame);
      if (++tick % 90 === 0) readColor();
      ctx.clearRect(0, 0, W, H);
      var L = 120, i, j, a, b, dx, dy, d;
      for (i = 0; i < pts.length; i++) {
        a = pts[i];
        a.x += a.vx; a.y += a.vy;
        if (a.x < 0 || a.x > W) a.vx *= -1;
        if (a.y < 0 || a.y > H) a.vy *= -1;
        ctx.beginPath();
        ctx.arc(a.x, a.y, a.r, 0, 6.2832);
        ctx.fillStyle = 'rgba(' + rgb + ',0.55)';
        ctx.fill();
        for (j = i + 1; j < pts.length; j++) {
          b = pts[j]; dx = a.x - b.x; dy = a.y - b.y; d = Math.sqrt(dx * dx + dy * dy);
          if (d < L) {
            ctx.strokeStyle = 'rgba(' + rgb + ',' + (0.22 * (1 - d / L)) + ')';
            ctx.lineWidth = 1;
            ctx.beginPath(); ctx.moveTo(a.x, a.y); ctx.lineTo(b.x, b.y); ctx.stroke();
          }
        }
        dx = a.x - mouse.x; dy = a.y - mouse.y; d = Math.sqrt(dx * dx + dy * dy);
        if (d < 160) {
          ctx.strokeStyle = 'rgba(' + rgb + ',' + (0.4 * (1 - d / 160)) + ')';
          ctx.beginPath(); ctx.moveTo(a.x, a.y); ctx.lineTo(mouse.x, mouse.y); ctx.stroke();
        }
      }
    }

    function start() { if (!running) { running = true; frame(); } }
    function stop() { running = false; }

    hero.addEventListener('pointermove', function (e) {
      var r = hero.getBoundingClientRect();
      mouse.x = e.clientX - r.left; mouse.y = e.clientY - r.top;
    }, { passive: true });
    hero.addEventListener('pointerleave', function () { mouse.x = mouse.y = -9999; });
    window.addEventListener('resize', resize);
    document.addEventListener('click', function (e) {
      if (e.target && e.target.closest && e.target.closest('[data-theme-toggle]')) setTimeout(readColor, 50);
    });

    readColor();
    resize();
    if ('IntersectionObserver' in window) {
      new IntersectionObserver(function (en) { en[0].isIntersecting ? start() : stop(); }).observe(hero);
    } else {
      start();
    }
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();

// "Copy" buttons on package cards.
document.addEventListener('click', function (e) {
  var b = e.target && e.target.closest && e.target.closest('[data-copy]');
  if (!b) return;
  var text = b.getAttribute('data-copy');
  function ok() {
    var old = b.textContent;
    b.textContent = 'Copied';
    b.classList.add('done');
    setTimeout(function () { b.textContent = old; b.classList.remove('done'); }, 1500);
  }
  try {
    if (navigator.clipboard) { navigator.clipboard.writeText(text).then(ok); return; }
  } catch (err) {}
  var ta = document.createElement('textarea');
  ta.value = text; document.body.appendChild(ta); ta.select();
  try { document.execCommand('copy'); ok(); } catch (err) {}
  document.body.removeChild(ta);
});

// Mobile menu: open/close the collapsed nav pill.
(function () {
  function header() { return document.querySelector('.site-header'); }
  function setOpen(open) {
    var h = header(); if (!h) return;
    h.classList.toggle('open', open);
    var b = h.querySelector('[data-menu-toggle]');
    if (b) { b.setAttribute('aria-expanded', open ? 'true' : 'false'); b.setAttribute('aria-label', open ? 'Close menu' : 'Open menu'); }
  }
  document.addEventListener('click', function (e) {
    var h = header(); if (!h) return;
    var t = e.target;
    if (t.closest && t.closest('[data-menu-toggle]')) { setOpen(!h.classList.contains('open')); return; }
    if (t.closest && t.closest('.nav-link')) { setOpen(false); return; }
    if (h.classList.contains('open') && !(t.closest && t.closest('.nav'))) setOpen(false);
  });
  document.addEventListener('keydown', function (e) { if (e.key === 'Escape') setOpen(false); });
})();

