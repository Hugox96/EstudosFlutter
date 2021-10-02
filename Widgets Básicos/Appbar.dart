import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
  TextInput: new Text("Provided By Main"),
));

/* A grande diferença é que agora posso utilizar o checbox de forma automática
Sem precisar utilizar o hotReload como no Stateless*/


//Primeira classe que define o Statefulwidget
class MyApp extends StatefulWidget {
  MyApp({this.TextInput});
  final Widget TextInput;
  MyAppState createState() => new MyAppState();
}

//Segunda classe que define o build
class MyAppState extends State<MyApp> {
  bool checkBoxValue = false;
  String  actionText = "Default";
  @override
 
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "MySampleApplication",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Hello Flutter App"),
          
          // Com actions podemos gerar botões que ao serem selecionadas exibirão uma mensagem 
          actions: <Widget> [
          // Botão que exibirá a mensagem "Novo Texto"    
              new IconButton (
                icon: new Icon(Icons.add_comment),//Icones
                // Ao selecionar, a mensagem novo texto aparecerá na tela
                onPressed: (){
                  setState(() {
                    actionText = "Novo Texto";
                  });
                }
              ),
            
            // Botão que exibirá a mensagem "Padrão"   
              new IconButton (
                  icon: new Icon(Icons.remove),//Icones 
                  //Ao selecionar, a mensagem padrão aparecerá na tela
                  onPressed: (){
                    setState(() {
                      actionText = "Padrão";
                    });
                  }
              ),
            ]
        ),
        // Checkbox aparecerá no body
        body: new Center(
          child: new Column(
            children: <Widget>[
              widget.TextInput,
              new Text(actionText),
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