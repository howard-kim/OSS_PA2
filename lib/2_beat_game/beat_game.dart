import 'package:drum/2_beat_game/screens/splash_screen.dart';
import 'package:flame/game.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BeatGame extends FlameGame {
  BeatGame({required this.level, required this.ref});
  final int level;
  final WidgetRef ref;
  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    add(SplashScreen(level, ref));
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
