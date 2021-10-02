import 'package:flutter/material.dart';



  InputDecoration buildFormDecoration(IconData icons,String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(45.0),
      borderSide: BorderSide(
          color: Colors.green,
          width: 3,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(45.0),
      borderSide: BorderSide(
        color: Colors.green,
        width: 3,
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(45.0),
      borderSide: BorderSide(
        color: Colors.green,
        width: 3,
      ),
    ),
  );
}