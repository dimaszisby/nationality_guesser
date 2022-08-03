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
    final mediaQuery = MediaQuery.of(context);

    final apiRefLink = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Learn more about ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        ReusableLink(
          link: 'nationlize.io',
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.teal,
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleCustom(),
                    SizedBox(height: mediaQuery.size.width * 0.25),
                    SearchNameCard(),
                    SizedBox(height: mediaQuery.size.width * 0.25),
                    apiRefLink,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
