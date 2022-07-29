import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  const TitleCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                Container(
                  color: Colors.amber,
                  width: mediaQuery.size.width * 0.2,
                  height: mediaQuery.size.width * 0.1,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Nationality',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                color: Colors.amber,
                width: mediaQuery.size.width * 0.1,
                height: mediaQuery.size.width * 0.1,
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                child: Text(
                  'Guesser',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
