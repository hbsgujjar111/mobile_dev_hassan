import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/texts.dart';

/// Floating pill navigation: logo, links, light/dark toggle (handled by web/theme.js).
class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      nav(classes: 'nav', [
        a(
          href: '/#home',
          classes: 'nav-logo-link',
          attributes: {'aria-label': 'Home'},
          [
            img(src: '/images/logos/app-icon.webp', alt: 'Hassan Bin Salim logo', classes: 'nav-logo'),
          ],
        ),
        div(classes: 'nav-links', [
          for (final item in navItems) a(href: '/#${item.id}', classes: 'nav-link', [.text(item.label)]),
        ]),
        button(
          classes: 'theme-toggle',
          attributes: {
            'type': 'button',
            'data-theme-toggle': '',
            'aria-label': 'Toggle light or dark theme',
            'title': 'Switch theme',
          },
          [
            span(classes: 'icon icon-sun sun', []),
            span(classes: 'icon icon-moon moon', []),
          ],
        ),
        button(
          classes: 'menu-toggle',
          attributes: {'type': 'button', 'data-menu-toggle': '', 'aria-label': 'Open menu', 'aria-expanded': 'false'},
          [span(classes: 'bars', [])],
        ),
      ]),
    ]);
  }
}
