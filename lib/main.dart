import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_friendly/pages/authPage.dart';

import 'package:task_friendly/pages/home.dart';
import 'package:task_friendly/provider/handler-person-helper.dart';

import 'package:task_friendly/provider/models/person-helper.dart';
import 'package:task_friendly/services/authService.dart';
import 'package:task_friendly/widgets/loading.dart';

void main() async {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //asdsad
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>(
          create: (context) => AuthService().isLogin,
        ),
      ],
      child: SeccodeAppState(),
    );
  }
}

class SeccodeAppState extends StatefulWidget {
  const SeccodeAppState({
    Key key,
  }) : super(key: key);

  @override
  _SeccodeAppStateState createState() => _SeccodeAppStateState();
}

class _SeccodeAppStateState extends State<SeccodeAppState> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if (user == null) {
      return MaterialApp(home: AuthPage(), debugShowCheckedModeBanner: false);
    }
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
          builder: (context) => FutureBuilder(
            future: Provider.of<HandlerPersonHelper>(context).initPersons(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Loading(),
                );
              }
              return HomePage();
            },
          ),
        ),
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
