import 'package:email_application/CalenderScreen.dart';
import 'package:email_application/ContactScreen.dart';
import 'package:email_application/InboxScreen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: [
          InboxScreen(),
          ContactScreen(),
          CalenderScreen(),
        ].elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(label: 'Inbox', icon: Icon(Icons.mail)),
            BottomNavigationBarItem(
                label: 'Contacts', icon: Icon(Icons.people)),
            BottomNavigationBarItem(
                label: 'Calender', icon: Icon(Icons.calendar_today)),
          ],
          onTap: _onBarItemTap,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
