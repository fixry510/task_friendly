import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_friendly/pages/home.dart';
import 'package:task_friendly/provider/handler-person-helper.dart';

import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<HandlerPersonHelper>(
          create: (_) => HandlerPersonHelper(),
        ),
      ], child: HomePage()),
    );
  }
}
