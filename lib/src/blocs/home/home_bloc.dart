import 'package:flutter/material.dart';
import 'package:flutter_skeleton_v2/src/blocs/bloc.dart';
import 'package:flutter_skeleton_v2/src/resources/repository.dart';

class HomeBloc extends Bloc {
  BuildContext context;
  final repository = Repository();

  HomeBloc(){
    getData();
  }

  void getData() async{
    final result = await repository.getHomeList();
    print(result.toJson());
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
