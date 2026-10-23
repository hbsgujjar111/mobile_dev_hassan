import '../data/portfolio_data.dart';

class Texts {
  Texts._();

  static const String name = 'Hassan Bin Salim';
  static const String role = 'Flutter Developer';
  static const String siteTitle = 'Hassan Bin Salim | Senior Flutter Developer';

  static String get aboutMe =>
      'Hi, I’m Hassan Bin Salim, a Flutter Developer with over ${experienceYearsText()} years of experience building high-quality mobile applications. I have led development teams, contributed to architectural decisions, and delivered scalable, performant, and visually polished apps across multiple organizations. My core expertise includes Flutter and Dart, along with Firebase, REST APIs, GraphQL, WebSockets, and real-time communication using Agora. I have hands-on experience with state management solutions such as BLoC, Riverpod, GetX, and Provider, and I regularly work with MVC and Clean Architecture principles. My focus is on creating smooth, reliable, and user-friendly mobile experiences that perform well in production environments.';

  static const String projectCount = '20+';
  static const String contactSubTitle =
      "Have a project, collaboration idea, or opportunity? Let's team up and bring your idea to life!";
  static const String repliesWithin24Hours = 'I typically respond to all inquiries within 24 hours';
  static const String address = 'Lahore, Pakistan (GMT +5)';
  static const String whatsappUrl = 'https://wa.me/+923234895585?text=Hi,%20i%20need%20a%20flutter%20dev';

  static String get footer => '© Copyright ${DateTime.now().year}. All Rights Reserved by Hassan Bin Salim';
}

class NavItem {
  const NavItem(this.id, this.label);

  final String id;
  final String label;
}

const List<NavItem> navItems = [
  NavItem('home', 'Home'),
  NavItem('about', 'About'),
  NavItem('skills', 'My Skills'),
  NavItem('experience', 'Experience'),
  NavItem('projects', 'My Projects'),
  NavItem('education', 'Education'),
  NavItem('contact', 'Contact'),
];
