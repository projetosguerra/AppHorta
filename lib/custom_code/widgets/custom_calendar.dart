// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:easy_date_timeline/easy_date_timeline.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
          },
          dayProps: const EasyDayProps(
            height: 56.0,
            // You must specify the width in this case.
            width: 124.0,
          ),
          headerProps: const EasyHeaderProps(
            dateFormatter: DateFormatter.fullDateMonthAsStrDY(),
          ),
          itemBuilder: (context, date, isSelected, onTap) {
            return InkWell(
              // You can use `InkResponse` to make your widget clickable.
              // The `onTap` callback responsible for triggering the `onDateChange`
              // callback.
              onTap: onTap,
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                //the same width that provided previously.
                width: 124.0,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xffFF6D60) : null,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      EasyDateFormatter.shortMonthName(date, "en_US"),
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            isSelected ? Colors.white : const Color(0xff6D5D6E),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      date.day.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            isSelected ? Colors.white : const Color(0xff393646),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      EasyDateFormatter.shortDayName(date, "en_US"),
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            isSelected ? Colors.white : const Color(0xff6D5D6E),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
