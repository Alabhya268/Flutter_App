import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  final String subject;
  final String body;

  const MessageDetail(this.subject, this.body);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.subject)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(this.body),
        ),
      ),
    );
  }
}
