import 'package:email_application/MessageCompose.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) =>
             MessageCompose(),
          ),);
        },
      );
  }
}