import 'package:flutter/material.dart';
import 'Screens/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(primarySwatch: Colors.teal, accentColor: Colors.green),
      home: LoginScreen(),
    );
  }
}
