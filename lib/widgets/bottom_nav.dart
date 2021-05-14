import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:task_friendly/services/authService.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() {
          if (i == 2) {
            AuthService().signOut();
            return _currentIndex;
          }
          return _currentIndex = i;
        }),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border, size: 30),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.home, size: 30),
            title: Text("Home"),
            selectedColor: Colors.teal[700],
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person, size: 30),
            title: Text("Profile"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
