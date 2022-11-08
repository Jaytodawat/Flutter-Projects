import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          centerTitle: true,
          title: const Text("I am Rich"),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: const Center(
          child: Image(
            image: NetworkImage(
                'https://png.pngtree.com/png-clipart/20180626/ourmid/pngtree-instagram-icon-instagram-logo-png-image_3584852.png'),
          ),
        ),
      ),
    ),
  );
}
