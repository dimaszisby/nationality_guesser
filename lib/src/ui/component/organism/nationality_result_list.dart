import 'package:flutter/material.dart';
import 'package:nationality_guesser_app/src/models/person_model.dart';

class NationalityResultList extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  final String countryResult;
  final double probabilityResult;

  NationalityResultList(this.countryResult, this.probabilityResult);

  List<DummyPerson> dummyPerson = [
    DummyPerson('Dimas', 'Indonesia', 1.00),
  ];

  @override
  Widget build(BuildContext context) {
    final resultCard = Card(
      child: Row(
        children: const [
          Text(
            'Dimas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '1.00',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );

    return Row(
      children: <Widget>[
        Card(),
      ],
    );
  }
}
