import 'dart:async';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/person_model.dart';

enum GuesserAction { Post, Fetch }

class GuesserBloc {
  final _repository = Repository();

  //State Stream Controller
  final _stateStreamController = StreamController<List<Country>>();
  StreamSink<List<Country>> get nationaliltiesSink => _stateStreamController.sink;
  Stream<List<Country>> get nationalitiesStream => _stateStreamController.stream;

  //Event Stream Controller
  final _eventStreamController = StreamController<GuesserAction>();
  EventSink<GuesserAction> get eventSink => _eventStreamController.sink;
  Stream<GuesserAction> get eventStream => _eventStreamController.stream;

  GuesserBloc() {
    eventStream.listen((event) async {
      if (event == GuesserAction.Post) {
        //POST person name
        return; //TODO: POST  DATA HERE
      } else if (event == GuesserAction.Fetch) {
        //Fetching Search Result
        try {
          GuesserModel guesser = await _repository.fetchPersonNationalities();
          if (guesser != null) {
            nationaliltiesSink.add(guesser.country);
          } else {
            nationaliltiesSink
                .addError('person_bloc.dart: Fetch Data Failed');
          }
        } on Exception catch (e) {
          nationaliltiesSink
              .addError('person_bloc.dart: Fetch Data Failed');
        }
      }
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }

}
