import 'package:email_application/App.dart';
import 'package:email_application/ContactManager.dart';
import 'package:email_application/Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: ContactManager(),
        child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.deepPurpleAccent,
          primarySwatch: Colors.purple,
        ),
        home: App(),
      ),
    );
  }
}
