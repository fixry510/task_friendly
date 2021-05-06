import 'package:flutter/material.dart';

class NavTop extends StatefulWidget {
  @override
  _NavTopState createState() => _NavTopState();
}

class _NavTopState extends State<NavTop> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      color: Colors.blue,
      height: size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Text(
            'Task Friendly',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          Icon(
            Icons.notifications_none_rounded,
            color: Colors.black,
            size: 30,
          ),
        ],
      ),
    );
  }
}
