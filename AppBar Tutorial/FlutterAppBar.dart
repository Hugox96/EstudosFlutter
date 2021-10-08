import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(

            /*In Flutter, the AppBar’s layout mainly comprises three components: 
          leading, title, and actions. leading is placed at the leftmost position of the AppBar; 
          title and actions appear to its right.*/

            appBar: AppBar(
              backgroundColor: Colors.indigo,

              /*leading takes in a widget and can be assigned anything — text, an icon, 
              or even multiple widgets within a row.*/

              /*If leading is not provided, AppBar implies it for us automatically. 
              Examples include a navigation arrow 
              to go back to the previous page or a menu icon to open the drawer.*/

              leading: Padding(
                padding: EdgeInsets.only(left: 5),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    print('Click leading');
                  },
                ),
              ),

              /*As the name suggests, it’s mostly used for showing titles, 
              such as the app title or a page header.*/

              title: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                Text('Perfil'),
              ]),

              /* Actions is a list of widgets that are aligned to the right of AppBar. 
              We usually see them in apps used as buttons to trigger dropdown menus, profile avatars, etc.*/

              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print('Click search');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () {
                    print('Click start');
                  },
                ),
              ],
            ),
            body: Container(
              decoration: BoxDecoration(color: Colors.white),
            )));
  }
}
