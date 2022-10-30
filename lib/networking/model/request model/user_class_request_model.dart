// To parse this JSON data, do
//
//     final userClassRequestModel = userClassRequestModelFromJson(jsonString);

import 'dart:convert';

UserClassRequestModel userClassRequestModelFromJson(String str) => UserClassRequestModel.fromJson(json.decode(str));

String userClassRequestModelToJson(UserClassRequestModel data) => json.encode(data.toJson());

class UserClassRequestModel {
  UserClassRequestModel({
    this.uaserId,
  });

  int? uaserId;

  factory UserClassRequestModel.fromJson(Map<String, dynamic> json) => UserClassRequestModel(
    uaserId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": uaserId,
  };
}
