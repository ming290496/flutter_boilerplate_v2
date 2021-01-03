import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_skeleton_v2/src/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));

  return runApp(App());
}
