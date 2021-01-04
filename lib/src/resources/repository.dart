import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_skeleton_v2/src/models/home/home_list_response_model.dart';
import 'package:flutter_skeleton_v2/src/resources/api_helper.dart';

class Repository {
  ApiHelper apiProvider = ApiHelper();

  //HOME
  static const String HOME = 'ea467f7a-a7b9-4627-99d9-38636ba2adb9/';

  //GET
  Future<HomeListResponseModel> getHomeList() async {
    final response = await apiProvider.get(HOME);
    final result = HomeListResponseModel.fromJson(response);
    return result;
  }
}
