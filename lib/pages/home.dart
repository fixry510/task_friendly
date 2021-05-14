import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:task_friendly/widgets/drawer.dart';
import '../widgets/app_bar-home.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/grid_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.7).animate(animationController);
    super.initState();
  }

  void onOpenDrawer() {
    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: size.height,
        minWidth: size.width,
      ),
      child: Stack(
        children: [
          MyDrawer(),
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..setEntry(
                  0,
                  3,
                  size.width / 1.6 * animationController.value,
                )
                ..rotateY(((pi / 12)) * animationController.value),
              child: Transform.scale(
                scale: Tween<double>(begin: 1, end: 0.8)
                    .evaluate(animationController),
                child: Card(
                  elevation: 30,
                  color: Colors.transparent,
                  margin: EdgeInsets.zero,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      lerpDouble(0, 35, animationController.value),
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: PreferredSize(
                        child: CustomAppbar(onOpenDrawer: onOpenDrawer),
                        preferredSize: Size(size.width, size.height * 0.17),
                      ),
                      bottomNavigationBar: BottomNav(),
                      body: child,
                    ),
                  ),
                ),
              ),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height,
                minWidth: size.width,
              ),
              child: Container(
                child: Stack(
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// () async {
//   Firestore.instance.collection("testJa").snapshots().forEach((element) {
//     element.documents.forEach((element) {
//       List.from(element.data['name']).forEach((element) {
//         print(element);
//       });
//     });
//   });
// }();
