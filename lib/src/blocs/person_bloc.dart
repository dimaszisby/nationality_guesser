import 'dart:async';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/person_model.dart';

enum GuesserAction { Post, Fetch }

class GuesserBloc {
  final _repository = Repository();
  // final _personNationalityFetcher = PublishSubject<Person>(); //LEARN: Published Subject

  //Observable<Person> get personNationalities => _personNationalityFetcher.stream; //NOTE: This is the default

  //NOTE: -Testing for Stream block state management
  //State Stream Controller
  final _stateStreamController = StreamController<Country>();
  StreamSink<Country> get nationaliltiesSink => _stateStreamController.sink;
  Stream<Country> get nationalitiesStream => _stateStreamController.stream;

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
          GuesserModel guess = await _repository.fetchPersonNationalities();
          if (guess != null) {
            nationaliltiesSink.add(guess);
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

  // NOTE: This is the default
  // fetchPersonNationalities() async {
  //   Person person = await _repository.fetchPersonNationalities();
  //   _personNationalityFetcher.sink.add(person);
  // }

  void dispose() {
    // _personNationalityFetcher.close();
    _stateStreamController.close();
    _eventStreamController.close();
  }

  final bloc = GuesserBloc();
}
