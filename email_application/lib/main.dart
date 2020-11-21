import 'package:flutter/material.dart';

import 'MessageList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.deepPurpleAccent,
        primarySwatch: Colors.purple,
      ),
      home: MessageList(title: 'Email App'),
    );
  }
}
