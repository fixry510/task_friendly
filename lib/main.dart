import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_friendly/pages/authPage.dart';

import 'package:task_friendly/pages/home.dart';
import 'package:task_friendly/provider/handler-person-helper.dart';

import 'package:flutter/rendering.dart';
import 'package:task_friendly/provider/models/person-helper.dart';
import 'package:task_friendly/services/authService.dart';
import 'package:task_friendly/wrapper.dart';

void main() async {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HandlerPersonHelper>(
          create: (context) {
            return HandlerPersonHelper();
          },
        ),
        ChangeNotifierProxyProvider<HandlerPersonHelper, PersonHelp>(
          update: (context, handlerPersonClass, previous) {
            return handlerPersonClass.currentUser;
          },
          create: (context) => PersonHelp(),
        ),
        StreamProvider<FirebaseUser>(
          create: (context) => AuthService().isLogin,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
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
