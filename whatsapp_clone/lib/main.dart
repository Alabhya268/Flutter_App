import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/HomePage.dart';
import 'Screens/LoginScreen.dart';
import 'Services/AuthenticationService.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  AuthenticationService _authenticationService = AuthenticationService();

  bool hasSigned = false;

  initState() {
    super.initState();
    _authenticationService.authStateChanges.listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        hasSigned = false;
      } else {
        print('User is signed in!');
        hasSigned = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return snapshot.data;
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'WhatsApp',
            theme: ThemeData(
                primarySwatch: Colors.deepPurple,
                accentColor: Colors.deepPurpleAccent),
            home: hasSigned ? HomePage() : LoginScreen(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          child: Text('loading'),
        );
      },
    );
  }
}
