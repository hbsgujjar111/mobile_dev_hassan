import 'dart:convert';

ProjectModel projectModelFromMap(String str) => ProjectModel.fromMap(json.decode(str));

String projectModelToMap(ProjectModel data) => json.encode(data.toMap());

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

  factory ProjectModel.fromMap(Map<String, dynamic> json) => ProjectModel(
    title: json["title"],
    description: json["description"] == null ? [] : List<String>.from(json["description"]!.map((x) => x)),
    technologies: json["technologies"] == null ? [] : List<String>.from(json["technologies"]!.map((x) => x)),
    achievements: json["achievements"] == null ? [] : List<String>.from(json["achievements"]!.map((x) => x)),
    graphic: json["graphic"],
    android: json["android"],
    apple: json["apple"],
    huawei: json["huawei"],
    windows: json["windows"],
    mac: json["mac"],
    web: json["web"],
    company: json["company"],
    showProject: json["show_project"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "description": description == null ? [] : List<dynamic>.from(description!.map((x) => x)),
    "technologies": technologies == null ? [] : List<dynamic>.from(technologies!.map((x) => x)),
    "achievements": achievements == null ? [] : List<dynamic>.from(achievements!.map((x) => x)),
    "graphic": graphic,
    "android": android,
    "apple": apple,
    "huawei": huawei,
    "windows": windows,
    "mac": mac,
    "web": web,
    "company": company,
    "show_project": showProject,
  };
}
