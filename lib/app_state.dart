import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _currentGreeting = '';
  String get currentGreeting => _currentGreeting;
  set currentGreeting(String value) {
    _currentGreeting = value;
  }

  String _currentBackground = '';
  String get currentBackground => _currentBackground;
  set currentBackground(String value) {
    _currentBackground = value;
  }
}
