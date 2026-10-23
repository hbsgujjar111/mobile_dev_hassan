class ExperienceModel {
  String? designation;
  String? company;
  String? location;
  DateTime? startTime;
  DateTime? endTime;
  List<String>? responsibilities;

  ExperienceModel({this.designation, this.company, this.location, this.startTime, this.endTime, this.responsibilities});
}

class EducationModel {
  String? school;
  String? degree;
  DateTime? startTime;
  DateTime? endTime;
  String? location;

  EducationModel({this.school, this.degree, this.startTime, this.endTime, this.location});
}

class SkillModel {
  String? title;
  List<String>? skills;

  SkillModel({this.title, this.skills});
}

class PackageModel {
  final String name;
  final String description;
  final String url;

  const PackageModel({required this.name, required this.description, required this.url});
}

class ProjectModel {
  String? title;
  List<String>? description;
  List<String>? technologies;
  List<String>? achievements;
  String? graphic;
  String? android;
  String? apple;
  String? huawei;
  String? windows;
  String? mac;
  String? web;
  String? company;
  bool? showProject;

  ProjectModel({
    this.title,
    this.description,
    this.technologies,
    this.achievements,
    this.graphic,
    this.android,
    this.apple,
    this.huawei,
    this.windows,
    this.mac,
    this.web,
    this.company,
    this.showProject,
  });
}
