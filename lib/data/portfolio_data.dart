import 'models.dart';

final experiences = [
  ExperienceModel(
    company: "United Software and Technologies International (USTI)",
    designation: "Senior Flutter Dev",
    location: "Lahore",
    startTime: DateTime(2025, 01, 06),
    endTime: null,
    responsibilities: [
      "Refactored legacy Flutter codebase, improved performance by 30%, and updated packages.",
      "Collaborated with designers and backend teams to enhance app UX and stability.",
    ],
  ),
  ExperienceModel(
    company: "CMC M-Tech",
    designation: "Senior Flutter Dev",
    location: "Lahore",
    startTime: DateTime(2021, 08, 01),
    endTime: DateTime(2024, 12, 31),
    responsibilities: [
      "Delivered 20+ Flutter applications using Riverpod, GetX, and Firebase across various industries.",
      "Spearheaded clean code practices and introduced performance profiling in the team workflow.",
      "Mentored junior developers and led code reviews to ensure scalable architecture.",
    ],
  ),
  ExperienceModel(
    company: "Elite International Education Group Inc.",
    designation: "Flutter Dev",
    location: "Lahore",
    startTime: DateTime(2021, 02, 01),
    endTime: DateTime(2021, 07, 31),
    responsibilities: [
      "Contributed to the development of ed-tech mobile solutions with Flutter and Firebase.",
      "Enhanced application UI and reduced loading times by optimizing widget structure.",
    ],
  ),
];

final educations = [
  EducationModel(
    degree: "Bachelor of Computer Science (BS-CS)",
    school: "University of Gujrat",
    location: "Lahore",
    startTime: DateTime(2017, 10),
    endTime: DateTime(2021, 07),
  ),
  EducationModel(
    degree: "Intermediate (Pre-Engineering)",
    school: "Govt. Islamia College Civil Lines",
    location: "Lahore",
    startTime: DateTime(2015, 10),
    endTime: DateTime(2017, 07),
  ),
  EducationModel(
    degree: "Matriculation (Biology)",
    school: "Unique School System",
    location: "Lahore",
    startTime: DateTime(2013, 10),
    endTime: DateTime(2015, 07),
  ),
];

final skillsList = [
  SkillModel(
    title: "Mobile Development",
    skills: [
      "Flutter",
      "Dart",
      "Firebase Auth",
      "Firebase Firestore",
      "Firebase ML Kit",
      "REST APIs",
      "GraphQL",
      "WebSockets",
      "Agora SDK",
    ],
  ),
  SkillModel(
    title: "Architecture & State Management",
    skills: ["BLoC", "Riverpod", "GetX", "Provider", "MVC", "Clean Architecture"],
  ),
  SkillModel(
    title: "Tools, Languages & Soft Skills",
    skills: [
      "Git",
      "VS Code",
      "Android Studio",
      "Postman",
      "Figma",
      "Python",
      "Java",
      "C++",
      "PHP",
      "Django",
      "Team Leadership",
      "Project Management",
      "Problem Solving",
      "Communication",
    ],
  ),
];

const List<PackageModel> packagesList = [
  PackageModel(
    name: "animated_stack_plus",
    description:
        'A flexible and modern animated Floating Action Button (FAB) stack for Flutter featuring highly customizable items, custom animation builders, and smooth visual feedback.',
    url: "https://pub.dev/packages/animated_stack_plus",
  ),
  PackageModel(
    name: "form_field_adapter",
    description:
        'An interactive, focus-aware FormField wrapper for custom inputs designed with delightful state-based visual decorations, animated shake feedback, and integrated haptic sensations.',
    url: "https://pub.dev/packages/form_field_adapter",
  ),
  PackageModel(
    name: "responsive_cloud_image",
    description:
        'An automated utility designed to scale and optimize cloud-hosted images dynamically across device viewports, enhancing network performance and ensuring pixel-perfect screen layouts.',
    url: "https://pub.dev/packages/responsive_cloud_image",
  ),
  PackageModel(
    name: "flutter_rebrand_kit",
    description:
        'An all-in-one CLI tool to rebrand Flutter apps, update package IDs, generate launcher & notification icons, native splash screens, and Play Store graphics.',
    url: "https://pub.dev/packages/flutter_rebrand_kit",
  ),
];

final projects = [
  ProjectModel(
    title: "myUTS",
    description: [
      "myUTS is a vehicle tracking and fleet management application designed for real-time monitoring and operational visibility.",
      "The app allows users to track all registered vehicles with live location updates, alerts, and notifications.",
      "Users can view detailed vehicle information through a 360-degree overview that includes status, activity, and trip data.",
      "Trip history is visualized using paths and polygons, making it easy to analyze routes and movement patterns.",
      "The application provides analytics through graphs and reports to help users understand usage and performance trends.",
      "Additional modules include vehicle management, driver management, user activity logs, and customer care configuration.",
      "The app also features an executive mode where executives can view sales data filtered by custom date ranges.",
      "For improved user experience, incoming notifications are announced using voice alerts.",
      "The project was an existing production app, and my role focused on maintenance, stability improvements, and architectural upgrades.",
    ],
    technologies: ["Flutter", "GetX", "Provider", "Riverpod", "Firebase", "Google Maps", "REST APIs"],
    achievements: [
      "Reduced application crashes by approximately 80% by identifying and fixing critical stability issues using Firebase Analytics.",
      "Resolved multiple push notification delivery and reliability issues across the application.",
      "Redesigned and rebuilt the app with an updated UI/UX to improve usability and visual consistency.",
      "Migrated the codebase toward a feature-based clean architecture with a clearer and more maintainable folder structure.",
      "Introduced Riverpod for modern state management while working within an existing codebase that used Provider and GetX.",
      "Improved overall app performance, readability, and long-term maintainability through refactoring and architectural cleanup.",
    ],
    graphic: "/images/images/projects/my-uts.webp",
    android: "https://play.google.com/store/apps/details?id=com.uts.utstrackingapp",
    apple: "https://apps.apple.com/pk/app/myuts/id1613698217",
    huawei: "https://appgallery.huawei.com/app/C107385877",
    windows: null,
    mac: null,
    web: null,
    company: "USTI",
    showProject: true,
  ),
  ProjectModel(
    title: "EFS Attend",
    description: [
      "EFS Attend is a mobile attendance management application built for field-based and on-site teams.",
      "The app enables team leads to manage their teams by adding users and registering facial data directly within the application.",
      "Attendance is marked using face recognition by capturing a single image, eliminating the need for manual check-ins.",
      "Face recognition is integrated using on-device machine learning to ensure fast and reliable performance.",
      "The application follows an offline-first approach, allowing attendance to be recorded even without an internet connection.",
      "All offline data is securely stored in a local database for up to 45 days and automatically synced when connectivity is restored.",
      "Location-based geofencing ensures attendance can only be marked within approved work areas.",
      "To prevent misuse, the app blocks attendance marking if the device time is not properly synchronized.",
      "The solution is developed in Flutter and supports both Android and iOS platforms.",
    ],
    technologies: ["Flutter", "Provider", "Firebase ML Kit", "TensorFlow", "SQLite", "Firebase"],
    achievements: [
      "Implemented face recognition–based attendance using TensorFlow Lite and ML Kit with approximately 99% accuracy.",
      "Designed and implemented an offline-first architecture with local data retention for up to 45 days.",
      "Built seamless background synchronization to upload stored attendance data once internet access becomes available.",
      "Integrated geofencing to restrict attendance marking to authorized physical locations.",
      "Added device time validation to prevent attendance fraud caused by manual time changes.",
      "Developed complete team management workflows allowing team leads to add users and register facial profiles.",
    ],
    graphic: "/images/images/projects/efs.webp",
    android: "https://play.google.com/store/apps/details?id=com.efs.efs_attend.efs_new",
    apple: "https://apps.apple.com/pk/app/efs-attend/id1586428507",
    huawei: null,
    windows: null,
    mac: null,
    web: null,
    company: "CMC M-Tech",
    showProject: true,
  ),
  ProjectModel(
    title: "Pantheon Coffee",
    description: [
      "Pantheon Coffee is a multi-role mobile application developed for a coffee house chain to manage sales, loyalty, and customer engagement.",
      "The app supports three roles: Admin, Barista/Shop Owner, and Customer, each with dedicated features and workflows.",
      "Admins can monitor live sales across all branches through graphical dashboards and manage outlets, users, products, and feedback.",
      "Baristas and shop owners handle daily operations such as adding sales, managing invoices, and interacting with the loyalty system.",
      "Invoices can be created by capturing receipt images, where OCR is used to automatically extract and fill invoice details.",
      "Customers can explore outlets, view menus, track their order history, and engage with the loyalty program.",
      "The app includes a points-based rewards system where users unlock free products based on accumulated points.",
      "All users can manage their profiles, receive push notifications, and close their accounts if needed.",
      "The application allows customers to create accounts independently without staff involvement.",
    ],
    technologies: ["Flutter", "GetX", "Laravel for REST API", "Firebase", "OCR", "REST APIs"],
    achievements: [
      "Designed and implemented a complete multi-role system with clearly separated admin, barista, and customer workflows.",
      "Built real-time sales dashboards for admins to track branch-wise performance using graphical visualizations.",
      "Implemented OCR-based invoice creation by extracting receipt data through image capture to reduce manual data entry.",
      "Developed a loyalty and rewards system enabling point earning, redemption, and product unlocking based on thresholds.",
      "Automated customer account creation during sales when a user does not already exist, with secure first-login password reset flow.",
      "Enabled QR code scanning for free coffee redemptions and loyalty interactions.",
      "Implemented sales, order history, and feedback viewing for both operational staff and customers.",
      "Integrated push notifications across all roles for updates, offers, and system events.",
    ],
    graphic: "/images/images/projects/pantheon.webp",
    android: "https://play.google.com/store/apps/details?id=app.mtech.pantheon_cafe",
    apple: "https://apps.apple.com/pk/app/pantheon-coffee/id6737890124",
    huawei: null,
    windows: null,
    mac: null,
    web: null,
    company: "CMC M-Tech",
    showProject: true,
  ),
  ProjectModel(
    title: "Sehat Sahoolat",
    description: [
      "Sehat Sahoolat is a telehealth mobile application designed to connect patients and doctors through secure virtual consultations.",
      "Both patients and doctors can sign up, complete their profiles, and manage appointments using real-time video calling.",
      "Appointments are scheduled based on user time zones to ensure accurate and reliable consultation timing.",
      "During consultations, doctors can add prescriptions and consultation notes that patients can access and download later.",
      "Patients maintain a complete Electronic Medical Record (EMR) by entering personal health data, medical history, and reports.",
      "The EMR includes family history, habits, allergies, medications, medical tests, and key vitals such as heart rate, BMI, and blood group.",
      "Patients can select consultation packages and manage their appointments directly from the app.",
      "Doctors can manage their professional profiles, including expertise, work experience, and supporting documents.",
      "The app supports multi-device management, profile updates, account closure, and secure access across sessions.",
    ],
    technologies: ["Flutter", "GetX", "Agora", "Firebase"],
    achievements: [
      "Implemented real-time video consultations using Agora for reliable doctor–patient communication.",
      "Built a structured EMR system allowing patients to create, manage, and download complete medical records at any time.",
      "Developed timezone-aware appointment scheduling to support users across different regions.",
      "Enabled doctors to add prescriptions and consultation notes during live sessions with persistent patient access.",
      "Implemented bidirectional feedback functionality allowing patients and doctors to review each other.",
      "Created doctor finance management features to track earnings and consultation-related income.",
      "Added role flexibility allowing doctors to switch to patient mode and manage EMRs for themselves and their family members.",
      "Implemented secure device management to control active sessions across multiple devices.",
      "Developed full account management features including profile editing and account closure for all users.",
    ],
    graphic: "/images/images/projects/sehat-sahoolat.webp",
    android: "https://play.google.com/store/apps/details?id=com.app.sehat_sahoolat",
    apple: "https://apps.apple.com/pk/app/sehat-sahoolat/id6444405734",
    huawei: null,
    windows: null,
    mac: null,
    web: null,
    company: "CMC M-Tech",
    showProject: true,
  ),
  ProjectModel(
    title: "RF Pro",
    description: [
      "RF Pro is a restaurant management application designed to help waiters and floor managers manage orders, tables, and daily restaurant operations from one place.",
      "Restaurant staff can log in using their email and password or use a 4-digit PIN for faster access during busy operations.",
      "Waiters can create orders, assign tables, add items to existing orders, customize items with extras and toppings, add tips, and print receipts directly from the application.",
      "Floor managers have additional controls to change table and waiter assignments and modify orders when required.",
      "Each restaurant table has a unique QR code that customers can scan to check their order status and request assistance from the assigned waiter.",
      "When a customer calls a waiter, the assigned waiter receives a push notification identifying the table that needs assistance.",
      "Customers can also submit feedback through the application based on their dining experience.",
      "The application supports pre-booked orders, allowing staff to mark customers as arrived and continue the normal order process.",
      "Sensitive order modifications are protected with a secure PIN to prevent unauthorized changes.",
      "RF Pro works across mobile and tablet devices and is connected with the RF Pro CP application to manage the complete restaurant order workflow.",
    ],
    technologies: ["Flutter", "GetX", "REST APIs", "Push Notifications", "Bluetooth Printing"],
    achievements: [
      "Implemented separate workflows and permissions for waiters and floor managers.",
      "Added 4-digit PIN login for faster access during busy restaurant operations.",
      "Built complete order management including new orders, existing order updates, table assignment, customization, tips, and receipt printing.",
      "Added support for item-level extras and topping options, allowing waiters to customize customer orders.",
      "Implemented secure PIN-based authorization for sensitive order modifications.",
      "Added table and waiter reassignment controls for floor managers.",
      "Implemented QR code-based table identification, allowing customers to check their order status directly from their table.",
      "Built a waiter calling system where customers can request assistance and the assigned waiter receives a push notification with the table number.",
      "Implemented customer feedback functionality for collecting feedback directly through the application.",
      "Implemented pre-booking management, allowing staff to handle reserved customers from arrival through order completion.",
      "Built the front-of-house application to work with the kitchen and cashier workflows in RF Pro CP.",
    ],
    graphic: "/images/images/projects/rf-pro.webp",
    android: "https://play.google.com/store/apps/details?id=app.mtech.rf_pro",
    apple: "https://apps.apple.com/pk/app/rf-pro/id6478156048",
    huawei: null,
    windows: null,
    mac: null,
    web: null,
    company: "CMC M-Tech",
    showProject: true,
  ),
  ProjectModel(
    title: "RF Pro CP",
    description: [
      "RF Pro CP is a restaurant kitchen and cashier management application designed for Windows desktop and tablet devices.",
      "Orders created through RF Pro are sent to the appropriate kitchen where staff can manage incoming orders and update their status from cooking to served.",
      "Kitchen staff can switch between multiple kitchens when a restaurant has separate kitchen operations.",
      "The kitchen screen includes timers for complete orders as well as individual items, including items added to an existing order later.",
      "The application also includes a complete cashier system for managing running orders, collecting payments, applying discounts, and completing orders.",
      "Cashiers can temporarily hold orders and continue processing them later without losing the order details.",
      "Orders can be filtered using dynamically configured categories such as dine-in, takeaway, and delivery platforms such as Foodpanda.",
      "Payment methods and discount options are dynamic, allowing the restaurant to support different payment types such as cash and card.",
      "Cashiers can print receipts, manage completed and running orders, and print receipts for previous orders.",
      "The register system allows cashiers to open the register at the start of the day and close it at the end, with transactions handled while the register is open.",
      "Cashiers can export order reports containing completed and running orders along with their total values.",
      "RF Pro CP is connected with RF Pro through REST APIs and works as part of the same restaurant management ecosystem.",
    ],
    technologies: ["Flutter", "GetX", "REST APIs", "Bluetooth Printing"],
    achievements: [
      "Built the kitchen workflow to receive and process orders from the RF Pro waiter application.",
      "Implemented order status management from incoming orders through cooking and served states.",
      "Added support for multiple kitchens with the ability to switch between different kitchen operations.",
      "Implemented order and item-level timers to track preparation time, including items added to existing orders.",
      "Developed a complete cashier workflow with register opening and closing controls for daily operations.",
      "Implemented order hold functionality, allowing cashiers to temporarily pause orders and resume them later.",
      "Added dynamic order filtering based on categories such as dine-in, takeaway, and delivery platforms including Foodpanda.",
      "Implemented dynamic payment methods, discounts, and card-specific discount handling.",
      "Added secure PIN verification for cashier order modifications to confirm staff identity.",
      "Implemented Bluetooth receipt printing for restaurant transactions.",
      "Added management of running and completed orders, including receipt printing for previous orders.",
      "Built order reporting and export functionality showing completed and running orders with their corresponding values.",
      "Developed the application for Windows desktop and tablet platforms using Flutter and GetX.",
    ],
    graphic: "/images/images/projects/rf-pro-cp.webp",
    android: "https://play.google.com/store/apps/details?id=app.mtech.rf_pro_cp",
    apple: null,
    huawei: null,
    windows: "windows",
    mac: null,
    web: null,
    company: "CMC M-Tech",
    showProject: true,
  ),
];

// ---- contact ----

const String myGmail = "mobiledevhassan@gmail.com";
const String myNumber = "+92 323 4895585";
const String linkedInURL = "https://www.linkedin.com/in/hassanbinsalim";
const String stackOverflowURL = "https://stackoverflow.com/users/15538425/hassan-gujjar";
const String gitHubURL = "https://github.com/hbsgujjar111";

final List<String> whyHireMe = [
  "Over ${experienceYearsText()} years of hands-on Flutter experience delivering complete mobile applications from concept to production.",
  "Strong understanding of mobile architecture with practical experience using BLoC, Riverpod, GetX, Provider, MVC, and Clean Architecture.",
  "Proven expertise in integrating Firebase, REST APIs, GraphQL, WebSockets, and real-time application features.",
  "Experience leading development efforts, reviewing code, and maintaining high engineering standards across teams.",
  "A practical problem-solver with the ability to handle complex UI requirements, performance optimizations, and third-party integrations.",
  "A quality-driven mindset with a focus on writing clean, scalable, and maintainable code.",
  "Clear and reliable communicator who collaborates effectively with designers, backend engineers, and product stakeholders.",
  "Strong sense of ownership, consistently meeting commitments and delivering results on time.",
];

// ---- experience years (evaluated at BUILD time with static generation) ----
String experienceYearsText() {
  final start = DateTime(2021, 2, 1);
  final now = DateTime.now();
  int years = now.year - start.year;
  int months = now.month - start.month;
  if (now.day < start.day) months--;
  if (months < 0) {
    years--;
    months += 12;
  }
  if (years == 0) return months == 0 ? 'Just started' : '$months months of experience';
  if (months <= 2) return '$years+';
  if (months <= 8) return '$years.5';
  return 'Almost ${years + 1}';
}
