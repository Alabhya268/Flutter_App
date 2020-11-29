import 'package:email_application/Message.dart';
import 'package:email_application/MessageCompose.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  final List<Message> messages;

  ComposeButton(this.messages);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MessageCompose(),
          ),
        );
        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Your message has been sent'),
            ),
          );
          messages.add(message);
          print(messages);
          print(messages.length);
        }
      },
    );
  }
}
