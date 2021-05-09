import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_friendly/pages/authPage.dart';
import 'package:task_friendly/pages/home.dart';
import 'package:task_friendly/provider/models/user.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return AuthPage();
    }
    return HomePage();
  }
}
