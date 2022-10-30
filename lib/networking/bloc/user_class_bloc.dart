


import 'dart:async';

import 'package:edufuture/networking/model/request%20model/user_class_request_model.dart';
import 'package:edufuture/networking/model/response%20model/user_class_response_model.dart';
import 'package:edufuture/networking/repository/Repositoryes.dart';

import '../response.dart';

class UserClassBloc {
  late UserClassRepository userClassRepository;
  late StreamController userClassController;

  StreamSink get dataSink =>
      userClassController.sink;

  Stream get dataStream =>
      userClassController.stream;

  UserClassBloc() {
    userClassController = StreamController();
    userClassRepository = UserClassRepository();
  }


  userClass(UserClassRequestModel userClassRequestModel) async {
    dataSink.add(Response.loading('get user class'));
    try {
      UserClassResponseModel userClassData =
      await userClassRepository.userClass(userClassRequestModel);

      print(userClassData);
      dataSink.add(Response.completed(userClassData));
    } catch (e) {
      dataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    userClassController.close();
  }
}