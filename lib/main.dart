import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_friendly/pages/authPage.dart';

import 'package:task_friendly/pages/home.dart';
import 'package:task_friendly/provider/handler-person-helper.dart';

import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggin = false;
  void setLoggin(isLoggin) {
    setState(() {
      this.isLoggin = isLoggin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.route: (context) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<HandlerPersonHelper>(
            create: (context) => HandlerPersonHelper(),
          ),
        ],
        child: isLoggin ? HomePage() : AuthPage(setLoggin: setLoggin),
      ),
    );
  }
}

// MultiProvider(
// providers: [
//   ChangeNotifierProvider<HandlerPersonHelper>(
//     create: (_) => HandlerPersonHelper(),
//     builder: (context, child) => AuthPage(),
//   ),
// ],
