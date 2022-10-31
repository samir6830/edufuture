

import 'dart:async';

import 'package:edufuture/networking/model/response%20model/user_course_response_model.dart';
import 'package:edufuture/networking/repository/Repositoryes.dart';

import '../model/request model/user_class_request_model.dart';
import '../response.dart';

class UserCourseBloc {
  late UserCourseRepository userCourseRepository;
  late StreamController userCourseController;

  StreamSink get dataSink =>
      userCourseController.sink;

  Stream get dataStream =>
      userCourseController.stream;

  UserCourseBloc() {
    userCourseController = StreamController();
    userCourseRepository = UserCourseRepository();
  }


  userCourse(UserClassRequestModel userClassRequestModel) async {
    dataSink.add(Response.loading('get user course'));
    try {
      UserCourseResponseModel userClassData =
      await userCourseRepository.userCourse(userClassRequestModel);

      print(userClassData);
      dataSink.add(Response.completed(userClassData));
    } catch (e) {
      dataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    userCourseController.close();
  }
}