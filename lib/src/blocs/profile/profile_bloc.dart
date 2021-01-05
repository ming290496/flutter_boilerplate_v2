import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_v2/src/blocs/bloc.dart';
import 'package:flutter_boilerplate_v2/src/models/profile/profile_detail_response_model.dart';
import 'package:flutter_boilerplate_v2/src/resources/api_response.dart';
import 'package:flutter_boilerplate_v2/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends Bloc {
  BuildContext context;

  final repository = Repository();

  final _profileDetail = BehaviorSubject<ApiResponse<ProfileDetailModel>>();

  Stream<ApiResponse<ProfileDetailModel>> get profileDetail =>
      _profileDetail.stream;

  Function(ApiResponse<ProfileDetailModel>) get addProfileDetail =>
      _profileDetail.sink.add;

  ApiResponse<ProfileDetailModel> get profileDetailValue =>
      _profileDetail.value;

  ProfileBloc() {
    getData();
  }

  void getData() async {
    addProfileDetail(ApiResponse.loading());
    try {
      final result = await repository.getProfileDetail();
      addProfileDetail(ApiResponse.completed(result.data));
    } catch (e) {
      addProfileDetail(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _profileDetail.close();
  }
}
