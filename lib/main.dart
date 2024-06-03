import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:drum/0_splash/splash_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ],
  );

  runApp(
    MaterialApp(
      title: "Drum Simulator",
      theme: ThemeData(fontFamily: 'Lobster'),
      home: const Scaffold(
        body: Splash(),
      ),
    ),
  );
  FlutterNativeSplash.remove();
}
