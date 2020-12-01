import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/HomePage.dart';
import 'package:whatsapp_clone/Screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/Services/AuthenticationService.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  final key = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _mail = TextEditingController();

  AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.28),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'SignUp',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text('Enter Username and Password to SignUp'),
              ),
              SizedBox(height: 35),
              Form(
                key: key,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: _mail,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          icon: Icon(Icons.person_outline),
                          hintText: 'Username',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: _pass,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          icon: Icon(Icons.lock_outline),
                          hintText: 'Passward',
                        ),
                        obscureText: true,
                        autofocus: false,
                        validator: (value) {
                          if (value.isEmpty) return 'Empty';
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: _confirmPass,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          icon: Icon(Icons.lock_outline),
                          hintText: 'Confirm Passward',
                        ),
                        obscureText: true,
                        autofocus: false,
                        validator: (value) {
                          if (value.isEmpty) return '!Empty';
                          if (value != _pass.text)
                            return '!Password does not Match';
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    FlatButton(
                      child: Text('Signup'),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textColor: Colors.white,
                      onPressed: () async {
                        await _authenticationService.signUp(
                            email: _mail.text, password: _pass.text);
                        _authenticationService.signIn(
                            email: _mail.text, password: _pass.text);
                        _authenticationService.authStateChanges
                            .listen((User user) {
                          if (user == null) {
                            print('User is currently signed out!');
                          } else {
                            print('User is signed in!');
                            if (this.key.currentState.validate()) {
                              this.key.currentState.save();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            }
                          }
                        });
                        print(email + " " + password);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text('Login'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
