import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_friendly/provider/handler-person-helper.dart';
import 'package:task_friendly/provider/models/person-helper.dart';

class Chat extends StatefulWidget {
  final PersonHelp personHelp;
  final ServiceType serviceType;
  final DocumentReference docChatRef;

  const Chat({Key key, this.personHelp, this.serviceType, this.docChatRef})
      : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final PersonHelp personHelp = widget.personHelp;
    final PersonHelp currentUser = Provider.of<PersonHelp>(context);
    final DocumentReference docChatRef = widget.docChatRef;
    final ServiceType serviceType = widget.serviceType;
    final TextEditingController msgController = TextEditingController();
    var size = MediaQuery.of(context).size;
    var keybordHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: size.width,
          minHeight: size.height,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.35,
                color: Colors.teal,
                child: LayoutBuilder(
                  builder: (context, constraints) => SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: constraints.maxHeight * 0.01),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.05),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage(personHelp.profileImage),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      personHelp.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white.withOpacity(0.9),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      personHelp.lastname,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white.withOpacity(0.9),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                padding: EdgeInsets.all(7),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.pin_drop_rounded,
                                  color: Colors.blue,
                                  size: 28,
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: constraints.maxHeight * 0.05),
                          Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Confirm',
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: constraints.maxWidth * 0.02),
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Cancle',
                                    style: TextStyle(
                                        color: Colors.red[300],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.35 - (size.height * 0.05),
              child: Container(
                width: size.width,
                height:
                    size.height - (size.height * 0.35) + (size.height * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.height * 0.045),
                    topRight: Radius.circular(size.height * 0.045),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: ListView.separated(
                              itemCount: 20,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    textDirection: index % 2 == 0
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: index % 2 == 0
                                              ? Colors.teal.withOpacity(0.5)
                                              : Colors.blue.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text('data' * 5),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: keybordHeight == 0 ? 23 : 10,
                                      left: 10),
                                  child: SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller: msgController,
                                      decoration: getInputBorder().copyWith(
                                        hintText: 'Type Message',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: keybordHeight == 0 ? 23 : 10,
                                  right: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  docChatRef.collection("message").add({
                                    "text": msgController.text,
                                    "time": Timestamp.now(),
                                  });
                                  print(msgController.text);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.send,
                                    size: 30,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: keybordHeight),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration getInputBorder() {
  return InputDecoration(
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: EdgeInsets.only(top: 25, left: 20),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
