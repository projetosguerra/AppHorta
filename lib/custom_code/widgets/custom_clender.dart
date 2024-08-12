// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/cupertino.dart';

class CustomClender extends StatefulWidget {
  CustomClender({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;
  late DateTime? d = DateTime.now();

  @override
  _CustomClendertState createState() => _CustomClendertState();
}

class _CustomClendertState extends State<CustomClender> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.0,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: selectedDate.isAfter(DateTime.now())
              ? DateTime.now()
              : selectedDate,
          maximumDate: DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              print("calling");
              widget.d = newDate;
              print(widget.d);
              FFAppState().update(() {
                FFAppState().date = widget.d;
              });
            });
          },
        ));
  }
}
