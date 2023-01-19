

import 'dart:convert';

import 'package:flutter_user_example/model/account.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

import '../repository/account_repository.dart';

class AccountController extends GetxController {
  LoginToken loginToken = LoginToken();

  final AccountRepository accountRepository = AccountRepository();

  Future<bool> signUp (SignUpParams params) async {
    http.Response response = await accountRepository.signUpPost(params);
    if(HttpStatus.created == response.statusCode) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signIn(SignInParams params) async {
    http.Response response = await accountRepository.signInPost(params);

    if (HttpStatus.ok == response.statusCode) {
      Map jsonMap = jsonDecode(utf8.decode(response.bodyBytes));
      loginToken = LoginToken.fromJson(jsonMap);
      Get.log("${loginToken.email} : ${loginToken.username}");
      // 여기서 header 에 access token 넣고
      // refresh token storage 에 저장
      return true;
    } else {
      return false;
    }
  }


}