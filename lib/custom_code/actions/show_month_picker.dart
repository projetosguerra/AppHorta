// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:month_picker_dialog/month_picker_dialog.dart' as MonthPicker;

Future<DateTime?> showMonthPicker(
  BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
) async {
  return await MonthPicker.showMonthPicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(1970),
    lastDate: lastDate ?? DateTime(2050),
  );
}
