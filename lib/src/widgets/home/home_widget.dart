import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_v2/src/models/home/home_list_response_model.dart';

class HomeWidget extends StatelessWidget {
  final HomeListModel data;

  HomeWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54, blurRadius: 1.5, offset: Offset(1, 1))
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(data.author.avatarUrl),
                backgroundColor: Colors.grey,
                radius: 30,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      data.author.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      data.date,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  data.isBookmark ? Icons.bookmark : Icons.bookmark_border,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            data.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            data.shortDescription,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                data.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                data.totalFavorite.toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
