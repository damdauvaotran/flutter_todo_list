import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Category extends StatelessWidget {
  final String name;
  final Color color;
  final IconData icon;

  Category(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.icon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(icon),
          ),
          Center(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
