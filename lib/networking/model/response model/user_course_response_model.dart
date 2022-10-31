
// To parse this JSON data, do
//
//     final userCourseResponseModel = userCourseResponseModelFromJson(jsonString);

import 'dart:convert';

UserCourseResponseModel userCourseResponseModelFromJson(String str) => UserCourseResponseModel.fromJson(json.decode(str));

String userCourseResponseModelToJson(UserCourseResponseModel data) => json.encode(data.toJson());

class UserCourseResponseModel {
  UserCourseResponseModel({
    this.success,
  });

  List<CourseData>? success;

  factory UserCourseResponseModel.fromJson(Map<String, dynamic> json) => UserCourseResponseModel(
    success: List<CourseData>.from(json["success"].map((x) => CourseData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": List<dynamic>.from(success!.map((x) => x.toJson())),
  };
}

class CourseData {
  CourseData({
    this.id,
    this.name,
    this.description,
    this.sendCertificate,
    this.courseStartDate,
    this.publishDate,
    this.displayOrder,
    this.duration,
    this.dailyDuration,
    this.expiryType,
    this.expiryDate,
    this.successClass,
    this.grade,
    this.student,
    this.coverImage,
    this.fileUrl,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.teacherName,
  });

  int? id;
  String? name;
  String? description;
  String? sendCertificate;
  DateTime? courseStartDate;
  DateTime? publishDate;
  int? displayOrder;
  int? duration;
  int? dailyDuration;
  String? expiryType;
  DateTime? expiryDate;
  String? successClass;
  String? grade;
  String? student;
  String? coverImage;
  String? fileUrl;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? isDeleted;
  String? teacherName;

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    sendCertificate: json["send_certificate"],
    courseStartDate: DateTime.parse(json["course_start_date"]),
    publishDate: DateTime.parse(json["publish_date"]),
    displayOrder: json["display_order"],
    duration: json["duration"],
    dailyDuration: json["daily_duration"],
    expiryType: json["expiry_type"],
    expiryDate: DateTime.parse(json["expiry_date"]),
    successClass: json["class"],
    grade: json["grade"],
    student: json["student"],
    coverImage: json["cover_image"],
    fileUrl: json["file_url"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isDeleted: json["is_deleted"],
    teacherName: json["teacher_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "send_certificate": sendCertificate,
    "course_start_date": "${courseStartDate!.year.toString().padLeft(4, '0')}-${courseStartDate!.month.toString().padLeft(2, '0')}-${courseStartDate!.day.toString().padLeft(2, '0')}",
    "publish_date": "${publishDate!.year.toString().padLeft(4, '0')}-${publishDate!.month.toString().padLeft(2, '0')}-${publishDate!.day.toString().padLeft(2, '0')}",
    "display_order": displayOrder,
    "duration": duration,
    "daily_duration": dailyDuration,
    "expiry_type": expiryType,
    "expiry_date": "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
    "class": successClass,
    "grade": grade,
    "student": student,
    "cover_image": coverImage,
    "file_url": fileUrl,
    "created_by": createdBy,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "is_deleted": isDeleted,
    "teacher_name": teacherName,
  };
}
