import 'package:flutter/material.dart';
import 'package:flutter_application/widget_raisedbutton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
@override 
Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title:"Widgets Básicos",
     theme: ThemeData(primaryColor: Colors.black,),
     home: widgetBasicos(),);
 }
}

class  widgetBasicos extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
        return Scaffold
      (  
      //Criando um appBar
      appBar: AppBar( 
        title: Text("Meta"),
        centerTitle: true, // Centraliza o texto meta do appBar
      ),
        //Widget container para criar o widget texto
        body: Container( 
        //Defini a cor do container
        color: Colors.blueAccent[100], 
        child: widgetRowColunm()
            ),
           );
          }
        
          // Widget row ou collunm
          widgetRowColunm() {
          // Criando uma coluna com um widget children como array  
           return Column(
             mainAxisAlignment:MainAxisAlignment.center,
             children: <Widget>
              //WidgetButton preenche o Colunm
              [
               widgetButton(),
               widgetButton(),
               widgetButton(),
               ] 
           );
       }
   
   
 
  
      


}



