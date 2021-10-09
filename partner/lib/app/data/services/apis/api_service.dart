import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:get/get.dart';

import '../../data.dart';

final baseUrl = 'https://drcomm.herokuapp.com/api';
// final baseUrl = 'http://10.147.20.91:5000/api';

class Api extends GetConnect {
  final auth = Get.find<PhoneAuthService>();
  final fcm = Get.find<FCMService>();
  static const int TIME_OUT_DURATION = 10;
  String bearerToken = '';

  Future<Api> init() async {
    Get.log('$runtimeType ready');
    return this;
  }

  Map<String, String> headers() => {"Authorization": "Bearer ${bearerToken}"};

  /// Logging in and getting bearer token
  ///
  Future login() async {
    final _extUrl = '/doctor/user/login';
    Map<String, String> body = {
      "uid": "${auth.fireUser!.uid}",
      "phno": "${auth.fireUser!.phoneNumber}"
    };
    Get.log("Sent Body: ${jsonEncode(body)}\nUrl: ${baseUrl + _extUrl}");

    await postReq(_extUrl, body, (resp) {
      this.bearerToken = resp['token'];
    });
    Get.log(bearerToken);
  }

  /// GLobal Functions
  Future<void> getReq(String extUrl, Function(dynamic resp) handleResp) async {
    // return;
    final _uri = Uri.parse(baseUrl + extUrl);

    try {
      var _resp = await get(
        _uri.toString(),
        headers: headers(),
      ).timeout(
        Duration(seconds: TIME_OUT_DURATION),
      );
      var _value = _processResponse(_resp);
      Get.log('$_uri\n${_value.toString()}');
      handleResp(_value);
      return;
    } on SocketException {
      throw FetchDataException('Connection Error', _uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', _uri.toString());
    }
  }

  Future<void> postReq(
    String extUrl,
    Map<String, dynamic> body,
    Function(dynamic resp) handleResp,
  ) async {
    // return;
    final _uri = Uri.parse(baseUrl + extUrl);

    try {
      var _resp = await post(
        _uri.toString(),
        jsonEncode(body),
        headers: headers(),
      ).timeout(
        Duration(seconds: TIME_OUT_DURATION),
      );
      var _value = _processResponse(_resp);
      Get.log('$_uri\n${_value.toString()}');

      handleResp(_value);
      return;
    } on SocketException {
      throw FetchDataException('Connection Error', _uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', _uri.toString());
    }
  }

  Future uploadImage(String extUrl, String title, File file) async {
    // return;
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(baseUrl + extUrl),
    );

    request.headers.addAll(headers());

    var picture = http.MultipartFile(
        'avatar', file.readAsBytes().asStream(), file.lengthSync(),
        filename: file.path.split("/").last);

    request.files.add(picture);
    Get.log(request.toString());

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);

    Get.log(result.toString());
  }

  uploadMultipleImages(String extUrl, List<File> images) async {
    // return;

    var request = http.MultipartRequest("POST", Uri.parse(baseUrl + extUrl));
    request.headers.addAll(headers());

    for (var file in images) {
      var picture = http.MultipartFile(
          'pics', file.readAsBytes().asStream(), file.lengthSync(),
          filename: file.path.split("/").last);

      request.files.add(picture);
    }
    Get.log(request.toString());

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);

    Get.log(result.toString());
  }

  dynamic _processResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var respJson = response.body;
        return respJson;

      case 400: // bad request
        Get.printError(info: "Bad Request Exception");
        throw BadRequestException(
            response.body, response.request!.url.toString());

      case 401: // unautherised
        Get.printError(info: "Un-Authorized Exception");
        throw UnAuthorizedException(
            response.body, response.request!.url.toString());

      case 500: // internal server error
        Get.printError(info: "Internal Server Error");
        return;

      default:
        Get.printError(info: response.statusCode.toString());
      // throw FetchDataException(
      //     'Error occured with code: ${response.statusCode}',
      //     response.request.toString());
    }
  }
}
