


import 'dart:convert';

import 'package:edufuture/networking/model/request%20model/user_class_request_model.dart';
import 'package:edufuture/networking/model/response%20model/user_class_response_model.dart';
import 'package:edufuture/networking/model/response%20model/user_course_response_model.dart';
import 'package:edufuture/networking/model/response%20model/user_lecture_history_response_model.dart';
import 'package:edufuture/networking/model/response%20model/user_lecture_response_model.dart';
import 'package:edufuture/networking/repository/ApiProvider.dart';

import '../../constants.dart';
import '../model/request model/login_request_model.dart';
import '../model/response model/login_response_model.dart';

class LoginRepository {
  final ApiProvider _apiProvider = ApiProvider();

  login(LoginRequestModel loginRequestModel) async {
    final response = await _apiProvider.post(loginApiUrl,
        body: jsonEncode(loginRequestModel));
    return LoginResponseModel.fromJson(response);
  }
}

class UserClassRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<UserClassResponseModel> userClass(
      UserClassRequestModel userClassRequestModel) async {
    final response = await _apiProvider.post(
      userClassApiUrl,
      body: jsonEncode(userClassRequestModel),
    );
    return UserClassResponseModel.fromJson(response);
  }
}

class UserLectureRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<UserLectureResponseModel> userLecture(
      UserClassRequestModel userClassRequestModel) async {
    final response = await _apiProvider.post(
      userLectureApiUrl,
      body: jsonEncode(userClassRequestModel),
    );
    return UserLectureResponseModel.fromJson(response);
  }
}

class UserLectureHistoryRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<UserLectureHistoryResponseModel> userLectureHistory(
      UserClassRequestModel userClassRequestModel) async {
    final response = await _apiProvider.post(
      userLectureHistoryApiUrl,
      body: jsonEncode(userClassRequestModel),
    );
    return UserLectureHistoryResponseModel.fromJson(response);
  }
}

class UserCourseRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<UserCourseResponseModel> userCourse(
      UserClassRequestModel userClassRequestModel) async {
    final response = await _apiProvider.post(
      userCourseApiUrl,
      body: jsonEncode(userClassRequestModel),
    );
    return UserCourseResponseModel.fromJson(response);
  }
}