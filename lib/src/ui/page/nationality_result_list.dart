import 'package:flutter/material.dart';
import 'dart:io';

import '../../blocs/person_bloc.dart';
import '../../models/person_model.dart';

class NationalityResultList extends StatefulWidget {
  @override
  State<NationalityResultList> createState() => _NationalityResultListState();
}

class _NationalityResultListState extends State<NationalityResultList> {
  // const MyWidget({Key? key}) : super(key: key);
  final _personBloc = GuesserBloc();

  late String name;

  // NationalityResultList(this.countryResult, this.probabilityResult);
  // List<DummyPerson> dummyPerson = [
  //   DummyPerson('Dimas', 'Indonesia', 1.00),
  // ];

  @override
  initState() {
    _personBloc.eventSink.add(GuesserAction.Fetch);
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Name Here'),
      ),
      body: Container(
        child: StreamBuilder<List<Country>>(
          stream: _personBloc.nationalitiesStream,
          builder: (context, snapshot) {
            print('Snapshot Instantiated'); //TODO: Remove Prints
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return SafeArea(
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    print(
                        'snapshot data [0]: ${snapshot.data?[0].countryId}'); //TODO: Remove Prints
                    var country = snapshot.data?[index];
                    var probConvert = (country?.probability) as double;
                    print(probConvert);

                    return Container(
                      height: mediaQuery.size.height * 0.1,
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Country Name: ${country?.countryId}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                  'Probability:${country?.probability.toStringAsFixed(2)}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
