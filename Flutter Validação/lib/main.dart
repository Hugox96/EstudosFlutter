import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_validator/Forms_Page.dart';
import 'package:flutter_form_validator/Forms_design.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Esta é o raiz da nossa aplicação.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FormPage(),
    );
  }
}


