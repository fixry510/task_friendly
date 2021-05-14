import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_friendly/provider/handler-person-helper.dart';
import 'package:task_friendly/provider/models/person-helper.dart';
import 'package:task_friendly/services/authService.dart';

class CustomAppbar extends StatefulWidget {
  final Function onOpenDrawer;

  const CustomAppbar({Key key, this.onOpenDrawer}) : super(key: key);

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  String currentUserUid = '';
  CollectionReference colNotification;
  int notificationAmount = 0;

  @override
  Widget build(BuildContext context) {
    PersonHelp currentUser = Provider.of<PersonHelp>(context);
    colNotification =
        Firestore.instance.collection("users/${currentUser.uid}/notification");
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        // color: Color(0xFF6C63BE),
        color: Colors.teal[700],
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
                  GestureDetector(
                    onTap: widget.onOpenDrawer,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  Text(
                    'Task Friendly',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  StreamBuilder(
                      stream: colNotification.snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting ||
                            !snapshot.hasData) {
                          return Container();
                        }
                        QuerySnapshot querySnapshot = snapshot.data;
                        List<DocumentSnapshot> docqumentSnapshot =
                            querySnapshot.documents
                                .where(
                                  (element) => element.data['isSee'] == false,
                                )
                                .toList();

                        return GestureDetector(
                          onTap: () {
                            showNotification(context);
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/bell.svg",
                                width: 25,
                                height: 25,
                                color: Colors.white,
                              ),
                              if (docqumentSnapshot.length > 0)
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
                                        "${docqumentSnapshot.length}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        );
                      })
                ],
              ),
              if (size.height > 500) SizedBox(height: 5),
              if (size.height > 500)
                Text(
                  '  Hi ${currentUser.name}',
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

  void showNotification(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
