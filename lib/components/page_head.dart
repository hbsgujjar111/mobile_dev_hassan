import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart' hide Document;
import 'package:jaspr/server.dart' show Document;

const siteUrl = 'https://mobiledevhassan.pk';

/// Per-page <title>, description, canonical and social tags (overrides the site-wide defaults).
Component pageHead({
  required String title,
  required String description,
  required String path,
}) {
  final url = path == '/' ? '$siteUrl/' : '$siteUrl$path';
  const image = '$siteUrl/preview.png';
  return Document.head(
    title: title,
    meta: {
      'description': description,
      'twitter:title': title,
      'twitter:description': description,
      'twitter:url': url,
      'twitter:image': image,
    },
    children: [
      meta(attributes: {'property': 'og:title', 'content': title}),
      meta(attributes: {'property': 'og:description', 'content': description}),
      meta(attributes: {'property': 'og:url', 'content': url}),
      meta(attributes: {'property': 'og:image', 'content': image}),
      link(rel: 'canonical', href: url),
    ],
  );
}
