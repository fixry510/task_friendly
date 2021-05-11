import 'package:flutter/material.dart';

class CheckoutTaskerAppbar extends StatefulWidget {
  CheckoutTaskerAppbar(title) : this.title = title;
  final String title;
  @override
  _CheckoutTaskerAppbarState createState() => _CheckoutTaskerAppbarState();
}

class _CheckoutTaskerAppbarState extends State<CheckoutTaskerAppbar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.17,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.teal[700],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 25,
                      textBaseline: TextBaseline.ideographic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container())
          ],
        ),
      ),
    );
  }
}
