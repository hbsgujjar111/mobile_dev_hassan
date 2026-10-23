import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/texts.dart';

class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      p([.text(Texts.footer)]),
    ]);
  }
}
