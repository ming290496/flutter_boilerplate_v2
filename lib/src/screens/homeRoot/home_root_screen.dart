import 'package:flutter/material.dart';
import 'package:flutter_skeleton_v2/src/blocs/bloc_provider.dart';
import 'package:flutter_skeleton_v2/src/blocs/home/home_bloc.dart';
import 'package:flutter_skeleton_v2/src/blocs/homeRoot/home_root_bloc.dart';
import 'package:flutter_skeleton_v2/src/blocs/notification/notification_bloc.dart';
import 'package:flutter_skeleton_v2/src/blocs/profile/profile_bloc.dart';
import 'package:flutter_skeleton_v2/src/screens/home/home_screen.dart';
import 'package:flutter_skeleton_v2/src/screens/notification/notification_screen.dart';
import 'package:flutter_skeleton_v2/src/screens/profile/profile_screen.dart';

class HomeRootScreen extends StatefulWidget {
  @override
  _HomeRootScreenState createState() => _HomeRootScreenState();
}

class _HomeRootScreenState extends State<HomeRootScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  HomeBloc homeBloc = HomeBloc();
  Widget homeScreen;

  NotificationBloc notificationBloc = NotificationBloc();
  Widget notificationScreen;

  ProfileBloc profileBloc = ProfileBloc();
  Widget profileScreen;

  @override
  void initState() {
    super.initState();
    homeScreen = BlocProvider<HomeBloc>(
      bloc: homeBloc,
      child: HomeScreen(),
    );

    notificationScreen = BlocProvider<NotificationBloc>(
      bloc: notificationBloc,
      child: NotificationScreen(),
    );

    profileScreen = BlocProvider<ProfileBloc>(
      bloc: profileBloc,
      child: ProfileScreen(),
    );
  }

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
              return homeScreen;
              break;
            case NavBarEnum.NOTIFICATION:
              return notificationScreen;
              break;
            case NavBarEnum.PROFILE:
              return profileScreen;
              break;
          }
          return Container();
        },
      ),
    );
  }
}
