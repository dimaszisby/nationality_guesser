import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final VoidCallback _handler;

  const ReusableButton(this._handler, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
        onPressed: _handler,
        style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        child: const Text('Search'),
      ),
    );
  }
}
