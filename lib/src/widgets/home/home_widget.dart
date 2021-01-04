import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
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
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=3'),
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
                      'John Doe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '3 days ago',
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
                  Icons.bookmark_border,
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
            'Aliquam Condimentum Facilisis Ente Et.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'Nam consectetur magna in pharetra euismod. Proin mauris metus, semper nec euismod non, mollis et nisl. Phasellus elementum volutpat arcu at porttitor.',
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
                Icons.favorite_border,
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '123',
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
