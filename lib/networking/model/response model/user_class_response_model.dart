// To parse this JSON data, do
//
//     final userClassResponseModel = userClassResponseModelFromJson(jsonString);

import 'dart:convert';

UserClassResponseModel userClassResponseModelFromJson(String str) => UserClassResponseModel.fromJson(json.decode(str));

String userClassResponseModelToJson(UserClassResponseModel data) => json.encode(data.toJson());

class UserClassResponseModel {
  UserClassResponseModel({
    this.success,
  });

  List<ClassData>? success;

  factory UserClassResponseModel.fromJson(Map<String, dynamic> json) => UserClassResponseModel(
    success: List<ClassData>.from(json["success"].map((x) => ClassData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": List<dynamic>.from(success!.map((x) => x.toJson())),
  };
}

class ClassData {
  ClassData({
    this.id,
    this.classId,
    this.teacherId,
    this.url,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.gradeName,
    this.className,
    this.teacherName,
  });

  int? id;
  int? classId;
  String? url;
  int? createdBy;
  int? teacherId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? isDeleted;
  String? gradeName;
  String? className;
  String? teacherName;

  factory ClassData.fromJson(Map<String, dynamic> json) => ClassData(
    id: json["id"],
    classId: json["class_id"],
    teacherId: json["teacher_id"],
    url: json["url"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isDeleted: json["is_deleted"],
    gradeName: json["grade_name"],
    className: json["class_name"],
    teacherName: json["teacher_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "class_id": classId,
    "teacher_id": teacherId,
    "url": url,
    "created_by": createdBy,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "is_deleted": isDeleted,
    "grade_name": gradeName,
    "class_name": className,
    "teacher_name": teacherName,
  };
}
