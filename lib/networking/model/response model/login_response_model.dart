// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.success,
  });

  Success? success;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    success: Success.fromJson(json["success"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success!.toJson(),
  };
}

class Success {
  Success({
    this.userId,
    this.email,
  });

  int? userId;
  String? email;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
    userId: json["userId"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "email": email,
  };
}
