import 'dart:io';

import 'package:flutter_boilerplate_v2/src/constants/app_enum.dart';

class Configs {
// IMPORTANT! CHECK BEFORE BUILD
  static const AppEnvironmentEnum appEnvironment = AppEnvironmentEnum.STAGING;

//  static const AppEnvironmentEnum appEnvironment = AppEnvironmentEnum.PRODUCTION;

  static const String _devBuildNumber = '.0';

  static const _baseUrlStaging = [
    'https://run.mocky.io/v3/',
  ];

  static const _baseUrlProduction = [
    'https://run.mocky.io/v3/',
  ];

  static String get getDevBuildNumber {
    String result = '';
    if (appEnvironment == AppEnvironmentEnum.STAGING) {
      result = _devBuildNumber;
    }
    return result;
  }

  static List<String> get baseUrl {
    List<String> result;
    switch (appEnvironment) {
      case AppEnvironmentEnum.STAGING:
        result = _baseUrlStaging;
        break;
      case AppEnvironmentEnum.PRODUCTION:
        result = _baseUrlProduction;
        break;
    }
    return result;
  }

  static String get authorization {
    String result = '';

    switch (appEnvironment) {
      case AppEnvironmentEnum.STAGING:
        if (Platform.isAndroid) {
          result = 'auth android staging here';
        } else {
          result = 'auth ios staging here';
        }
        break;
      case AppEnvironmentEnum.PRODUCTION:
        if (Platform.isAndroid) {
          result = 'auth android prod here';
        } else {
          result = 'auth ios prod here';
        }
        break;
    }
    return result;
  }

  static Duration get timeOutDuration {
    Duration result;

    switch (appEnvironment) {
      case AppEnvironmentEnum.STAGING:
        result = Duration(seconds: 30);
        break;
      case AppEnvironmentEnum.PRODUCTION:
        result = Duration(minutes: 3);
        break;
    }
    return result;
  }
}
