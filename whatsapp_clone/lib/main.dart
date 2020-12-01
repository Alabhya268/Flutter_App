import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/ChatScreen.dart';
import 'package:whatsapp_clone/Screens/HomePage.dart';
import 'package:whatsapp_clone/Screens/SettingsPage.dart';
import 'Screens/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.teal, accentColor: Colors.green),
      home: LoginScreen(),
    );
  }
}
