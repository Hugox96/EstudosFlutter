import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
@override 
Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title:"Widgets Básicos",
     theme: ThemeData(primaryColor: Colors.blue,),
     home: meuWidgets(),);
 }


meuWidgets() {
     return Scaffold(
       appBar: AppBar
       (
         title: Text("Meta"),
         centerTitle: true,
       ), 
      
      body: Container(
        color:Colors.blue[900]
      ),
      
      drawer: Container (
        color: Colors.indigo[100],
      ),
       
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alert_rounded),
        onPressed: () {print("ok");}
        ),


      );
  }
}
