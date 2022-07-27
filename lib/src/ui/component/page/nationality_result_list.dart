import 'package:flutter/material.dart';

import '../../../blocs/person_bloc.dart';
import '../../../models/person_model.dart';

class NationalityResultList extends StatefulWidget {
  late String name;

  NationalityResultList({Key? key, required this.name}) : super(key: key);

  @override
  State<NationalityResultList> createState() => _NationalityResultListState(name: name);
}

class _NationalityResultListState extends State<NationalityResultList> {
  final _personBloc = GuesserBloc();
  late String name;

  _NationalityResultListState({required this.name});

  @override
  initState() {
    super.initState();
    _personBloc.eventSink.add(GuesserAction.Fetch);
    
  }

  @override
  void dispose() {
    _personBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    const progressBar = Center(child: CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<List<Country>>(
        stream: _personBloc.nationalitiesStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Try agin later',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return progressBar;
          }
          if (snapshot.hasData) {
            return SafeArea(
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var country = snapshot.data?[index];
                  return SizedBox(
                    height: mediaQuery.size.height * 0.1,
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Country Name: ${country?.countryId}',
                              style: const TextStyle(
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
          } else {
            return progressBar;
          }
        },
      ),
    );
  }
}