import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GridMenu extends StatefulWidget {
  @override
  _GridMenuState createState() => _GridMenuState();
}

class _GridMenuState extends State<GridMenu> {
  List menuItem = [
    {
      "name": "Handyman",
      "image": "assets/svg/handy.svg",
      "color": Color(0xffAAE5FF)
    },
    {
      "name": "Personal Assistant",
      "image": "assets/svg/personal-assistant.svg",
      "color": Color(0xffACC2EE)
    },
    {
      "name": "Party Events",
      "image": "assets/svg/party.svg",
      "color": Color(0xff71AFD5)
    },
    {
      "name": "Wait in Line",
      "image": "assets/svg/wait_in_line.svg",
      "color": Color(0xff319BB2)
    },
    {
      "name": "Office Service",
      "image": "assets/svg/office_service.svg",
      "color": Color(0xff008487)
    },
    {
      "name": "Yardwork Garden",
      "image": "assets/svg/gardening.svg",
      "color": Color(0xffFFCCB1)
    },
    {
      "name": "Delivery",
      "image": "assets/svg/delivery.svg",
      "color": Color(0xffFFDE85)
    },
    {
      "name": "Moving Service",
      "image": "assets/svg/moving_service.svg",
      "color": Color(0xffDAEBED)
    },
    {
      "name": "Friend For You",
      "image": "assets/svg/friend_for_you.svg",
      "color": Color(0xff9082ED)
    },
    {
      "name": "Cleaning",
      "image": "assets/svg/cleaning.svg",
      "color": Color(0xffFBF7FF)
    },
    {
      "name": "Furniture Assembly",
      "image": "assets/svg/furniture.svg",
      "color": Color(0xff66CFE1)
    },
    {
      "name": "Cooking",
      "image": "assets/svg/cooking.svg",
      "color": Color(0xffE0D7FF)
    },
  ];
  @override
  Widget build(BuildContext context) {
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
        return Container(
          decoration: BoxDecoration(
            // color: Color(0xffE0D7FF),
            color: menuItem[index]['color'],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon(Icons.cleaning_services, size: 30),
              // Expanded(
              //   child: Container(
              //     child: Image.asset(
              //       menuItem[index]['image'],
              //       width: index == 3 ? 85 : 80,
              //       height: index == 3 ? 85 : 80,
              //     ),
              //   ),
              // ),
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
                menuItem[index]['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
