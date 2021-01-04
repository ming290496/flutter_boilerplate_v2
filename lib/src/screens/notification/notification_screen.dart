import 'package:flutter/material.dart';
import 'package:flutter_skeleton_v2/src/widgets/notification/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, position) {
          return NotificationWidget();
        },
      ),
    );
  }
}
