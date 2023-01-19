
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_user_example/components/constant/constants.dart';

class ApiRepository  {


  static Map<String, String> header = HashMap();
  static String apiUrl = Constants.BASIC_API_URL;

  static Map<String, String> _setDefaultHeader() {
    header[HttpHeaders.contentTypeHeader] = Constants.TYPE_HEADER;
    return header;
  }

  static Future<http.Response> httpPost(
      String path,
      {Map<String, dynamic>? params, Map<String, dynamic>? body}) async
  {
    var uri = Uri.parse(apiUrl + path);
    uri.replace(queryParameters: params);
    if (body != null) {
      Get.log("body : ${body.values}");
    }

    var response = await http.post(uri, headers: _setDefaultHeader(), body: json.encode(body));

    Get.log("response : ${response.statusCode}");
    return Future.value(response);
  }

  static Future<http.Response> httpLoginPost(String path, {Map<String, dynamic>? params , Map<String, dynamic>? body}) {
    var uri = Uri.parse(apiUrl+ path);

    var response = http.post(uri , headers: _setDefaultHeader(), body: json.encode(body));
    return Future.value(response);

  }



}