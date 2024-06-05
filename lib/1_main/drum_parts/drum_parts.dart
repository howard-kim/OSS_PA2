import 'dart:async';

import 'package:drum/1_main/drum_simulation.dart';
import 'package:flame/effects.dart';
// import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class DrumParts extends SpriteComponent
    with TapCallbacks, HasGameReference<DrumSimulation> {
  static late double partsSize;

  DrumParts({
    required this.text,
    required this.action,
    super.anchor = Anchor.center,

    // required Color borderColor,
    // required Color color,
    // required Sprite partSprite,
  });

  final String text;
  final void Function() action;
  // late AudioPool pool;

  @override
  Future<void> onLoad() async {
    partsSize = game.canvasSize.x / 7;
    size = Vector2.all(partsSize);

    await FlameAudio.audioCache.load('parts_sound/$text.wav');
  }

  @override
  void onGameResize(Vector2 size) {
    partsSize = game.canvasSize.x;
    super.onGameResize(size);
  }

  @override
  void onTapDown(TapDownEvent event) {
    scale = Vector2.all(1.1);
    add(
      ColorEffect(
        Colors.white,
        EffectController(duration: 0.01, infinite: false),
        opacityFrom: 0,
        opacityTo: 0.8,
      ),
    );
    FlameAudio.play('parts_sound/$text.wav');
  }

  @override
  void onTapUp(TapUpEvent event) {
    scale = Vector2.all(1.0);
    add(
      ColorEffect(
        Colors.white,
        EffectController(
          duration: 0.01,
          infinite: false,
        ),
        opacityFrom: 0.8,
        opacityTo: 0.0,
      ),
    );
    action();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale = Vector2.all(1.0);
    add(
      ColorEffect(
        Colors.white,
        EffectController(duration: 0.01, infinite: false),
        opacityTo: 0.0,
      ),
    );
  }
}
