import 'dart:async';

import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/2_beat_game/game_components/game_time_provider.dart';

import 'package:drum/models/input_drum_timeline.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrumParts extends SpriteComponent
    with TapCallbacks, CollisionCallbacks, HasGameReference<BeatGame> {
  List<String> parts = [
    "hat",
    "crash",
    "snare",
    "rim",
    "tomHigh",
    "kick",
    "tomMid",
    "tomLow",
    "ride"
  ];
  DrumParts({
    required this.ref,
    required this.partsName,
    super.anchor = Anchor.bottomCenter,
  });

  final String partsName;
  late double aU;
  late double partsSize;

  final WidgetRef ref;

  @override
  Future<void> onLoad() async {
    partsSize = game.canvasSize.x * 19 / 200;
    aU = game.canvasSize.x / 10;
    size = Vector2.all(partsSize);
    add(RectangleHitbox(
        size: Vector2.all(partsSize), position: Vector2(x, y - partsSize / 4)));
    for (int i = 0; i < parts.length; i++) {
      if (partsName == parts[i]) {
        position = Vector2(aU * (i + 1), game.canvasSize.y);
      }
    }

    sprite = await game.loadSprite("drum_parts/${partsName.toLowerCase()}.png");
    await FlameAudio.audioCache
        .load('parts_sound/${partsName.toLowerCase()}.wav');
  }

  @override
  void render(Canvas canvas) {
    canvas.drawPath(
        Path()
          ..moveTo(partsSize / 20, -partsSize / 5)
          ..lineTo(partsSize - partsSize / 20, -partsSize / 5),
        Paint()
          ..color = const Color.fromARGB(200, 243, 229, 33)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4);
    super.render(canvas);
  }

  @override
  void onTapDown(TapDownEvent event) {
    scale = Vector2.all(1.05);
    add(
      ColorEffect(
        Colors.white,
        opacityTo: 1.0,
        opacityFrom: 0.0,
        EffectController(duration: 0.01, infinite: false),
      ),
    );
    FlameAudio.play('parts_sound/${partsName.toLowerCase()}.wav');
    ref
        .read(inputDrumProvider.notifier)
        .addBeat(partsName, ref.read(recordTimeProvider.notifier).state);

    // print("=======" + text);
  }

  @override
  void onTapUp(TapUpEvent event) {
    scale = Vector2.all(1.0);
    add(
      ColorEffect(
        Colors.white,
        opacityTo: 0.0,
        opacityFrom: 0.8,
        EffectController(duration: 0.01, infinite: false),
      ),
    );
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale = Vector2.all(1.0);
    add(
      ColorEffect(
        Colors.white,
        opacityTo: 0.0,
        opacityFrom: 0.8,
        EffectController(duration: 0.01, infinite: false),
      ),
    );
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    FlameAudio.play('parts_sound/$partsName.wav');

    add(
      ColorEffect(
        Colors.white,
        opacityTo: 0.8,
        opacityFrom: 0.0,
        EffectController(
          duration: 0.1,
          reverseDuration: 0.1,
          infinite: false,
        ),
      ),
    );
  }
}
