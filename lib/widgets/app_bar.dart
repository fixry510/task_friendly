import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF6C63BE),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 28,
                  ),
                  Text(
                    'Task Friendly',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/bell.svg",
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      ),
                      Positioned(
                        left: -10,
                        top: -10,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red[400],
                          ),
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              if (size.height > 500) SizedBox(height: 5),
              if (size.height > 500)
                Text(
                  '  Hi ',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              if (size.height > 500) SizedBox(height: 5),
              if (size.height > 500)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '  Welcome Back',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    SvgPicture.asset("assets/svg/clap-2.svg",
                        width: 30, height: 30)
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
