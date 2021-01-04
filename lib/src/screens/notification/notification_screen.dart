import 'package:flutter/material.dart';
import 'package:flutter_skeleton_v2/src/blocs/bloc_provider.dart';
import 'package:flutter_skeleton_v2/src/blocs/notification/notification_bloc.dart';
import 'package:flutter_skeleton_v2/src/models/notification/notification_list_response_model.dart';
import 'package:flutter_skeleton_v2/src/resources/api_response.dart';
import 'package:flutter_skeleton_v2/src/widgets/notification/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NotificationBloc>(context);

    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: StreamBuilder<ApiResponse<List<NotificationListModel>>>(
        stream: bloc.notificationList,
        builder: (context, snapshot) {
          final data = snapshot.data ?? bloc.notificationListValue;

          switch (data.status) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case Status.COMPLETED:
              final notificationList = data.data;

              return ListView.builder(
                itemCount: notificationList.length,
                itemBuilder: (context, position) {
                  return NotificationWidget(notificationList[position]);
                },
              );
              break;
            case Status.ERROR:
              return Center(
                child: Text(data.message),
              );
              break;
            default:
              return Container();
              break;
          }
        },
      ),
    );
  }
}
