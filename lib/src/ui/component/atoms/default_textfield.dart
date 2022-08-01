import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {

  late TextEditingController txEdit;

  DefaultTextField(this.txEdit);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState(txEdit);
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  final TextEditingController _txController = TextEditingController();

  late TextEditingController txEdit;

  _DefaultTextFieldState(this.txEdit);

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
