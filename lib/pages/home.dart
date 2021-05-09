import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_friendly/provider/handler-person-helper.dart';

import '../widgets/app_bar-home.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/grid_menu.dart';

class HomePage extends StatelessWidget {
  static String route = '/homePage';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    HandlerPersonHelper personHandler =
        Provider.of<HandlerPersonHelper>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: CustomAppbar(),
        preferredSize: Size(size.width, size.height * 0.17),
      ),
      bottomNavigationBar: BottomNav(),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: size.height,
          minWidth: size.width,
        ),
        child: Container(
          child: FutureBuilder(
            future: personHandler.initPerson(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Stack(
                children: [
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 25),
                      width: size.width,
                      height: size.height,
                      color: Colors.white,
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        heightFactor: 1,
                        child: GridMenu(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
