import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class NationalizeLink extends StatelessWidget {
  const NationalizeLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Link(
        uri: Uri.parse("https://nationalize.io/"),
        builder: (context, followLink) {
          return RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Learn more about ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: 'nationalize.io',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = followLink,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
