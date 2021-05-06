import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/grid_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
    );
  }
}
