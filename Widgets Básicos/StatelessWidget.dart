import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
  TextInput: new Text("Provided By Main"),
));


/*Estamos utilizando o StatelessWidget, nesse caso o build cria uma checkbox. 
Porém, ela só é atualizada ao reiniciar o carregamento ou excutando o 
Hotreload. A mensagem do clique só irá aparecer após o carregamento do código*/

class MyApp extends StatelessWidget {
  MyApp({this.TextInput});
  final Widget TextInput;
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "MySampleApplication",
      
      // Com o Scaffold podemos o appBar e o body da aplicação
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Teste Statelees"),
        ), // Contém o texto presente na aba da aplicação
        body: new Center(
          //Com o child podemos criar tanto uma linha(row), quanto colunas(column)
          child: new Column(
            children: <Widget>[
              TextInput,
              new Checkbox(
                  value: checkBoxValue,
                  onChanged: (bool newValue){
                    checkBoxValue = newValue;
                  }
              ) //Checkbox que será atualizado após o hotreaload
            ],
          ),
        )
      ),
    );
  }
}