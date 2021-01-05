import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate_v2/src/blocs/bloc_provider.dart';
import 'package:flutter_boilerplate_v2/src/blocs/homeRoot/home_root_bloc.dart';
import 'package:flutter_boilerplate_v2/src/screens/homeRoot/home_root_screen.dart';
import 'package:flutter_boilerplate_v2/src/utilities/utilities.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final HomeRootBloc bloc = HomeRootBloc();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarBrightness:
            Brightness.light // Dark == white status bar -- for IOS.
        ));

    return MaterialApp(
      title: 'Skeleton V2',
      onGenerateRoute: routes,
      navigatorKey: Utilities.navigatorKey,
      initialRoute: '/',
    );
  }

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        final bloc = HomeRootBloc();
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<HomeRootBloc>(
              bloc: bloc,
              child: HomeRootScreen(),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
