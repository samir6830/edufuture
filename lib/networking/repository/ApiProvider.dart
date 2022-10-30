import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';
import 'CustomException.dart';

class ApiProvider {
  Future<dynamic> tokenWithGet(String url) async {
    var responseJson;
    /*var token = await storage.read("loginToken");*/
    try {
      final response = await http.get(Uri.parse(baseUrl + url), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "Authorization": "Bearer " + "token",
      });
      print(url);

      responseJson = _response(response);
    } on SocketException {
      throw NoInternetException("No Internet Connection!");
    }
    return responseJson;
  }

  Future<dynamic> post(String url, {var body}) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(baseUrl + url),
          headers: {
            'Accept': 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> tokenWithPost(String url, {var body}) async {
    var responseJson;
    try {
      /*    var token = await storage.read("loginToken");*/
      final response = await http.post(Uri.parse(baseUrl + url),
          headers: {
            'Accept': 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            "Authorization": "Bearer " + "token",
          },
          body: body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 203:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 201:
      case 204:
        return "Success";
      case 302:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];
        throw BadRequestException(msg);
      case 401:
        var responseJson = json.decode(response.body.toString());
        Get.snackbar("Invalid Data", response.body.toString(),
            colorText: Colors.white);
        var msg = responseJson["message"];
        throw BadRequestException(msg);
      case 422:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];

        throw NoInternetException(msg);
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        var responseJson = json.decode(response.body.toString());
        var error = responseJson["errors"] ?? "";
        var msg = "";
        if (error != "") {
          msg = error["message"] ?? "";
        }
        throw BadRequestException(msg);
      // } else {
      //   throw BadRequestException(response.body.toString());
      // }
      case 502:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];
        throw BadRequestException(msg);
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
