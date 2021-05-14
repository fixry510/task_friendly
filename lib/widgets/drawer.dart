import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_friendly/provider/models/person-helper.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    PersonHelp currentUser = Provider.of<PersonHelp>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: size.width / 1.38),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(currentUser.profileImage),
                    radius: size.width / 6,
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildMenuDrawer(
                        text: '${currentUser.name} ${currentUser.lastname}'),
                    buildMenuDrawer(text: 'Email ${currentUser.email}'),
                    buildMenuDrawer(text: 'Gender ${currentUser.gender}'),
                    buildMenuDrawer(text: 'Age ${currentUser.age}'),
                  ],
                ),
                SizedBox(height: 15),
                Divider(thickness: 2, indent: 30, endIndent: 30),
                SizedBox(height: 15),
                buildMenuDrawer(text: 'About Us'),
                buildMenuDrawer(text: 'Help'),
                buildMenuDrawer(text: 'Contact Us'),
                buildMenuDrawer(text: 'Setting'),
                buildMenuDrawer(text: 'Logout'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuDrawer({String text}) {
    return ListTile(
      leading: Container(
        width: 5,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100].withOpacity(0.9),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
