import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Column(
          //Column its used with children widget
          children: <Widget>[
            // If we have a widget that needs some background styling may be a color, shape,
            //or size constraints, we may try to wrap it in a container widget.
            Container(
              //We can edit container with these properties
              alignment: Alignment.topLeft,
              color: Colors.indigo,
              padding: EdgeInsets.all(30),
              // Cointaner we used child widget
              child: Column(
                children: <Widget>[
                  Icon(Icons.arrow_back_ios_outlined, size: 40),
                  Text('Voltar'),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
