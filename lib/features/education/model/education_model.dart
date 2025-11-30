import 'dart:convert';

EducationModel educationModelFromMap(String str) => EducationModel.fromMap(json.decode(str));

String educationModelToMap(EducationModel data) => json.encode(data.toMap());

class EducationModel {
  String? school;
  String? degree;
  DateTime? startTime;
  DateTime? endTime;
  String? location;

  EducationModel({this.school, this.degree, this.startTime, this.endTime, this.location});

  factory EducationModel.fromMap(Map<String, dynamic> json) => EducationModel(
    school: json["school"],
    degree: json["degree"],
    startTime: json["start-time"] == null ? null : DateTime.parse(json["start-time"]),
    endTime: json["end-time"] == null ? null : DateTime.parse(json["end-time"]),
    location: json["location"],
  );

  Map<String, dynamic> toMap() => {
    "school": school,
    "degree": degree,
    "start-time":
        "${startTime!.year.toString().padLeft(4, '0')}-${startTime!.month.toString().padLeft(2, '0')}-${startTime!.day.toString().padLeft(2, '0')}",
    "end-time":
        "${endTime!.year.toString().padLeft(4, '0')}-${endTime!.month.toString().padLeft(2, '0')}-${endTime!.day.toString().padLeft(2, '0')}",
    "location": location,
  };
}
