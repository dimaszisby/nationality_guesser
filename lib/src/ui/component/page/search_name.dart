import 'package:flutter/material.dart';

import './nationality_result_list.dart';
import '../../../blocs/person_bloc.dart';
import '../atoms/search_name_button.dart';
import '../atoms/search_textfield.dart';

class SearchName extends StatefulWidget {
  @override
  State<SearchName> createState() => _SearchNameState();
}

class _SearchNameState extends State<SearchName> {

  final _personBloc = GuesserBloc();
  late TextEditingController _nameController;
  String name = "";

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

  void searchName() {

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
        body: 
        // StreamBuilder(
        //   stream: _personBloc.eventStream,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //     return Text('');
        //   }
        //   if (snapshot.connectionState == ConnectionState.waiting) {
        //     return progressBar;
        //   }
        //   if (snapshot.hasData) {
        //     return Text('');
        //   } else {
        //     return progressBar;
        //   }
        //   }
        //   child: 
          Container(
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
                        name = text;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Flexible(child: SearchNameButton(searchName)),
              ],
            ),
          ),
        ),
      );
    
  }
}
