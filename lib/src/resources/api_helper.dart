import 'dart:convert';
import 'dart:io';
import 'package:flutter_skeleton_v2/src/resources/configs.dart';
import 'package:flutter_skeleton_v2/src/utilities/app_exceptions.dart';
import 'package:http/http.dart' as client;
import 'dart:async';

class ApiHelper {
  ApiHelper._instantiate();

  List<String> baseUrl = getBaseUrl();

  static final ApiHelper instance = ApiHelper._instantiate();

  var header = new Map<String, String>();

  ApiHelper();

  static List<String> getBaseUrl() {
    return Configs.baseUrl;
  }

  static String _getAuthorization() {
    return Configs.authorization;
  }

  static Duration _getTimeOutDuration() {
    return Configs.timeOutDuration;
  }

  Future<Map<String, String>> getHeader() async {
    var result = Map<String, String>();
    // String pushToken = await Prefs.pushToken;

    print('header : $result');
    return result;
  }

  Future<Map<String, String>> getHeaderUrlEncodes() async {
    var result = await getHeader();
    result["Content-Type"] = "application/x-www-form-urlencoded";

    print('header : $result');
    return result;
  }

  String getPackageName() {
    String result = '';
    if (Platform.isAndroid) {
      result = 'com.apps.android';
    } else {
      result = 'com.apps.ios';
    }
    return result;
  }

  String getMobileDevice() {
    String result = '';
    if (Platform.isAndroid) {
      result = 'android';
    } else {
      result = 'ios';
    }
    return result;
  }

  Future<dynamic> get(String url,
      {dynamic params, int baseUrlIndex = 0}) async {
    print('Api Get, url ${baseUrl[baseUrlIndex] + url}');
    if (params != null) {
      url += mapToParamString(params);
    }
    print(url);
    var responseJson;
    try {
      final response = await client
          .get(baseUrl[baseUrlIndex] + url, headers: await getHeader())
          .timeout(_getTimeOutDuration());
      print('RESPONSE ${response.body}');
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      print('TimeoutException');
      throw FetchDataException(
          'Koneksi Mums lemah, Pastikan internet Mums lancar dengan cek ulang jaringan Mums');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url,
      {dynamic params, int baseUrlIndex = 0}) async {
    print('Api Post, url ${baseUrl[baseUrlIndex] + url}');
    String bodyString = '';
    if (params != null) {
//      params.removeWhere((String key, dynamic value) => value == null);
      bodyString = jsonEncode(params);
    }
    print('Params : $bodyString');
    var responseJson;
    try {
      final response = await client
          .post(baseUrl[baseUrlIndex] + url,
              body: bodyString, headers: await getHeader())
          .timeout(_getTimeOutDuration());
      print('RESPONSE ${response.body}');
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      print('TimeoutException');
      throw FetchDataException('FetchDataException');
    }
    return responseJson;
  }

  //POST
  Future<dynamic> uploadPhoto({String id, String imagePath}) async {
    var responseJson;
    String url = baseUrl[0] + 'api/insert-photo';

    try {
      print('Api Post, url $url');
      var request = client.MultipartRequest("POST", Uri.parse(url));

      if (id != null) request.fields['id'] = id;

      if ((imagePath ?? '') != '') {
        request.files
            .add(await client.MultipartFile.fromPath('image', imagePath));
      }

      Map<String, String> headers = await getHeaderUrlEncodes();
      headers["Content-Type"] = "multipart/form-data";
      request.headers.addAll(headers);

      final response = await request.send();
      final responseBody = await client.Response.fromStream(response);
      responseJson = _returnResponse(responseBody);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> getMocky(String url) async {
    print('Api GetMocky url $url');
    var responseJson;
    try {
      final response = await client.get('http://www.mocky.io/v2/' + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  String mapToParamString(dynamic params) {
    String result = '?';
    params.forEach((a, b) {
      if (a == 'week' && b == '0') {
        result += '$a=$b&';
        return;
      }
      if (b != null && b != '' && (b != '0' || a == 'page')) result += '$a=$b&';
    });
    return result;
  }

  dynamic _returnResponse(client.Response response) {
    //TODO: Bikin force logout dari utilities force logout
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        if (responseJson["acknowledge"] == false ||
            responseJson["status"].toString() == 'error') {
          if (responseJson["info"] != null) {
            if ((responseJson["info"]["redirect"] ?? '') == 'login' ||
                (responseJson["info"]["field"] ?? '')
                    .toString()
                    .toLowerCase()
                    .contains('session')) {
              // Utilities.forceLogOut();
            } else {
              throw Exception(responseJson["info"]["message"] ?? '');
            }
          } else {
            throw Exception('Oops! Something Went Wrong...');
          }
        }
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 413:
        throw UnauthorisedException('UnauthorisedException');
      case 500:
      case 502:
        throw SocketException('SocketException');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  injectParam(var request, String key, dynamic value) {
    if (value != null) request.fields['$key'] = value;
  }
}
