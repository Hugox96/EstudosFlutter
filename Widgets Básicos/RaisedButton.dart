import 'package:flutter/material.dart';

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
        title: Text("Meta")
      ),
      
        //Widget container para criar o widget texto
        body: Container( 
        color: Colors.blue[200],
          child: WidgetText()
    ),
   );
  }
}

class WidgetText extends StatelessWidget {
  const WidgetText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center //Geralmente utilizamos o widget child dentro do widget container
    (  
       child: Text("Descrição da Meta", //Child para estilizar o widget texto 
       style: TextStyle ( 
         fontSize:30.0,
         color: Colors.black,
         fontWeight: FontWeight.bold
          )
        )
     );
  }
}


