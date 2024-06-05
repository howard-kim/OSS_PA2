import 'package:drum/2_beat_game/splash_screen.dart';
import 'package:flame/game.dart';

import 'package:flutter/rendering.dart';

class BeatGame extends FlameGame {
  BeatGame({required this.level});
  final int level;
  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    add(SplashScreen(level));
    // add(GameScore(score: 100, level: 3));
  }

  @override
  void render(Canvas canvas) {
    canvas.drawColor(const Color.fromARGB(204, 23, 4, 72), BlendMode.srcATop);
    super.render(canvas);
  }

  @override
  void onRemove() {
    // print("Beat Game Removed");
    super.onRemove();
  }
}
