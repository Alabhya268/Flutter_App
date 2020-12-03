import 'package:email_application/ContactManager.dart';
import 'package:email_application/Provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  const ContactCounter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);
    return Chip(
      label: StreamBuilder<int>(
          stream: manager.ContactCounter,
          builder: (context, snapshot) {
            return Text(
              (snapshot.data ?? 0).toString(),
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            );
          }),
      backgroundColor: Colors.deepOrange,
    );
  }
}