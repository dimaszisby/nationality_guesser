import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ReusableLink extends StatelessWidget {
  ReusableLink({Key? key, required this.link}) : super(key: key);

  String link;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(link),
      builder: (context, followLink) {
        return RichText(
          text: TextSpan(
            children: [
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
    );
  }
}
