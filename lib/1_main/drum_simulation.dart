import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:drum/1_main/drum_parts_recognition.dart';

class DrumSimulation extends FlameGame with TapDetector {
  late final RouterComponent router;
  // final pauseOverlayIdentifier = 'PauseMenu';
  final drumPartsRecognition = DrumPartsRecognition();

  @override
  Future<void> onLoad() async {
    add(drumPartsRecognition);

    return super.onLoad();
  }
}
