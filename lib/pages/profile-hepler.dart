import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_friendly/provider/models/person-helper.dart';

class ProfileHelper extends StatefulWidget {
  final PersonHelp personHelp;

  const ProfileHelper({Key key, this.personHelp}) : super(key: key);
  @override
  _ProfileHelperState createState() => _ProfileHelperState();
}

class _ProfileHelperState extends State<ProfileHelper> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    PersonHelp personHelp = widget.personHelp;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: size.width,
          minHeight: size.height,
        ),
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: statusBarHeight,
                left: 0,
                width: size.width,
                height: size.height - statusBarHeight,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: 60,
                            bottom: 40,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: size.width * 0.33,
                                      height: size.height * 0.25,
                                      child: Image.asset(
                                        personHelp.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: size.height * 0.25,
                                      maxHeight: size.height * 0.25,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.45,
                                          child: Text(
                                            size.height > 700
                                                ? personHelp.name
                                                : "${personHelp.name} ${personHelp.lastname}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        if (size.height > 700)
                                          SizedBox(
                                            width: size.width * 0.45,
                                            child: Text(
                                              personHelp.lastname,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        Expanded(child: Container()),
                                        Text(
                                          "70฿/hr",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          "gender : ${personHelp.gender}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          "age : ${personHelp.age}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        FittedBox(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.red
                                                      .withOpacity(0.2),
                                                ),
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.red,
                                                  size: 30,
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Container(
                                                padding: EdgeInsets.all(7),
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.teal
                                                      .withOpacity(0.2),
                                                ),
                                                child: Icon(
                                                  Icons.pin_drop_rounded,
                                                  color: Colors.teal,
                                                  size: 28,
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue
                                                      .withOpacity(0.2),
                                                ),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Colors.blue,
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'About',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: size.height * 0.15,
                            minHeight: size.height * 0.15,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: SingleChildScrollView(
                              child: Text(
                                "${personHelp.description}",
                                style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                                // style:
                                //     TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'My Skill',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: size.width,
                          height: size.height * 0.2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding:
                                const EdgeInsets.only(left: 25, right: 30.0),
                            itemCount: personHelp.imageSkill.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100,
                                width: 200,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    personHelp.imageSkill[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: statusBarHeight + 15,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: size.width,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Select',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                minimumSize: Size(0, 40),
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            flex: 4,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Cancle',
                                style: TextStyle(fontSize: 18),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.red[300],
                                minimumSize: Size(0, 40),
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
