import 'package:flutter/material.dart';

import '../atoms/nationalize_link.dart';
import '../atoms/title_custom.dart';
import '../molecules/search_name_card.dart';
import '../../../blocs/person_bloc.dart';

class SearchName extends StatefulWidget {
  const SearchName({Key? key}) : super(key: key);

  @override
  State<SearchName> createState() => _SearchNameState();
}

class _SearchNameState extends State<SearchName> {
  final _personBloc = GuesserBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _personBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const progressBar = Center(child: CircularProgressIndicator());
    final mediaQuery = MediaQuery.of(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            '',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Container(
          //container for Main Foreground color
          color: Colors.teal,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TitleCustom(),
                SearchNameCard(),
                NationalizeLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
