import 'package:jaspr/dom.dart';

// Global styles live in web/styles.css (plain CSS, light + dark theme).
// They are pulled in here so every page gets them.
@css
List<StyleRule> get styles => [
  css.import('/styles.css'),
];
