import 'dart:async';

import 'package:drum/2_beat_game/beat_game.dart';
import 'package:flame/components.dart';
import 'package:flame_lottie/flame_lottie.dart';

class GameBackGround extends PositionComponent with HasGameReference<BeatGame> {
  late LottieComponent background;
  @override
  Future<void> onLoad() async {
    final asset = Lottie.asset("assets/lotties/background.json");
    final animation = await loadLottie(asset);
    background = LottieComponent(
      animation,
      size: Vector2(game.canvasSize.x, game.canvasSize.y),
      scale: Vector2(1, 1.2),
      repeating: true,
      anchor: Anchor.center,
      position: Vector2(game.canvasSize.x / 2, game.canvasSize.y / 2),
    );
    add(background);
    return super.onLoad();
  }
}
