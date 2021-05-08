import 'package:flutter/material.dart';

import 'package:task_friendly/provider/models/person-helper.dart';
import 'package:task_friendly/widgets/app_bar-checkout-tasker.dart';
import 'package:task_friendly/widgets/bottom_nav.dart';
import 'package:task_friendly/widgets/list-person-helper.dart';

class CheckoutTaskers extends StatefulWidget {
  final String serviceType;
  final List<PersonHelp> personsHelper;
  const CheckoutTaskers({Key key, this.serviceType, this.personsHelper})
      : super(key: key);

  @override
  _CheckoutTaskersState createState() => _CheckoutTaskersState();
}

class _CheckoutTaskersState extends State<CheckoutTaskers> {
  List<PersonHelp> personsHelper;

  @override
  void initState() {
    personsHelper = widget.personsHelper;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    void searchTextField(value) {
      if (value.isEmpty) {
        setState(() {
          personsHelper = widget.personsHelper;
        });
        return;
      }
      setState(() {
        personsHelper = [
          ...personsHelper.where(
            (element) =>
                element.name.contains(value) ||
                element.lastname.contains(value),
          )
        ];
      });
    }

    return Scaffold(
      bottomNavigationBar: Container(
        // color: Colors.teal,
        child: BottomNav(),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: size.height,
          minWidth: size.width,
        ),
        child: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CheckoutTaskerAppbar(widget.serviceType),
              ),
              Positioned(
                top: size.height * 0.13,
                child: Container(
                  width: size.width,
                  height: size.height * 0.87,
                  decoration: BoxDecoration(
                    color: Color(0xffEFECFB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 40,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Taskers',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: size.width / 1.8,
                                      height: 37,
                                      child: TextField(
                                        onChanged: searchTextField,
                                        decoration:
                                            getInputDecoration().copyWith(
                                          labelText: 'Search',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Expanded(
                          child: ListPersonHelper(
                            size: size,
                            personsHelper: personsHelper,
                          ),
                        ),
                      ],
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

InputDecoration getInputDecoration() {
  return InputDecoration(
    contentPadding: EdgeInsets.only(bottom: 37 / 2),
    prefixIcon: Icon(
      Icons.search,
      color: Colors.green,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.green,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.green,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
