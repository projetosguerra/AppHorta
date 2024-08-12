// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

Future scheduleNotification(
  String? title,
  String? content,
  DateTime?
      dateTime, // Change type to DateTime for combined date and time parameter
) async {
  // Print the provided date and time for debugging
  print('Provided date and time: $dateTime');

  await requestNotificationPermissions();

  // Initialize the timezone database
  tzdata.initializeTimeZones();

  // Initialize the FlutterLocalNotificationsPlugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize the Android-specific settings for the notification
  var androidSettings = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.high,
    priority: Priority.high,
    icon:
        '@mipmap/ic_launcher', // Replace with your small icon name without the extension
  );

  // Initialize the notification details
  var notificationDetails =
      NotificationDetails(android: androidSettings, iOS: null);

  // Get the device's timezone
  var deviceTimeZone = tz.local;

  // Convert the scheduled date and time to the device's timezone
  var scheduledTime = tz.TZDateTime.from(
    dateTime!,
    deviceTimeZone,
  );

  // Schedule the notification
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    title!,
    content!,
    scheduledTime,
    notificationDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
    payload: 'Custom_Sound',
  );
}
