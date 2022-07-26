import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/person_model.dart';

class PersonBloc {
  final _repository = Repository();
  final _personFetcher = PublishSubject<Person>(); //LEARN: Published Subject

  Observable<Person> get personNationalities => _personFetcher.stream;

  fetchPersonNationalities() async {
    Person person = await _repository.fetchPersonNationalities();
    _personFetcher.sink.add(person);
  }

  dispose() {
    _personFetcher.close();
  }
  final bloc = PersonBloc();
}
