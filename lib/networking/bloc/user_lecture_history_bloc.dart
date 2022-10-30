

import 'dart:async';

import 'package:edufuture/networking/model/response%20model/user_lecture_history_response_model.dart';
import 'package:edufuture/networking/repository/Repositoryes.dart';

import '../model/request model/user_class_request_model.dart';
import '../response.dart';

class UserLectureHistoryBloc {
  late UserLectureHistoryRepository userLectureHistoryRepository;
  late StreamController userLectureHistoryController;

  StreamSink get dataSink =>
      userLectureHistoryController.sink;

  Stream get dataStream =>
      userLectureHistoryController.stream;

  UserLectureHistoryBloc() {
    userLectureHistoryController = StreamController();
    userLectureHistoryRepository = UserLectureHistoryRepository();
  }


  userLectureHistory(UserClassRequestModel userClassRequestModel) async {
    dataSink.add(Response.loading('get user lecture history'));
    try {
      UserLectureHistoryResponseModel userClassData =
      await userLectureHistoryRepository.userLectureHistory(userClassRequestModel);

      print(userClassData);
      dataSink.add(Response.completed(userClassData));
    } catch (e) {
      dataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    userLectureHistoryController.close();
  }
}