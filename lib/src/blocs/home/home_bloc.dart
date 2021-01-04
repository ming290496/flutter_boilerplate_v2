import 'package:flutter/material.dart';
import 'package:flutter_skeleton_v2/src/blocs/bloc.dart';
import 'package:flutter_skeleton_v2/src/models/home/home_list_response_model.dart';
import 'package:flutter_skeleton_v2/src/resources/api_response.dart';
import 'package:flutter_skeleton_v2/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Bloc {
  BuildContext context;
  final repository = Repository();

  final _homeList = BehaviorSubject<ApiResponse<List<HomeListModel>>>();

  Stream<ApiResponse<List<HomeListModel>>> get homeList => _homeList.stream;

  Function(ApiResponse<List<HomeListModel>>) get addHomeList =>
      _homeList.sink.add;

  ApiResponse<List<HomeListModel>> get homeListValue => _homeList.value;

  HomeBloc() {
    getData();
  }

  void getData() async {
    addHomeList(ApiResponse.loading());
    try {
      final result = await repository.getHomeList();
      addHomeList(ApiResponse.completed(result.data));
    } catch (e) {
      addHomeList(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _homeList.close();
  }
}
