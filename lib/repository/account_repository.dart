

import 'package:flutter_user_example/model/account.dart';
import 'package:flutter_user_example/repository/api_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

class AccountRepository {


  Future<http.Response> signUpPost(SignUpParams param) async {
    Map<String, dynamic> params = {
      "email" : param.email,
      "password" : param.password,
      "username" : param.username,
      "tel" : param.tel,
    };
    http.Response response = await ApiRepository.httpPost("/api/v1/users/signup",body: params);
    return Future.value(response);
  }

  Future<http.Response> signInPost(SignInParams param) async {
    Get.log("repo signInPost start!!!!");

    Map<String , dynamic> params = {
      "email" : param.email,
      "password" : param.password,
    };
    http.Response response = await ApiRepository.httpLoginPost("/api/v1/users/signin", body: params);
    if (response.statusCode == HttpStatus.ok) {

    }
    return Future.value(response);
  }

}