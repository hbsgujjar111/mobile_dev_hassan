import 'dart:convert';

ExperienceModel experienceModelFromMap(String str) => ExperienceModel.fromMap(json.decode(str));

String experienceModelToMap(ExperienceModel data) => json.encode(data.toMap());

class ExperienceModel {
  String? designation;
  String? company;
  String? location;
  DateTime? startTime;
  DateTime? endTime;
  List<String>? responsibilities;

  ExperienceModel({this.designation, this.company, this.location, this.startTime, this.endTime, this.responsibilities});

  factory ExperienceModel.fromMap(Map<String, dynamic> json) => ExperienceModel(
    designation: json["designation"],
    company: json["company"],
    location: json["location"],
    startTime: json["start-time"] == null ? null : DateTime.parse(json["start-time"]),
    endTime: json["end-time"] == null ? null : DateTime.parse(json["end-time"]),
    responsibilities:
        json["responsibilities"] == null ? [] : List<String>.from(json["responsibilities"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "designation": designation,
    "company": company,
    "location": location,
    "start-time":
        "${startTime!.year.toString().padLeft(4, '0')}-${startTime!.month.toString().padLeft(2, '0')}-${startTime!.day.toString().padLeft(2, '0')}",
    "end-time":
        "${endTime!.year.toString().padLeft(4, '0')}-${endTime!.month.toString().padLeft(2, '0')}-${endTime!.day.toString().padLeft(2, '0')}",
    "responsibilities": responsibilities == null ? [] : List<dynamic>.from(responsibilities!.map((x) => x)),
  };
}
