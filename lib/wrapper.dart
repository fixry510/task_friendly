import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_friendly/pages/authPage.dart';
import 'package:task_friendly/pages/home.dart';
import 'package:task_friendly/provider/models/person-helper.dart';
import 'package:task_friendly/provider/models/user.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<PersonHelp>(context);
    if (user == null) {
      return AuthPage();
    }
    return HomePage();
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController textEditingController = TextEditingController();
  String email = '';
  CollectionReference col = Firestore.instance.collection("chats");
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
      stream: col.orderBy('time', descending: false).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        QuerySnapshot querySnapshot = snapshot.data;
        List<DocumentSnapshot> docs = querySnapshot.documents;
        return Scaffold(
          appBar: AppBar(
            title: Text('chat'),
            actions: [
              TextButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: docs.length,
                  // reverse: true,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return Row(
                      textDirection: user.uid == docs[index].data['userId']
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: user.uid == docs[index].data['userId']
                                ? Colors.blue
                                : Colors.pink,
                            child: Text(
                              docs[index].data['text'],
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 20,
                        child: TextField(
                          controller: textEditingController,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        StorageReference ref = FirebaseStorage.instance
                            .ref()
                            .child("ei_ei")
                            .child("testjaa.jpeg");
                        final url = await ref.getDownloadURL();
                        print(ref.path.split('/'));
                        // File imagePlaceHolder = await convertImage(
                        //     'assets/handyman/barber_man.jpeg');
                        // await ref.putFile(imagePlaceHolder).onComplete;
                        // FocusScope.of(context).unfocus();
                        // await col.add({
                        //   "text": textEditingController.text,
                        //   "time": Timestamp.now(),
                        //   "userId": user.uid,
                        // });
                      },
                      child: Text('send'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

Future<File> convertImage(path) async {
  var bytes = await rootBundle.load(path);
  String tempPath = (await getTemporaryDirectory()).path;
  File file = File('$tempPath/profile.png');
  await file.writeAsBytes(
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
  print(file);
  return file;
}
