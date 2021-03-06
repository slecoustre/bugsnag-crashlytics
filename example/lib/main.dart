import 'package:flutter/material.dart';
import 'dart:async';

import 'package:bugsnag_crashlytics/bugsnag_crashlytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BugsnagCrashlytics.instance.register(androidApiKey: "ANDROID_API_KEY", iosApiKey: "IOS_API_KEY");

  FlutterError.onError = BugsnagCrashlytics.instance.recordFlutterError;

  runZoned(() {
    runApp(MyApp());
  }, onError: BugsnagCrashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text("Hello Bugsnag"),),
      ),
    );
  }
}

