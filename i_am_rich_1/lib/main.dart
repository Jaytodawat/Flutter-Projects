import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, //this will hide debug banner
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          centerTitle: true, //used to align title at center
          //centering the title in ios is default.
          //On android the title is left aligned by default
          title: const Text("I am Rich"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/insta_logo.png'),
          ),
        ),
      ),
    ),
  );
}

//Notes:
//1.If we want to center a widget inside another widget then we use Center(child: ,) widget
