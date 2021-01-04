import 'package:flutter/material.dart';
import 'package:flutter_skeleton_v2/src/blocs/bloc_provider.dart';
import 'package:flutter_skeleton_v2/src/blocs/profile/profile_bloc.dart';
import 'package:flutter_skeleton_v2/src/models/profile/profile_detail_response_model.dart';
import 'package:flutter_skeleton_v2/src/resources/api_response.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ProfileBloc>(context);

    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: StreamBuilder<ApiResponse<ProfileDetailModel>>(
        stream: bloc.profileDetail,
        builder: (context, snapshot) {
          final data = snapshot.data ?? bloc.profileDetailValue;

          switch (data.status) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case Status.COMPLETED:
              final profileDetail = data.data;

              return buildProfileWidget(profileDetail);
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

  Widget buildProfileWidget(ProfileDetailModel data) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 35,
          ),
          Align(
            child: CircleAvatar(
              backgroundImage: NetworkImage(data.avatarUrl),
              backgroundColor: Colors.grey,
              radius: 80,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            data.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            data.location,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(
            thickness: 2,
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${data.followers}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Likes',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${data.likes}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${data.following}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
