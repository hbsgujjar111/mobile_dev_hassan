# Hassan Bin Salim — Portfolio

Personal portfolio of Hassan Bin Salim, Senior Flutter Developer. Live at **https://mobiledevhassan.pk**.

Built with [Jaspr](https://jaspr.site) (Dart web framework) in static site generation mode. Every page is pre-rendered to plain HTML at build time, with a small amount of vanilla JavaScript for the theme toggle, nav and hero effects.

> The previous Flutter Web version is preserved at the git tag `flutter-portfolio-final`.

## Features

- Light and dark theme (follows the system, with a manual toggle)
- One pre-rendered page per project (`/projects/<slug>`) with its own title, description and social tags
- SEO: per-page meta tags, canonical URLs, Open Graph / Twitter cards, JSON-LD, `sitemap.xml`, `robots.txt`
- Responsive layout from phones to wide desktops
- Custom 404 page

## Project structure

```
lib/
  main.server.dart      # site-wide <head>, JSON-LD, app entry (server)
  main.client.dart      # client entry
  app.dart              # layout and routes
  components/           # header, footer, page_head (per-page SEO tags)
  constants/            # texts, asset paths, theme
  data/                 # models and portfolio content (edit content here)
  pages/                # home and project detail pages
web/
  styles.css            # all styling (light/dark tokens, responsive rules)
  theme.js              # theme toggle, nav, flip card, hero particles
  images/               # images, icons, fonts, resume
  404.html, CNAME, robots.txt, manifest.json, favicon.png, icons/, preview.png
```

## Development

Requirements: Dart SDK and the Jaspr CLI.

```bash
dart pub global activate jaspr_cli 0.23.5
dart pub get
jaspr serve          # dev server with hot reload
```

## Build

```bash
jaspr build --sitemap-domain https://mobiledevhassan.pk
```

Output is written to `build/jaspr/`.

## Updating content

Edit `lib/data/portfolio_data.dart` (experience, education, skills, packages, projects, contact links). Adding a project there automatically creates its page at `/projects/<slug>`.

## Deployment

The site is built with GitHub Actions and served by GitHub Pages at the custom domain. A monthly scheduled build keeps the "years of experience" figures current.

## Contact

[mobiledevhassan@gmail.com](mailto:mobiledevhassan@gmail.com) · [LinkedIn](https://www.linkedin.com/in/hassanbinsalim) · [GitHub](https://github.com/hbsgujjar111)