

// To parse this JSON data, do
//
//     final viewCourseRequestModel = viewCourseRequestModelFromJson(jsonString);

import 'dart:convert';

ViewCourseRequestModel viewCourseRequestModelFromJson(String str) => ViewCourseRequestModel.fromJson(json.decode(str));

String viewCourseRequestModelToJson(ViewCourseRequestModel data) => json.encode(data.toJson());

class ViewCourseRequestModel {
  ViewCourseRequestModel({
    this.courseId,
  });

  int? courseId;

  factory ViewCourseRequestModel.fromJson(Map<String, dynamic> json) => ViewCourseRequestModel(
    courseId: json["course_id"],
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
  };
}
