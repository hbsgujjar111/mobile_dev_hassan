import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/page_head.dart';
import '../data/models.dart';
import 'home.dart' show projectSlug;

/// One page per project, pre-rendered at build time (e.g. /projects/myuts).
class ProjectDetail extends StatelessComponent {
  const ProjectDetail({super.key, required this.data});

  final ProjectModel data;

  @override
  Component build(BuildContext context) {
    final descriptions = data.description ?? <String>[];
    final achievements = data.achievements ?? <String>[];
    final technologies = data.technologies ?? <String>[];

    final platforms = <String>[
      if (_has(data.android)) 'Android',
      if (_has(data.apple)) 'iOS',
      if (_has(data.huawei)) 'Huawei',
      if (_has(data.web)) 'Web',
      if (_has(data.windows)) 'Windows',
      if (_has(data.mac)) 'macOS',
    ];
    final stores = <Component>[
      if (_has(data.android)) _store(data.android!, 'Google Play Store', 'google-play', multicolor: true),
      if (_has(data.apple)) _store(data.apple!, 'Apple App Store', 'appstore'),
      if (_has(data.huawei)) _store(data.huawei!, 'Huawei App Gallery', 'app-gallery', multicolor: true),
      if (_has(data.web)) _store(data.web!, 'Web', 'globe'),
      if (_has(data.windows)) _store(data.windows!, 'Windows Desktop', 'windows'),
      if (_has(data.mac)) _store(data.mac!, 'MacOS', 'apple'),
    ];

    final first = descriptions.isNotEmpty ? descriptions.first : '';
    final summary = first.length > 150 ? '${first.substring(0, 147).trimRight()}...' : first;
    final name = data.title ?? '';

    return div(classes: 'page detail-page', [
      pageHead(
        title: '$name | Hassan Bin Salim',
        description: summary.isEmpty ? '$name — a Flutter project by Hassan Bin Salim.' : summary,
        path: '/projects/${projectSlug(name)}',
      ),
      a(
        href: '/#projects',
        classes: 'back-pill',
        attributes: {'aria-label': 'Back to projects'},
        [
          span(classes: 'back-arrow', [.text('←')]),
          span([.text('All projects')]),
        ],
      ),
      section(classes: 'section', [
        div(classes: 'container detail-wrap', [
          div(classes: 'detail-media', [
            img(
              src: data.graphic ?? '',
              alt: '${data.title ?? ''} app screenshot',
              classes: 'project-image detail-image',
            ),
          ]),
          div(classes: 'detail-head', [
            p(classes: 'eyebrow', [.text('CASE STUDY')]),
            h1(classes: 'detail-title', [.text(data.title ?? '')]),
            div(classes: 'detail-pills', [
              if (data.company != null) span(classes: 'pill solid', [.text(data.company!)]),
              for (final pl in platforms) span(classes: 'pill', [.text(pl)]),
            ]),
          ]),
          div(classes: 'detail-grid', [
            div(classes: 'detail-main', [
              h2(classes: 'detail-heading', [.text('About the project')]),
              div(classes: 'detail-text', [
                for (final x in descriptions) p([.text(x)]),
              ]),
              if (achievements.isNotEmpty) ...[
                h2(classes: 'detail-heading', [.text('Key achievements')]),
                ul(classes: 'bullets check', [
                  for (final x in achievements) li([.text(x)]),
                ]),
              ],
            ]),
            aside(classes: 'detail-side', [
              if (technologies.isNotEmpty)
                div(classes: 'card', [
                  h3(classes: 'card-title', [.text('Technologies')]),
                  div(classes: 'chips', [
                    for (final t in technologies) span(classes: 'chip', [.text(t)]),
                  ]),
                ]),
              if (stores.isNotEmpty)
                div(classes: 'card', [
                  h3(classes: 'card-title', [.text('Available on')]),
                  div(classes: 'store-row', stores),
                ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  bool _has(String? url) => url != null && url.isNotEmpty;

  Component _store(String url, String label, String icon, {bool multicolor = false}) {
    return a(
      href: url,
      classes: 'card store-item',
      attributes: {'target': '_blank', 'rel': 'noopener'},
      [
        if (multicolor)
          img(src: '/images/icons/svg/$icon.svg', alt: '', classes: 'store-img')
        else
          span(classes: 'icon icon-$icon', []),
        span([.text(label)]),
      ],
    );
  }
}
