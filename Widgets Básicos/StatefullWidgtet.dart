import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
  TextInput: new Text("Provided By Main"),
));

/* A grande diferença é que agora posso utilizar o checbox de forma automática
Sem precisar utilizar o hotreload como no Stateless*/


//Primeira classe que define o Statefulwidget
class MyApp extends StatefulWidget {
  MyApp({this.TextInput});
  final Widget TextInput;
  MyAppState createState() => new MyAppState();
}

//Segunda classe que define o build
class MyAppState extends State<MyApp> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "MySampleApplication",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Hello Flutter App"),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              widget.TextInput,
              new Checkbox(
                  value: checkBoxValue,
                  onChanged: (bool newValue){
                    setState(() {
                      checkBoxValue = newValue;
                    });
                  }
              )
            ],
          ),
        )
      ),
    );
  }
}