import 'dart:async';

import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/2_beat_game/game_components/simple_button.dart';
import 'package:flame/components.dart';
import 'package:flutter/rendering.dart';

class PauseButton extends SimpleButton with HasGameReference<BeatGame> {
  PauseButton()
      : super(Path()
              ..moveTo(15, 8)
              ..lineTo(300 - 15, 8)

            // position: Vector2(, 0),
            );
  @override
  FutureOr<void> onLoad() {
    position = Vector2(game.canvasSize.x / 2, game.canvasSize.y / 10);
    return super.onLoad();
  }

  @override
  void action() {
    game.pauseEngine();
    game.overlays.add("pause");
  }

  // @override
  // void action() => game.router.pushNamed('pause');
}
