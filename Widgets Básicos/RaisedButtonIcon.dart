import 'package:flutter/material.dart';

widgetButton1() {
      // Centraliza o RaisedButton
      return Center( 
       
       //Widget Raisedbutton é um child de center 
       child: RaisedButton( 
        //Defini a cor do botão
        color: Colors.blue[100], 
        //Define a cor do texto
        textColor: Colors.black, 
        //Elavação do butão
        elevation: 20.0, 
         //O texto clique me é um child center também
         child: Text("Descrição da Meta", //Child para estilizar o widget texto 
         
         //Propriedade de Style define algumas características para o texto
         style: TextStyle ( 
         fontSize:15.0,
         color: Colors.black,
         fontWeight: FontWeight.bold
          )
          ),
        
        //Função para retornar uma mensagem ao pressionar o botão
         onPressed: () { 
         print("pressionado");
         }, 
       ),
      );
    } // widgetButton

    widgetButton2() {
    // Centraliza o RaisedButton
      return Center( 
         //RaisedButton com um icone para ficar mais legal o layout
         child: RaisedButton.icon( 

          color: Colors.blue[200], //Cor do RaisedButtonIcon
          icon: Icon(Icons.account_balance_wallet_rounded), //Icone de uma carteira 
          label: Text("Valor para alcançar a meta",
          
          //Propriedade de Style define algumas características para o texto
           style: TextStyle (
           fontSize:17.0,
           color: Colors.black,
           fontWeight: FontWeight.bold
               )
          ),
          
         //Função para retornar uma mensagem ao pressionar o botão
         onPressed: () { 
         print("pressionado");
              },
         ),
      );
    } // widgetButton1

    widgetButton3() {
  
    return Center (
      child: RaisedButton.icon(
        color: Colors.blue[200],
        icon: Icon(Icons.access_time_rounded), //Icon
        label: Text("Data de Ínicio",
        
        style: TextStyle(
        fontSize: 17.0,
        color: Colors.black,
        fontWeight: FontWeight.bold
         )
    ),

    onPressed: () { 
      print("Ok"); 
       }
      ),
   );

} //widgetButton2

    

