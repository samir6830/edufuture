
import 'dart:async';

import '../model/request model/login_request_model.dart';
import '../model/response model/login_response_model.dart';
import '../repository/Repositoryes.dart';
import '../response.dart';


class LoginBloc {
  late LoginRepository _loginRepository;
  late StreamController _loginBlocController;

  StreamSink get loginDataSink =>
      _loginBlocController.sink;

  Stream get loginStream =>
      _loginBlocController.stream;

  LoginBloc() {
    _loginBlocController = StreamController();
    _loginRepository = LoginRepository();
  }



  loginUser(LoginRequestModel loginRequestModel) async {
    loginDataSink.add(Response.loading('login'));
    try {
      LoginResponseModel registerData =
      await _loginRepository.login(loginRequestModel);

      print(registerData);
      loginDataSink.add(Response.completed(registerData));
    } catch (e) {
      loginDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _loginBlocController.close();
  }
}