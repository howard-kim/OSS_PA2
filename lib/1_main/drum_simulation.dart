import 'dart:async';

import 'package:flame/events.dart';

import 'package:flame/game.dart';

class DrumSimulation extends FlameGame with TapDetector {
  late final RouterComponent router;
  // final pauseOverlayIdentifier = 'PauseMenu';
  // final drumPartsRecognition = DrumPartsRecognition();

  @override
  Future<void> onLoad() async {
    // add(drumPartsRecognition);

    return super.onLoad();
  }
}
