import 'package:flutter/material.dart';

class ReusableTextField extends StatefulWidget {

  late TextEditingController txEdit;

  ReusableTextField(this.txEdit, {Key? key}) : super(key: key);

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState(txEdit);
}

class _ReusableTextFieldState extends State<ReusableTextField> {

  late TextEditingController txEdit;

  _ReusableTextFieldState(this.txEdit);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: txEdit,
        autofocus: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Name",
          focusColor: Colors.teal,
        ),
        onChanged: (text) {
          setState(
            () {},
          );
        },
      ),
    );
  }
}
