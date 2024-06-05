import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:drum/0_splash/splash_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    ProviderScope(
      child: MaterialApp(
        title: "Drum Simulator",
        theme: ThemeData(fontFamily: 'ABeeZee'),
        home: const Scaffold(body: Splash()),
      ),
    ),
  );
  FlutterNativeSplash.remove();
}
