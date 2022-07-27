import 'dart:async';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/person_model.dart';

enum PersonAction { Post, Fetch }

class PersonBloc {
  final _repository = Repository();
  // final _personNationalityFetcher = PublishSubject<Person>(); //LEARN: Published Subject

  //Observable<Person> get personNationalities => _personNationalityFetcher.stream; //NOTE: This is the default

  //NOTE: -Testing for Stream block state management
  //State Stream Controller
  final _stateStreamController = StreamController<Person>();
  StreamSink<Person> get personNationalitiesSink => _stateStreamController.sink;
  Stream<Person> get personNationalitiesStream => _stateStreamController.stream;

  //Event Stream Controller
  final _eventStreamController = StreamController<PersonAction>();
  EventSink<PersonAction> get eventSink => _eventStreamController.sink;
  Stream<PersonAction> get eventStream => _eventStreamController.stream;

  PersonBloc() {
    eventStream.listen((event) async {
      if (event == PersonAction.Post) {
        //POST person name
        return; //TODO: POST  DATA HERE
      } else if (event == PersonAction.Fetch) {
        //Fetching Search Result
        try {
          Person person = await _repository.fetchPersonNationalities();
          if (person != null) {
            personNationalitiesSink.add(person);
          } else {
            personNationalitiesSink
                .addError('person_bloc.dart: Fetch Data Failed');
          }
        } on Exception catch (e) {
          personNationalitiesSink
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

  final bloc = PersonBloc();
}
