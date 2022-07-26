import 'package:flutter/material.dart';

class SearchNameButton extends StatelessWidget {

  final VoidCallback guessName;

  SearchNameButton(this.guessName);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //TODO make custom atomic button
      onPressed: guessName,
      child: const Text('Guess'),
    );
  }
}