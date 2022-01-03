import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}


// Esse código é para estudar e entender melhor como funciona o textfield no flutter

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter TextField Example'),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                // Cada padding representa a margin de um textfield
                Padding(
                  // Quanto maior o valor do padding, maior são as margens e o textfield fica menor
                  padding: EdgeInsets.all(15),
                  // 1º Textfield sobre nome
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                      // Ao apertar no textfield, aparecerá esse texto
                      hintText: 'Entre com seu nome',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(9),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    // Essa propriedade é muito importante, ela faz com que o textfield aceite mais texto
                    maxLines: 4,
                    //obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.black,
                  color: Colors.blue,
                  child: Text('Sign In'),
                  onPressed: () {},
                )
              ],
            )));
  }
}
