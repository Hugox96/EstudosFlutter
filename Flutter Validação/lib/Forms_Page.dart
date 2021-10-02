import 'package:flutter/material.dart';
import 'Forms_design.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  String name,email,phone;

  /*Quando temos uma variável de texto editável, precisamos armazena-la em algum lugar
  O TextEditingController permite salvar o texto e a modificações serão salvas e atualizadas automaticamente*/
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.network("https://protocoderspoint.com/wp-content/uploads/2020/10/PROTO-CODERS-POINT-LOGO-water-mark-.png"),
                ),
                SizedBox(
                  height: 15,
                ),
                
                // Validação para o nome do usuário
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    // Decoration acessa o design criado no buildFormDecoration no arquivo Forms_design.dart
                    decoration: buildFormDecoration(Icons.person,"Full Name"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      name = value;
                    },
                  ),
                ),

                // Validação para o email
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    decoration:buildFormDecoration(Icons.email,"Email"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please a Enter';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      email = value;
                    },
                  ),
                ),

                // Validação para a numero de telefone
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:buildFormDecoration(Icons.phone,"Phone No"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please enter phone no ';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      phone = value;
                    },
                  ),
                ),

                // Validação para a senha
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration:buildFormDecoration(Icons.lock,"Password"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },

                  ),
                ),

                //Validação para confirmação de senha
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildFormDecoration(Icons.lock,"Confirm Password"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please re-enter password';
                      }
                      print(password.text);

                      print(confirmpassword.text);

                      // Se a password.text for diferente de confirmpassword.text retornará erro 
                      if(password.text!=confirmpassword.text){
                        return "Password does not match";
                      }

                      return null;
                    },

                  ),
                ),

                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.black,
                    onPressed: (){

                      if(_formkey.currentState.validate())
                      {
                        print("successful");

                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue,width: 2)
                    ),
                    textColor:Colors.white,child: Text("Submit"),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
