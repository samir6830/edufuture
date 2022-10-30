
import 'dart:async';

import 'package:edufuture/networking/model/response%20model/user_lecture_response_model.dart';
import 'package:edufuture/networking/repository/Repositoryes.dart';

import '../model/request model/user_class_request_model.dart';
import '../response.dart';

class UserLectureBloc {
  late UserLectureRepository userLectureRepository;
  late StreamController userLectureController;

  StreamSink get dataSink =>
      userLectureController.sink;

  Stream get dataStream =>
      userLectureController.stream;

  UserLectureBloc() {
    userLectureController = StreamController();
    userLectureRepository = UserLectureRepository();
  }


  userLecture(UserClassRequestModel userClassRequestModel) async {
    dataSink.add(Response.loading('get user lecture'));
    try {
      UserLectureResponseModel userClassData =
      await userLectureRepository.userLecture(userClassRequestModel);

      print(userClassData);
      dataSink.add(Response.completed(userClassData));
    } catch (e) {
      dataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    userLectureController.close();
  }
}