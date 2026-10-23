/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'dart:convert';

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';
import 'constants/texts.dart';
import 'data/portfolio_data.dart';
// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

const _siteUrl = 'https://mobiledevhassan.pk/';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  const description =
      'Hassan Bin Salim — Senior Flutter Developer specializing in high-performance, responsive cross-platform mobile application development with Flutter & Dart.';

  final jsonLd = jsonEncode({
    '@context': 'https://schema.org',
    '@type': 'Person',
    'name': Texts.name,
    'jobTitle': 'Senior Flutter Developer',
    'url': _siteUrl,
    'image': '${_siteUrl}images/images/main.webp',
    'description': description,
    'address': {'@type': 'PostalAddress', 'addressLocality': 'Lahore', 'addressCountry': 'PK'},
    'alumniOf': {'@type': 'CollegeOrUniversity', 'name': 'University of Gujrat'},
    'knowsAbout': [
      'Flutter',
      'Dart',
      'Riverpod',
      'BLoC',
      'GetX',
      'Firebase',
      'Clean Architecture',
      'Mobile App Development',
    ],
    'sameAs': [gitHubURL, linkedInURL, stackOverflowURL],
  });

  // Global styles come from lib/constants/theme.dart (-> web/styles.css),
  // so no `styles:` list here anymore.
  runApp(
    Document(
      title: Texts.siteTitle,
      // name="..." meta tags
      meta: {
        'description': description,
        'theme-color': '#1A1A1B',
        'twitter:card': 'summary_large_image',
      },
      // Tags that need other attributes (property=..., rel=...).
      head: [
        // Fetch the stylesheet immediately (the generated <style>@import</style> is discovered late).
        link(rel: 'preload', href: '/styles.css', attributes: {'as': 'style'}),
        // Applies the saved light/dark choice before the page paints.
        script(src: '/theme.js'),
        meta(attributes: {'property': 'og:type', 'content': 'website'}),
        meta(attributes: {'property': 'og:site_name', 'content': 'Hassan Bin Salim | Portfolio'}),
        meta(attributes: {'property': 'og:image:width', 'content': '1200'}),
        meta(attributes: {'property': 'og:image:height', 'content': '630'}),
        meta(
          attributes: {
            'property': 'og:image:alt',
            'content': 'Hassan Bin Salim — Senior Flutter Developer Portfolio Preview',
          },
        ),
        meta(attributes: {'property': 'og:locale', 'content': 'en_US'}),
        // Start downloading the first-paint fonts in parallel with styles.css.
        link(
          rel: 'preload',
          href: '/images/fonts/Antonio/Antonio-Bold.woff2',
          attributes: {'as': 'font', 'type': 'font/woff2', 'crossorigin': 'anonymous'},
        ),
        link(
          rel: 'preload',
          href: '/images/fonts/Antonio/Antonio-SemiBold.woff2',
          attributes: {'as': 'font', 'type': 'font/woff2', 'crossorigin': 'anonymous'},
        ),
        link(
          rel: 'preload',
          href: '/images/fonts/Inter/Inter-Regular.woff2',
          attributes: {'as': 'font', 'type': 'font/woff2', 'crossorigin': 'anonymous'},
        ),
        link(rel: 'icon', href: '/favicon.png'),
        link(rel: 'apple-touch-icon', href: '/icons/Icon-192.png'),
        link(rel: 'manifest', href: '/manifest.json'),
        // Structured data for search engines (script `content` is written as raw text).
        script(attributes: {'type': 'application/ld+json'}, content: jsonLd),
      ],
      body: App(),
    ),
  );
}
