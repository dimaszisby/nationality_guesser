import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/person_model.dart';

class PersonBloc {
  final _repository = Repository();
  final _personNationalityFetcher = PublishSubject<Person>(); //LEARN: Published Subject

  Observable<Person> get personNationalities => _personNationalityFetcher.stream;

  fetchPersonNationalities() async {
    Person person = await _repository.fetchPersonNationalities();
    _personNationalityFetcher.sink.add(person);
  }

  dispose() {
    _personNationalityFetcher.close();
  }
  final bloc = PersonBloc();
}
