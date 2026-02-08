import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:history_simple_app/app_widget.dart';
import 'package:history_simple_app/core/di/setup_injection.dart';
import 'package:loggy/loggy.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: kDebugMode
        ? const PrettyDeveloperPrinter()
        : const PrettyPrinter(
            showColors: true,
          ),
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.error,
    ),
  );
  setupInjection();
  runApp(const AppWidget());
}
