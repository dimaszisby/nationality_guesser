// @dart=2.9

import 'package:flutter/material.dart';

import './src/di/injection.dart';
import './src/ui/component/page/search_name.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nationality Guesser',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.red,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              // button: TextStyle(color: Colors.white), //TODO: Find Error
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.teal,
        backgroundColor: Colors.black,
        cardColor: Colors.teal,
        focusColor: Colors.teal,
        scaffoldBackgroundColor: Colors.teal,
        dividerColor: Colors.white,
      ),
      home: const SearchName(),
    );
  }
}
