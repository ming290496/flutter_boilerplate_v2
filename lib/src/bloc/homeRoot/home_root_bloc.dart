import 'package:flutter/material.dart';
import 'package:flutter_skeleton_v2/src/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

enum NavBarEnum { HOME, ARTICLE, ADD, MEDIA, PROFILE }

class HomeRootBloc implements Bloc {
  BuildContext context;

  final _navBar = BehaviorSubject<NavBarEnum>();

  Stream<NavBarEnum> get navBar => _navBar.stream;

  Function(NavBarEnum) get changeNavBar => _navBar.sink.add;

  NavBarEnum get navBarValue => _navBar.value;

  pickItem(index) {
    switch (index) {
      case 0:
        changeNavBar(NavBarEnum.HOME);
        break;
      case 1:
        changeNavBar(NavBarEnum.ARTICLE);
        break;
      case 2:
        changeNavBar(NavBarEnum.ADD);
        break;
      case 3:
        changeNavBar(NavBarEnum.MEDIA);
        break;
      case 4:
        changeNavBar(NavBarEnum.PROFILE);
        break;
    }
  }

  int getItem(NavBarEnum navBarEnum) {
    switch (navBarEnum) {
      case NavBarEnum.HOME:
        return 0;
        break;
      case NavBarEnum.ARTICLE:
        return 1;
        break;
      case NavBarEnum.ADD:
        return 2;
        break;
      case NavBarEnum.MEDIA:
        return 3;
        break;
      case NavBarEnum.PROFILE:
        return 4;
        break;
      default:
        return 0;
        break;
    }
  }

  @override
  void dispose() {
    _navBar.close();
  }
}
