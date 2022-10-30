// To parse this JSON data, do
//
//     final userLectureResponseModel = userLectureResponseModelFromJson(jsonString);

import 'dart:convert';

UserLectureResponseModel userLectureResponseModelFromJson(String str) => UserLectureResponseModel.fromJson(json.decode(str));

String userLectureResponseModelToJson(UserLectureResponseModel data) => json.encode(data.toJson());

class UserLectureResponseModel {
  UserLectureResponseModel({
    this.success,
  });

  List<Lecture>? success;

  factory UserLectureResponseModel.fromJson(Map<String, dynamic> json) => UserLectureResponseModel(
    success: List<Lecture>.from(json["success"].map((x) => Lecture.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": List<dynamic>.from(success!.map((x) => x.toJson())),
  };
}

class Lecture {
  Lecture({
    this.id,
    this.name,
    this.description,
    this.code,
    this.email1,
    this.email2,
    this.isRestrict,
    this.isScreenRecord,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.meetingType,
    this.classes,
    this.students,
    this.grades,
    this.meetUrl,
    this.isTeacherLoggedin,
    this.duration,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.className,
    this.teacher,
    this.lecTime,
  });

  int? id;
  String? name;
  String? description;
  String? code;
  String? email1;
  String? email2;
  String? isRestrict;
  String? isScreenRecord;
  DateTime? startDate;
  String? startTime;
  DateTime? endDate;
  String? endTime;
  String? meetingType;
  String? classes;
  String? students;
  String? grades;
  String? meetUrl;
  String? isTeacherLoggedin;
  int? duration;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? isDeleted;
  String? className;
  String? teacher;
  String? lecTime;

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    code: json["code"],
    email1: json["email_1"],
    email2: json["email_2"],
    isRestrict: json["is_restrict"],
    isScreenRecord: json["is_screen_record"],
    startDate: DateTime.parse(json["start_date"]),
    startTime: json["start_time"],
    endDate: DateTime.parse(json["end_date"]),
    endTime: json["end_time"],
    meetingType: json["meeting_type"],
    classes: json["classes"],
    students: json["students"],
    grades: json["grades"],
    meetUrl: json["meet_url"],
    isTeacherLoggedin: json["is_teacher_loggedin"],
    duration: json["duration"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isDeleted: json["is_deleted"],
    className: json["class_name"],
    teacher: json["teacher"],
    lecTime: json["lec_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "code": code,
    "email_1": email1,
    "email_2": email2,
    "is_restrict": isRestrict,
    "is_screen_record": isScreenRecord,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "start_time": startTime,
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "end_time": endTime,
    "meeting_type": meetingType,
    "classes": classes,
    "students": students,
    "grades": grades,
    "meet_url": meetUrl,
    "is_teacher_loggedin": isTeacherLoggedin,
    "duration": duration,
    "created_by": createdBy,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "is_deleted": isDeleted,
    "class_name": className,
    "teacher": teacher,
    "lec_time": lecTime,
  };
}
