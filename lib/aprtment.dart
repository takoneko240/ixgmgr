import 'package:first_flutter/mypage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:html' as html;

class ApartmentPage extends StatefulWidget {
  ApartmentPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ApartmentPageState createState() => _ApartmentPageState();
}

class _ApartmentPageState extends State<ApartmentPage> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 800,
          child:
          Stepper(
            currentStep: _index,
            onStepCancel: () {
              if (_index > 0) {
                setState(() {
                  _index -= 1;
                });
              }
            },
            onStepContinue: () {
              if (_index <= 0) {
                setState(() {
                  _index += 1;
                });
              }
            },
            onStepTapped: (int index) {
              setState(() {
                //_index = index;
              });
            },
            steps: <Step>[
              Step(
                title: const Text('Step 1 Enter the system name'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      initialValue: "",
                      keyboardType: TextInputType.emailAddress,
                      // Use email input type for emails.
                      decoration: new InputDecoration(
                          hintText: 'system name', labelText: 'System Name'),
                    ),
                ),
              ),
              Step(
                title: Text('Step 2 title'),
                content: Text('Content for Step 2'),
              ),

            ],
          ),
        )
      ),
    );
  }
}