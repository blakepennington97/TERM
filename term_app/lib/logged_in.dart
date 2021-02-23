import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'google_signin.dart';
import 'package:provider/provider.dart';
import 'progress.dart';
import 'email.dart';
import 'profile.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _children = [
    Progress(Colors.deepPurple),
    Email(Colors.white),
    Profile(Colors.black)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TERM'),
        backgroundColor: Colors.deepPurple,
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        unselectedItemColor: Colors.white54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Progess',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger),
            label: 'Email',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
