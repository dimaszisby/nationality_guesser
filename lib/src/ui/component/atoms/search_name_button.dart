import 'package:flutter/material.dart';

class SearchNameButton extends StatelessWidget {
  final VoidCallback guessName;

  const SearchNameButton(this.guessName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => guessName,
      style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      child: const Text(
        'Guess',
      ),
    );
  }
}
