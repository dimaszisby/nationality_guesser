import 'dart:async';

import '../di/injection.dart';
import '../resources/repository.dart';
import '../models/person_model.dart';

enum GuesserAction { post, fetch }

class GuesserBloc {
  final _repository = locator<Repository>();
  late String _nameOnBloc = '';

  final _stateStreamController = StreamController<List<Country>>();
  StreamSink<List<Country>> get nationaliltiesSink =>
      _stateStreamController.sink;
  Stream<List<Country>> get nationalitiesStream =>
      _stateStreamController.stream;

  final _eventStreamController = StreamController<GuesserAction>();
  EventSink<GuesserAction> get eventSink => _eventStreamController.sink;
  Stream<GuesserAction> get eventStream => _eventStreamController.stream;

  String get getNameOnBloc {
    return _nameOnBloc;
  }

  set setNameOnBloc(String newName) {
    _nameOnBloc = newName;
  }

  GuesserBloc() {
    eventStream.listen(
      (event) async {
        if (event == GuesserAction.post) {
        } else if (event == GuesserAction.fetch) {
          try {
            _repository.setNameOnRepo = getNameOnBloc;
            GuesserModel guesser =
                await _repository.fetchPersonNationalities();
            if (guesser != null) {
              nationaliltiesSink.add(guesser.country);
            } else {
              nationaliltiesSink
                  .addError('person_bloc.dart: Fetch Data Failed');
            }
          } on Exception catch (e) {
            nationaliltiesSink.addError('person_bloc.dart: Fetch Data Failed');
          }
        }
      },
    );
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
