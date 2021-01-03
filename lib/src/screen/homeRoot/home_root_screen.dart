import 'package:flutter/material.dart';
import 'package:flutter_skeleton_v2/src/bloc/bloc_provider.dart';
import 'package:flutter_skeleton_v2/src/bloc/homeRoot/home_root_bloc.dart';

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
                  Icons.event_note,
                  size: kToolbarHeight * 0.35,
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('ARTIKEL'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_add,
                  size: kToolbarHeight * 0.35,
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('ADD'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.headset,
                  size: kToolbarHeight * 0.35,
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('MEDIA'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  size: kToolbarHeight * 0.35,
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('PROFIL'),
                ),
              )
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
//                        homeBloc.homeRootArgument = bloc.argument;
              return Center(
                child: Text('HOME'),
              );
              break;
            case NavBarEnum.ARTICLE:
              return Center(
                child: Text('ARTICLE'),
              );
              ;
              break;
            case NavBarEnum.ADD:
              return Center(
                child: Text('ADD'),
              );
              break;
            case NavBarEnum.MEDIA:
              return Center(
                child: Text('MEDIA'),
              );
              ;
              break;
            case NavBarEnum.PROFILE:
              return Center(
                child: Text('PROFILE'),
              );
              ;
              break;
          }
          return Container();
        },
      ),
    );
  }
}
