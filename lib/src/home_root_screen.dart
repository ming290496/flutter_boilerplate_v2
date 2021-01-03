import 'package:flutter/material.dart';

class HomeRootScreen extends StatefulWidget {
  @override
  _HomeRootScreenState createState() => _HomeRootScreenState();
}

class _HomeRootScreenState extends State<HomeRootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Home Root Screen'),
        ),
      ),
    );
  }
}
