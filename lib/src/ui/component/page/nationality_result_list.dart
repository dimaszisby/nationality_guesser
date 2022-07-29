import 'package:flutter/material.dart';

import '../../../blocs/person_bloc.dart';
import '../../../models/person_model.dart';

// ignore: must_be_immutable
class NationalityResultList extends StatefulWidget {
  late String submittedName;

  NationalityResultList({Key? key, required this.submittedName})
      : super(key: key);

  String get name => submittedName;

  @override
  State<NationalityResultList> createState() =>
      // ignore: no_logic_in_create_state
      _NationalityResultListState(submittedName: submittedName);
}

class _NationalityResultListState extends State<NationalityResultList> {
  final _personBloc = GuesserBloc();
  String submittedName;

  _NationalityResultListState({required this.submittedName});

  @override
  initState() {
    super.initState();
    checkInput();
    _personBloc.eventSink.add(GuesserAction.Fetch);
  }

  checkInput() {
    _personBloc.setNameOnBloc = submittedName;
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 15,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Search Result for',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '"$submittedName"',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var country = snapshot.data?[index];
                        return SizedBox(
                          height: mediaQuery.size.height * 0.20,
                          child: Card(
                            color: Colors.teal.withAlpha(220),
                            elevation: 10,
                            margin: const EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Country Name',
                                        style: TextStyle(fontSize: 14, color: Colors.white,),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        '${country?.countryId}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32, 
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(color: Colors.white,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Probability',
                                        style: TextStyle(fontSize: 14, color: Colors.white,),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        '${country?.probability.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32, color: Colors.white,
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
                  ),
                ],
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
