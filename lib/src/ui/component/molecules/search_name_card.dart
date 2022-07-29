import 'package:flutter/material.dart';

import '../page/nationality_result_list.dart';

class SearchNameCard extends StatefulWidget {
  @override
  State<SearchNameCard> createState() => _SearchNameCardState();
}

class _SearchNameCardState extends State<SearchNameCard> {
  TextEditingController _txController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _txController = TextEditingController();
  }

  @override
  void dispose() {
    _txController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String personName = '';
    const progressBar = Center(child: CircularProgressIndicator());
    final mediaQuery = MediaQuery.of(context);

    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 10)],
            ),
            child: Container(
              height: mediaQuery.size.width * 0.8,
              width: mediaQuery.size.width * 8,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.transparent,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: _txController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name",
                          focusColor: Colors.teal,
                        ),
                        onChanged: (text) {
                          setState(
                            () {
                              personName = text;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_txController.text.isNotEmpty) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => NationalityResultList(
                                  submittedName: _txController.text,
                                ),
                              ),
                            );
                          } else {
                            return;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        child: const Text('Search'),
                      ),
                    )
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
