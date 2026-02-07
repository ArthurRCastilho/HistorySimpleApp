import 'package:flutter/material.dart';
import 'package:history_simple_app/app_widget.dart';
import 'package:history_simple_app/core/di/setup_injection.dart';

void main() {
  setupInjection();
  runApp(const AppWidget());
}
