import 'package:flutter/material.dart';
import 'package:nationality_guesser_app/src/resources/nationality_api_provider.dart';
import 'package:nationality_guesser_app/src/resources/repository.dart';

import '../../../blocs/person_bloc.dart';
import '../../../models/person_model.dart';

class NationalityResultList extends StatefulWidget {
  late String submittedName;

  NationalityResultList({required this.submittedName});

  String get name => submittedName;

  @override
  State<NationalityResultList> createState() =>
      _NationalityResultListState(submittedName: submittedName);
}

class _NationalityResultListState extends State<NationalityResultList> {
  final _personBloc = GuesserBloc();
  final _api = NationalityApiProvider();
  String submittedName;

  _NationalityResultListState({required this.submittedName});

  @override
  initState() {
    super.initState();
    print('[result - passed name 1]:${submittedName}');
    checkInput();
    _personBloc.eventSink.add(GuesserAction.Fetch);
  }

  checkInput() {
    _personBloc.setNameOnBloc = submittedName;
    print('[result - passed name 2]:$submittedName');
  }

  @override
  void dispose() {
    _personBloc.dispose();
    super.dispose();
  }

  String getNameOnView(String name) {
    return submittedName;
  }

  set setNameOnView(String newName) {
    submittedName = newName;
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
              ),
            );
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
                    height: mediaQuery.size.height * 0.20,
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Country Name',
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '${country?.countryId}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                                ),
                              ],
                            ),
                            const VerticalDivider(color: Colors.black),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Probability',
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '${country?.probability.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                                ),
                              ],
                            ),
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
