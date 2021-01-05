import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_v2/src/blocs/bloc_provider.dart';
import 'package:flutter_boilerplate_v2/src/blocs/home/home_bloc.dart';
import 'package:flutter_boilerplate_v2/src/models/home/home_list_response_model.dart';
import 'package:flutter_boilerplate_v2/src/resources/api_response.dart';
import 'package:flutter_boilerplate_v2/src/widgets/home/home_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: StreamBuilder<ApiResponse<List<HomeListModel>>>(
        stream: bloc.homeList,
        builder: (context, snapshot) {
          final data = snapshot.data ?? bloc.homeListValue;

          switch (data.status) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case Status.COMPLETED:
              final homeList = data.data;

              return ListView.builder(
                itemCount: homeList.length,
                itemBuilder: (context, position) {
                  return HomeWidget(homeList[position]);
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
