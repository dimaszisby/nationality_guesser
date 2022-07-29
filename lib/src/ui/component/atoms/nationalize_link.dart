import 'package:flutter/material.dart';

class NationalizeLink extends StatelessWidget {
  const NationalizeLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Learn more about",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "nationalize.io",
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
