import 'package:flutter/material.dart';
import 'package:todo_list/route/category_route.dart';
import 'package:todo_list/route/todo_route.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Todo ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.format_list_bulleted),
            title: Text('Todo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoRoute()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text('AddTodo'),
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Category'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryRoute()),
              );
            },
          )
        ],
      ),
    );
  }
}
