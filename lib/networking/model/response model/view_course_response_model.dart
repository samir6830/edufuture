

// To parse this JSON data, do
//
//     final viewCourseResponseModel = viewCourseResponseModelFromJson(jsonString);

import 'dart:convert';

ViewCourseResponseModel viewCourseResponseModelFromJson(String str) => ViewCourseResponseModel.fromJson(json.decode(str));

String viewCourseResponseModelToJson(ViewCourseResponseModel data) => json.encode(data.toJson());

class ViewCourseResponseModel {
  ViewCourseResponseModel({
    this.success,
  });

  List<ViewCourseData>? success;

  factory ViewCourseResponseModel.fromJson(Map<String, dynamic> json) => ViewCourseResponseModel(
    success: List<ViewCourseData>.from(json["success"].map((x) => ViewCourseData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": List<dynamic>.from(success!.map((x) => x.toJson())),
  };
}

class ViewCourseData {
  ViewCourseData({
    this.id,
    this.courseId,
    this.name,
    this.displayOrder,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.isDeleted,
  });

  int? id;
  int? courseId;
  String? name;
  int? displayOrder;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  String? isDeleted;

  factory ViewCourseData.fromJson(Map<String, dynamic> json) => ViewCourseData(
    id: json["id"],
    courseId: json["course_id"],
    name: json["name"],
    displayOrder: json["display_order"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
    isDeleted: json["is_deleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_id": courseId,
    "name": name,
    "display_order": displayOrder,
    "created_by": createdBy,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "status": status,
    "is_deleted": isDeleted,
  };
}
