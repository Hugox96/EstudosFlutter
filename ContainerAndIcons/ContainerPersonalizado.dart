import 'package:flutter/material.dart';

// Sites para aprender sobre container: 
// 1º https://flutter-examples.com/flutter-create-rounded-corner-rectangle/
// 2º https://www.javatpoint.com/flutter-container
// 3ºhttps://www.codethebest.com/flutter-container-decoration-guide/



void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Exemplo Personalizado"),
        ),
        body: Center(
		  
		  // Primeiro criamos um child e em seguida criamos um Column para colocar os containers
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
		  
		  //Depois criamos o children para criarmos mais containers
          children: <Widget>[
		  
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 8),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.yellow,
                    offset: new Offset(2.0, 2.0),
                  ),
                ],
              ),
              //Texto do Container
              child: Text("1 Container",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                  )),
            ), // Fim do Container

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 8),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.yellow,
                    offset: new Offset(2.0, 2.0),
                  ),
                ],
              ),
              //Texto do Container
              child: Text("2 Container",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                  )),
            ),
          ] // Fim do Container
              ),
        ),
      ),
    );
  }
}
