import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_v2/src/blocs/bloc.dart';
import 'package:flutter_boilerplate_v2/src/models/notification/notification_list_response_model.dart';
import 'package:flutter_boilerplate_v2/src/resources/api_response.dart';
import 'package:flutter_boilerplate_v2/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class NotificationBloc extends Bloc {
  BuildContext context;
  final repository = Repository();

  final _notificationList =
      BehaviorSubject<ApiResponse<List<NotificationListModel>>>();

  Stream<ApiResponse<List<NotificationListModel>>> get notificationList =>
      _notificationList.stream;

  Function(ApiResponse<List<NotificationListModel>>) get addNotificationList =>
      _notificationList.sink.add;

  ApiResponse<List<NotificationListModel>> get notificationListValue =>
      _notificationList.value;

  NotificationBloc() {
    getData();
  }

  void getData() async {
    addNotificationList(ApiResponse.loading());
    try {
      final result = await repository.getNotificationList();
      addNotificationList(ApiResponse.completed(result.data));
    } catch (e) {
      addNotificationList(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _notificationList.close();
  }
}
