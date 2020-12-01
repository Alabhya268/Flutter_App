import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/HomePage.dart';
import 'package:whatsapp_clone/Screens/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  final key = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _mail = TextEditingController();
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
              'Login',
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
                child: Text('Enter Username and Password to Login'),
              ),
              SizedBox(height: 35),
              Column(
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
                      onSaved: (value) {
                        email = value;
                      },
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
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  FlatButton(
                    child: Text('Login'),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New User?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        child: Text('Signup'),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
