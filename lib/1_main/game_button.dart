import 'dart:async';

import 'package:drum/1_main/drum_simulation.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'package:flame/events.dart';
import 'package:flame_lottie/flame_lottie.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class GameButton extends PositionComponent
    with TapCallbacks, HasGameReference<DrumSimulation> {
  late Function erase;
  @override
  GameButton({required Function() eraseDrum})
      : super(
          size: Vector2.all(100),
          anchor: Anchor.center,
        ) {
    erase = eraseDrum;
  }

  final double _radius = 45;
  final Paint _paint = Paint()..color = const Color.fromARGB(255, 60, 21, 84);

  @override
  Future<void> onLoad() async {
    final asset = Lottie.asset("assets/lotties/game_icon.json");

    final animation = await loadLottie(asset);

    final gameIcon = LottieComponent(animation,
        size: Vector2.all(140),
        repeating: true,
        anchor: Anchor.center,
        position: Vector2(45, 45));
    add(gameIcon);

    position = Vector2(game.canvasSize.x * 8 / 9, game.canvasSize.y * 5 / 6);
  }

  @override
  void onTapDown(TapDownEvent event) {
    addAll([
      ScaleEffect.to(
        Vector2.all(1.2),
        EffectController(duration: 0.1, reverseDuration: 0.1),
      ),
    ]);
    game.overlays.add("game");

    super.onTapDown(event);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // canvas.drawPaint(Paint()..color = const Color.fromARGB(255, 0, 0, 0));
    canvas.drawCircle(Offset(_radius, _radius), _radius, _paint);
  }
}
