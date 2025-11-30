import 'dart:convert';

SkillModel skillModelFromMap(String str) => SkillModel.fromMap(json.decode(str));

String skillModelToMap(SkillModel data) => json.encode(data.toMap());

class SkillModel {
  String? title;
  List<String>? skills;

  SkillModel({this.title, this.skills});

  factory SkillModel.fromMap(Map<String, dynamic> json) => SkillModel(
    title: json["title"],
    skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
  };
}
