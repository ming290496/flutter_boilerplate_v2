import 'package:flutter/material.dart';
import 'package:flutter_skeleton_v2/src/bloc/bloc_provider.dart';
import 'package:flutter_skeleton_v2/src/bloc/homeRoot/home_root_bloc.dart';
import 'package:flutter_skeleton_v2/src/screen/home/home_screen.dart';
import 'package:flutter_skeleton_v2/src/screen/notification/notification_screen.dart';
import 'package:flutter_skeleton_v2/src/screen/profile/profile_screen.dart';

class HomeRootScreen extends StatefulWidget {
  @override
  _HomeRootScreenState createState() => _HomeRootScreenState();
}

class _HomeRootScreenState extends State<HomeRootScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeRootBloc>(context);

    return Scaffold(
      bottomNavigationBar: StreamBuilder<NavBarEnum>(
        stream: bloc.navBar,
        initialData: NavBarEnum.HOME,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            key: Key('NavBarMenu'),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              bloc.pickItem(value);
            },
            currentIndex: bloc.getItem(snapshot.data),
            elevation: 0,
            selectedFontSize: 11,
            unselectedFontSize: 10,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: kToolbarHeight * 0.35,
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('HOME'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: kToolbarHeight * 0.35,
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('NOTIFICATION'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: kToolbarHeight * 0.35,
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('PROFILE'),
                ),
              ),
            ],
          );
        },
      ),
      body: StreamBuilder<NavBarEnum>(
        stream: bloc.navBar,
        initialData: NavBarEnum.HOME,
        builder: (context, snapshot) {
          switch (snapshot.data) {
            case NavBarEnum.HOME:
              return HomeScreen();
              break;
            case NavBarEnum.NOTIFICATION:
              return NotificationScreen();
              break;
            case NavBarEnum.PROFILE:
              return ProfileScreen();
              break;
          }
          return Container();
        },
      ),
    );
  }
}
