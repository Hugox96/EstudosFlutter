import 'package:flutter/material.dart';
 
 // Funcionou!
 void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
     backgroundColor: Colors.black45,
      

      appBar: AppBar(
          title: Text("Metas"),//Parte da aba do app
          centerTitle: true,
          backgroundColor: Colors.grey[850], // Cor da aba
          actions: [
              Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
        ], 
      ),//Appbar
      body: Center(
        child:
           Column(children:<Widget>[
          
         RaisedButton.icon(
         padding: EdgeInsets.all(18),
          onPressed: () {},
          icon: Icon(
              Icons.add), //Icon
          
          label: Text("Descrição da meta"),
          color: Colors.indigo[50],
        ), //RaisedButton

         
         RaisedButton.icon(
          padding: EdgeInsets.all(18),
          onPressed: () {},
          icon: Icon(
              Icons.account_balance_wallet_rounded), //Icon
          
          label: Text("Valor para poupar"),
          color: Colors.indigo[50],
          ), //RaisedButton.icon

          RaisedButton.icon(
          padding: EdgeInsets.all(18),   
          onPressed: () {},
          icon: Icon(
              Icons.access_time_rounded  ), //Icon
          
          label: Text("Data de ínicio"),
          color: Colors.indigo[50],
          ), //RaisedButton.icon


         RaisedButton.icon(
          padding: EdgeInsets.all(18),   
          onPressed: () {},
          icon: Icon(
              Icons.account_balance_wallet_rounded), //Icon
          
          label: Text("Valor para alcançar a meta"),
          color: Colors.indigo[50],
          ), //RaisedButton.icon



         ]),//children:<Widget>
        ), //Center
      ); //Scaffold

  } //BuildContext
} // StatelessWidget


