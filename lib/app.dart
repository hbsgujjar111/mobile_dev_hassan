import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart' hide Document;
import 'package:jaspr/server.dart' show Document;
import 'package:jaspr_router/jaspr_router.dart';

import 'components/footer.dart';
import 'components/header.dart';
import 'constants/texts.dart';
import 'data/portfolio_data.dart';
import 'pages/home.dart';
import 'pages/project_detail.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'app', [
      // `lang="en"` on the <html> element.
      Document.html(attributes: {'lang': 'en'}),
      // Thin reading-progress bar at the top (CSS only, browsers with scroll-driven animations).
      div(classes: 'scroll-progress', []),
      const Header(),
      Router(
        routes: [
          Route(path: '/', title: Texts.siteTitle, builder: (context, state) => const Home()),
          // One route per project (path parameters are not supported in static mode).
          for (final project in projects)
            if (project.showProject ?? true)
              Route(
                path: '/projects/${projectSlug(project.title ?? '')}',
                title: '${project.title} | Hassan Bin Salim',
                builder: (context, state) => ProjectDetail(data: project),
              ),
        ],
      ),
      const SiteFooter(),
    ]);
  }
}
