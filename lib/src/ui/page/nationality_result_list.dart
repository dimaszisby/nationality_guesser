import 'package:flutter/material.dart';

import '../../blocs/person_bloc.dart';
import '../../models/person_model.dart';

class NationalityResultList extends StatefulWidget {
  @override
  State<NationalityResultList> createState() => _NationalityResultListState();
}

class _NationalityResultListState extends State<NationalityResultList> {
  final _personBloc = GuesserBloc();
  late String name;

  @override
  initState() {
    _personBloc.eventSink.add(GuesserAction.Fetch);
    super.initState();
  }

  @override
  void dispose() {
    _personBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<List<Country>>(
          stream: _personBloc.nationalitiesStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Try agin later');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
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
              return CircularProgressIndicator();
            }
          }

          // if (snapshot.hasError) {
          //   //TODO: Make more conditions (e.g loading)
          //   return Center(
          //     child: Text('${snapshot.error}'),
          //   );
          // } else {}

          ),
    );
  }
}
