import 'package:flutter/material.dart';

class NationalizeLink extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Learn more about",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "nationalize.io",
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ));
  }
}
