import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:task_friendly/pages/checkout-tasker.dart';
import 'package:task_friendly/pages/profile-hepler.dart';
import 'package:task_friendly/provider/models/person-helper.dart';

class ListPersonHelper extends StatelessWidget {
  ListPersonHelper({
    Key key,
    @required this.size,
    @required this.personsHelper,
  }) : super(key: key);

  final Size size;
  final List<PersonHelp> personsHelper;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) => Opacity(
        child: child,
        opacity: value,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: personsHelper.length,
        itemBuilder: (context, index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileHelper(
                      personHelp: personsHelper[index],
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.9,
                height: 120,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 4,
                      offset: Offset(0, 0),
                      // color: Colors.grey.withOpacity(0.5),
                      color: Color(0xff339687).withOpacity(0.2),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage(
                            personsHelper[index].image,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${personsHelper[index].name} ${personsHelper[index].lastname}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "200฿ / hr ",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 3),
                                SvgPicture.asset("assets/svg/clock.svg",
                                    width: 18, height: 18)
                              ],
                            ),
                            SizedBox(height: 5),
                            FittedBox(
                              child: Row(
                                children: [
                                  ...List.generate(
                                    5,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: SvgPicture.asset(
                                          "assets/svg/star_full.svg",
                                          width: 16,
                                          height: 16,
                                          color: index <= 3
                                              ? Colors.teal
                                              : Colors.teal[100]),
                                    ),
                                  ).toList()
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 35,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              "assets/svg/information.svg",
                              width: 30,
                              height: 30,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
