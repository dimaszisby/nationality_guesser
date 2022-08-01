import 'package:flutter/material.dart';
import 'package:nationality_guesser_app/src/ui/component/atoms/default_textfield.dart';
import 'package:nationality_guesser_app/src/ui/component/atoms/search_name_button.dart';

import '../page/nationality_result_list.dart';

// ignore: use_key_in_widget_constructors
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
    final mediaQuery = MediaQuery.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
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
            boxShadow: const [
              BoxShadow(
                blurRadius: 25,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DefaultTextField(_txController),
                const SizedBox(
                  height: 50,
                ),
                SearchNameButton(
                  () {
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
