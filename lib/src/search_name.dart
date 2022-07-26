import 'package:flutter/material.dart';
import 'package:nationality_guesser_app/src/ui/component/atom/search_name_button.dart';

class SearchName extends StatefulWidget {
  @override
  State<SearchName> createState() => _SearchNameState();
}

class _SearchNameState extends State<SearchName> {
  // const MyWidget({Key? key}) : super(key: key);
  late TextEditingController _nameController;
  String name = "";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void searchName() {
    print('Function Temp');
  }

  @override
  Widget build(BuildContext context) {


    final nameTextField = Flexible(
      child: TextField(
        controller: _nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Full Name',
        ),
        onChanged: (text) {
          setState(() {
            name = text;
          });
        },
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Nationality Guesser',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Container(
            //TODO: 2nd Segment
            child: Container(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                nameTextField,
                SizedBox(
                  height: 50,
                ),
                SearchNameButton(searchName),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
