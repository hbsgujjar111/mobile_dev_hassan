import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/assets.dart';
import '../constants/texts.dart';
import '../data/models.dart';
import '../data/portfolio_data.dart';

const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

String _fmt(DateTime? d) => d == null ? 'Present' : '${_months[d.month - 1]} ${d.year}';

String _duration(DateTime? start, DateTime? end) {
  if (start == null) return '';
  final to = end ?? DateTime.now();
  var months = (to.year - start.year) * 12 + (to.month - start.month) + 1;
  if (months < 1) months = 1;
  final y = months ~/ 12;
  final m = months % 12;
  final parts = <String>[];
  if (y > 0) parts.add('$y yr${y > 1 ? 's' : ''}');
  if (m > 0) parts.add('$m mo${m > 1 ? 's' : ''}');
  return parts.join(' ');
}

bool _ok(String? url) => url != null && url.isNotEmpty;

String _platforms(ProjectModel p) {
  final list = <String>[
    if (_ok(p.android)) 'Android',
    if (_ok(p.apple)) 'iOS',
    if (_ok(p.huawei)) 'Huawei',
    if (_ok(p.web)) 'Web',
    if (_ok(p.windows)) 'Windows',
    if (_ok(p.mac)) 'macOS',
  ];
  return list.join(' · ');
}

String projectSlug(String title) => title.toLowerCase().trim().replaceAll(RegExp(r'[^a-z0-9]+'), '-');

/// Single page with all sections. Everything is plain HTML, pre-rendered at build time.
class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'page', [
      // Hero + About share a zone so the photo can flip between them (web/theme.js).
      div(classes: 'flip-zone', [
        _hero(),
        _marquee(),
        _about(),
      ]),
      _skills(),
      _experience(),
      _projects(),
      _education(),
      _contact(),
    ]);
  }

  // ---------------------------------------------------------------- hero
  Component _hero() {
    return section(id: 'home', classes: 'section hero', [
      div(classes: 'container hero-inner', [
        div(classes: 'hero-text', [
          // Replaced by "Good Morning / Afternoon / Evening / Night" in the browser (web/theme.js).
          p(classes: 'greeting', attributes: {'data-greeting': ''}, [.text('Hello')]),
          p(classes: 'iam', [.text('I am')]),
          h1(classes: 'hero-name', [.text(Texts.name.toUpperCase())]),
          h2(classes: 'hero-role', [.text(Texts.role.toUpperCase())]),
          div(classes: 'btn-row', [
            a(href: '#projects', classes: 'btn', [span(classes: 'icon icon-laptop', []), .text('View My Work')]),
            a(href: '#contact', classes: 'btn', [span(classes: 'icon icon-phone-ios', []), .text('Get In Touch')]),
          ]),
          div(classes: 'hero-stats', [
            _heroStat(experienceYearsText(), 'Years Experience'),
            _heroStat(Texts.projectCount, 'Apps Shipped'),
            _heroStat('${packagesList.length}', 'Open-Source Packages'),
          ]),
        ]),
        div(classes: 'hero-image', [
          img(src: Assets.main, alt: 'Hassan Bin Salim, Flutter developer', classes: 'photo'),
        ]),
      ]),
      a(
        href: '#about',
        classes: 'scroll-cue',
        attributes: {'aria-label': 'Scroll to About'},
        [
          span(classes: 'scroll-dot', []),
        ],
      ),
    ]);
  }

  Component _heroStat(String value, String label) {
    return div(classes: 'hero-stat', [
      span(classes: 'hero-stat-value', [.text(value)]),
      span(classes: 'hero-stat-label', [.text(label)]),
    ]);
  }

  // ------------------------------------------------------------- marquee
  /// Endless scrolling strip of skills (pure CSS animation, decorative).
  Component _marquee() {
    final items = skillsList.expand((g) => g.skills ?? <String>[]).toList();
    return div(
      classes: 'marquee',
      attributes: {'aria-hidden': 'true'},
      [
        div(classes: 'marquee-track', [
          for (var round = 0; round < 2; round++)
            for (final s in items) span(classes: 'marquee-item', [.text(s)]),
        ]),
      ],
    );
  }

  // --------------------------------------------------------------- about
  Component _about() {
    return section(id: 'about', classes: 'section', [
      div(classes: 'container about-inner', [
        div(classes: 'about-image', [
          img(src: Assets.about, alt: 'About Hassan Bin Salim', classes: 'photo'),
        ]),
        div(classes: 'about-text', [
          h2(classes: 'section-title', [.text('ABOUT ME')]),
          p(classes: 'about-copy', [.text(Texts.aboutMe)]),
          div(classes: 'card stats', [
            div(classes: 'stat', [
              span(classes: 'stat-value', [.text(experienceYearsText())]),
              span(classes: 'stat-label', [.text('Years of Experience')]),
            ]),
            div(classes: 'stat', [
              span(classes: 'stat-value', [.text(Texts.projectCount)]),
              span(classes: 'stat-label', [.text('Completed Projects')]),
            ]),
          ]),
          div(classes: 'btn-row', [
            a(
              href: Assets.resume,
              classes: 'btn',
              attributes: {'download': ''},
              [span(classes: 'icon icon-doc', []), .text('Download Resume')],
            ),
            a(href: '#contact', classes: 'btn', [span(classes: 'icon icon-phone-ios', []), .text('Get In Touch')]),
          ]),
        ]),
      ]),
    ]);
  }

  // -------------------------------------------------------------- skills
  Component _skills() {
    return section(id: 'skills', classes: 'section', [
      div(classes: 'container', [
        h2(classes: 'section-title', [.text('MY SKILLS')]),
        div(classes: 'grid skills-grid', [
          for (var g = 0; g < skillsList.length; g++)
            div(classes: 'card skill-card', [
              div(classes: 'skill-head', [
                span(classes: 'skill-index', [.text((g + 1).toString().padLeft(2, '0'))]),
                span(classes: 'skill-count', [.text('${skillsList[g].skills?.length ?? 0} skills')]),
              ]),
              h3(classes: 'card-title', [.text(skillsList[g].title ?? '')]),
              div(classes: 'chips', [
                for (final s in skillsList[g].skills ?? <String>[]) span(classes: 'chip', [.text(s)]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  // ---------------------------------------------------------- experience
  Component _experience() {
    return section(id: 'experience', classes: 'section', [
      div(classes: 'container', [
        h2(classes: 'section-title', [.text('WORK EXPERIENCE')]),
        div(classes: 'timeline', [
          for (final e in experiences)
            div(classes: 'card timeline-item', [
              span(classes: 'timeline-dot', [
                span(classes: 'icon icon-${e.endTime == null ? 'pin' : 'briefcase'}', []),
              ]),
              div(classes: 'title-row', [
                h3(classes: 'exp-title', [.text(e.designation ?? '')]),
                if (e.endTime == null) span(classes: 'pill', [.text('Current')]),
              ]),
              p(classes: 'exp-company', [.text(e.company ?? '')]),
              div(classes: 'timeline-side', [
                span([.text('${_fmt(e.startTime)} – ${_fmt(e.endTime)}')]),
                span(classes: 'dim', [.text(_duration(e.startTime, e.endTime))]),
              ]),
              div(classes: 'meta-row', [
                span(classes: 'meta-dates', [
                  .text('${_fmt(e.startTime)} – ${_fmt(e.endTime)} · ${_duration(e.startTime, e.endTime)}'),
                ]),
                span([.text(e.location ?? '')]),
              ]),
              ul(classes: 'bullets', [
                for (final r in e.responsibilities ?? <String>[]) li([.text(r)]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  // ------------------------------------------------------------ projects
  Component _projects() {
    return section(id: 'projects', classes: 'section', [
      div(classes: 'container', [
        h2(classes: 'section-title', [.text('MY PROJECTS')]),
        h3(classes: 'sub-title', [.text('Mobile Apps')]),
        div(classes: 'grid project-grid', [
          for (final p0 in projects)
            if (p0.showProject ?? true) _projectCard(p0),
        ]),
        h3(classes: 'sub-title', [.text('Packages')]),
        div(classes: 'grid package-grid', [
          for (final pkg in packagesList)
            div(classes: 'card package-card', [
              div(classes: 'package-body', [
                span(classes: 'pkg-tag', [.text('Flutter package')]),
                h3(classes: 'package-title', [.text(pkg.name)]),
                p(classes: 'card-copy', [.text(pkg.description)]),
                div(classes: 'badges', [
                  for (final kind in const ['v', 'likes', 'points'])
                    img(
                      src: 'https://img.shields.io/pub/$kind/${pkg.name}',
                      alt: '${pkg.name} pub.dev ${kind == 'v' ? 'version' : kind}',
                      classes: 'pub-badge',
                      attributes: {'loading': 'lazy'},
                    ),
                ]),
                div(classes: 'cmd', [
                  span(classes: 'cmd-text', [
                    span(classes: 'cmd-prompt', [.text('\$ ')]),
                    .text('flutter pub add ${pkg.name}'),
                  ]),
                  button(
                    classes: 'copy-btn',
                    attributes: {
                      'type': 'button',
                      'data-copy': 'flutter pub add ${pkg.name}',
                      'aria-label': 'Copy install command',
                    },
                    [.text('Copy')],
                  ),
                ]),
                a(
                  href: pkg.url,
                  classes: 'btn',
                  attributes: {'target': '_blank', 'rel': 'noopener'},
                  [.text('View on Pub.dev')],
                ),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  Component _projectCard(ProjectModel project) {
    final title = project.title ?? '';
    final techs = project.technologies ?? <String>[];
    final shown = techs.take(3).toList();
    final extra = techs.length - shown.length;
    return div(classes: 'card project-card', [
      div(classes: 'project-media', [
        img(src: project.graphic ?? '', alt: '$title app screenshot', classes: 'project-image'),
        if (project.company != null) span(classes: 'badge', [.text(project.company!)]),
      ]),
      div(classes: 'project-body', [
        h3(classes: 'project-title', [.text(title)]),
        p(classes: 'project-platforms', [.text(_platforms(project))]),
        p(classes: 'card-copy clamp-3', [.text((project.description ?? <String>[]).join(' '))]),
        div(classes: 'chips mini', [
          for (final t in shown) span(classes: 'chip', [.text(t)]),
          if (extra > 0) span(classes: 'chip more', [.text('+$extra')]),
        ]),
        a(href: '/projects/${projectSlug(title)}', classes: 'link-arrow', [
          .text('Read case study'),
          span(classes: 'arrow', [.text('→')]),
        ]),
      ]),
    ]);
  }

  // ----------------------------------------------------------- education
  Component _education() {
    return section(id: 'education', classes: 'section', [
      div(classes: 'container', [
        h2(classes: 'section-title', [.text('EDUCATION')]),
        div(classes: 'grid edu-grid', [
          for (final e in educations)
            div(classes: 'card', [
              h3(classes: 'card-title', [.text(e.degree ?? '')]),
              p(classes: 'meta', [.text('${e.school ?? ''} · ${e.location ?? ''}')]),
              p(classes: 'meta dates', [.text('${_fmt(e.startTime)} – ${_fmt(e.endTime)}')]),
            ]),
        ]),
      ]),
    ]);
  }

  // ------------------------------------------------------------- contact
  Component _contact() {
    return section(id: 'contact', classes: 'section', [
      div(classes: 'container center', [
        h2(classes: 'section-title', [.text("LET'S WORK TOGETHER")]),
        p(classes: 'about-copy', [.text(Texts.contactSubTitle)]),
        p(classes: 'meta', [.text('★ ${Texts.repliesWithin24Hours}')]),
        div(classes: 'contact-row', [
          _contactCard('pin', 'Location', Texts.address),
          _contactCard('mail', 'Email', myGmail, href: 'mailto:$myGmail'),
          _contactCard('phone', 'Phone', myNumber, href: 'tel:${myNumber.replaceAll(' ', '')}'),
        ]),
        h3(classes: 'sub-title', [.text('WHY HIRE ME?')]),
        ul(classes: 'bullets check left', [
          for (final reason in whyHireMe) li([.text(reason)]),
        ]),
        h3(classes: 'sub-title', [.text('GET IN TOUCH')]),
        div(classes: 'social-row', [
          _social('WhatsApp', Texts.whatsappUrl, 'whatsapp'),
          _social('LinkedIn', linkedInURL, 'linkedin'),
          _social('Stack Overflow', stackOverflowURL, 'stackoverflow'),
          _social('GitHub', gitHubURL, 'github'),
        ]),
      ]),
    ]);
  }

  Component _contactCard(String icon, String label, String value, {String? href}) {
    final children = <Component>[
      span(classes: 'contact-label', [.text(label)]),
      span(classes: 'contact-value', [.text(value)]),
    ];
    if (href == null) return div(classes: 'card contact-item', children);
    return a(href: href, classes: 'card contact-item', children);
  }

  Component _social(String label, String url, String key) {
    return a(
      href: url,
      classes: 'card social-item',
      attributes: {'target': '_blank', 'rel': 'noopener', 'aria-label': label},
      [
        span(classes: 'icon icon-$key', []),
        span([.text(label)]),
      ],
    );
  }
}
