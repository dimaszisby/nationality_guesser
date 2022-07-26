import 'dart:html';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('This is Home'),
      ),
    );
  }
}
