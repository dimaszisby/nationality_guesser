import 'package:flutter/material.dart';

class SearchNameButton extends StatelessWidget {
  final VoidCallback guessName;

  SearchNameButton(this.guessName);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: guessName,
      child: const Text(
        'Guess',
      ),
      style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
