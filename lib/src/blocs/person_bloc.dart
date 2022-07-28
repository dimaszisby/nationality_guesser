import 'dart:async';

import 'package:nationality_guesser_app/src/resources/nationality_api_provider.dart';
import 'package:nationality_guesser_app/src/ui/component/page/nationality_result_list.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/person_model.dart';

enum GuesserAction { Post, Fetch }

class GuesserBloc {
  final _repository = Repository();
  final _api = NationalityApiProvider();
  late String _nameOnBloc = '';

  //State Stream Controller
  final _stateStreamController = StreamController<List<Country>>();
  StreamSink<List<Country>> get nationaliltiesSink =>
      _stateStreamController.sink;
  Stream<List<Country>> get nationalitiesStream =>
      _stateStreamController.stream;

  //Event Stream Controller
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
        if (event == GuesserAction.Post) {
        } else if (event == GuesserAction.Fetch) {
          try {
            GuesserModel guesser =
                //TODO: Figure out how to connect it to Repo
                // await _repository.fetchPersonNationalities();
                await NationalityApiProvider().fetchResult(getNameOnBloc);
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
