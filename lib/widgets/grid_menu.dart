import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:task_friendly/pages/checkout-tasker.dart';
import 'package:task_friendly/provider/handler-person-helper.dart';
import 'package:task_friendly/provider/models/person-helper.dart';

class GridMenu extends StatefulWidget {
  @override
  _GridMenuState createState() => _GridMenuState();
}

class _GridMenuState extends State<GridMenu> {
  List menuItem = [
    {
      "serviceType": "Handyman",
      "image": "assets/svg/handy.svg",
      "color": Color(0xffAAE5FF)
    },
    {
      "serviceType": "Personal Assistant",
      "image": "assets/svg/personal-assistant.svg",
      "color": Color(0xffACC2EE)
    },
    {
      "serviceType": "Party Events",
      "image": "assets/svg/party.svg",
      "color": Color(0xff71AFD5)
    },
    {
      "serviceType": "Wait in Line",
      "image": "assets/svg/wait_in_line.svg",
      "color": Color(0xff319BB2)
    },
    {
      "serviceType": "Office Service",
      "image": "assets/svg/office_service.svg",
      "color": Color(0xff008487)
    },
    {
      "serviceType": "Yardwork Garden",
      "image": "assets/svg/gardening.svg",
      "color": Color(0xffFFCCB1)
    },
    {
      "serviceType": "Delivery",
      "image": "assets/svg/delivery.svg",
      "color": Color(0xffFFDE85)
    },
    {
      "serviceType": "Moving Service",
      "image": "assets/svg/moving_service.svg",
      "color": Color(0xffDAEBED)
    },
    {
      "serviceType": "Friend For You",
      "image": "assets/svg/friend_for_you.svg",
      "color": Color(0xff9082ED)
    },
    {
      "serviceType": "Cleaning",
      "image": "assets/svg/cleaning.svg",
      "color": Color(0xffFBF7FF)
    },
    {
      "serviceType": "Furniture Assembly",
      "image": "assets/svg/furniture.svg",
      "color": Color(0xff66CFE1)
    },
    {
      "serviceType": "Cooking",
      "image": "assets/svg/cooking.svg",
      "color": Color(0xffE0D7FF)
    },
  ];
  @override
  Widget build(BuildContext context) {
    HandlerPersonHelper personHelps = Provider.of<HandlerPersonHelper>(context);
    return GridView.builder(
      itemCount: menuItem.length,
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 200,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            List<Map<String, dynamic>> personsAndService = await personHelps
                .getPersonHelperWithService(menuItem[index]['serviceType']);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CheckoutTaskers(
                  serviceType: menuItem[index]['serviceType'],
                  personsHelper: personsAndService,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              // color: Color(0xffE0D7FF),
              color: menuItem[index]['color'],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    menuItem[index]['image'],
                    width: 80,
                    height: 80,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  menuItem[index]['serviceType'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
