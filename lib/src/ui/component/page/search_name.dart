import 'package:flutter/material.dart';
import 'package:nationality_guesser_app/src/resources/repository.dart';

import '../../../resources/nationality_api_provider.dart';
import './nationality_result_list.dart';
import '../../../blocs/person_bloc.dart';
import '../atoms/search_name_button.dart';
import '../atoms/search_textfield.dart';

class SearchName extends StatefulWidget {
  const SearchName({Key? key}) : super(key: key);

  @override
  State<SearchName> createState() => _SearchNameState();
}

class _SearchNameState extends State<SearchName> {
  final _personBloc = GuesserBloc();
  final _searchRepo = Repository();
  final _api = NationalityApiProvider();
  TextEditingController _nameController = TextEditingController();
  String personName = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _personBloc.dispose();
    _nameController.dispose();
    super.dispose();
  }

  passNav() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            NationalityResultList(submittedName: _nameController.text)));
  }

  @override
  Widget build(BuildContext context) {
    const progressBar = Center(child: CircularProgressIndicator());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            'Nationality Guesser',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                  ),
                  onChanged: (text) {
                    setState(() {
                      personName = text;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_nameController != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NationalityResultList(
                            submittedName: _nameController.text)));
                  } else {
                    return;
                  }
                },
                child: Text('Search'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
