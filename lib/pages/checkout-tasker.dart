import 'package:flutter/material.dart';

class CheckoutTaskers extends StatefulWidget {
  final String serviceType;

  const CheckoutTaskers({Key key, this.serviceType}) : super(key: key);

  @override
  _CheckoutTaskersState createState() => _CheckoutTaskersState();
}

class _CheckoutTaskersState extends State<CheckoutTaskers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.serviceType),
      ),
    );
  }
}
