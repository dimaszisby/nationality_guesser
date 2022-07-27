import 'package:flutter/material.dart';
import 'package:nationality_guesser_app/src/blocs/person_bloc.dart';
import 'package:nationality_guesser_app/src/models/person_model.dart';

class NationalityResultList extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  // final String countryResult;
  // final double probabilityResult;

  final _personBloc = GuesserBloc();
  late String name;

  // NationalityResultList(this.countryResult, this.probabilityResult);

  List<DummyPerson> dummyPerson = [
    DummyPerson('Dimas', 'Indonesia', 1.00),
  ];

  @override
  void initState() {
    _personBloc.eventSink.add(GuesserAction.Fetch);
    // super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Name Here'),
      ),
      body: Container(
        child: StreamBuilder<List<Country>>(
          stream: _personBloc.nationalitiesStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var country = snapshot.data?[index];
                  return Container(
                    child: Flexible(
                      child: Column(children: [
                        Text(country!.country_id),
                        Text('${country.probability}'),
                      ]),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
