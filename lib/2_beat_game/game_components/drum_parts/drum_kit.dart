import 'dart:async';

import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/2_beat_game/game_components/drum_parts/drum_parts.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrumKit extends PositionComponent with HasGameReference<BeatGame> {
  //hasGameReference가 있기 때문에 loadSprite 함수를 가져와서 사용할 수 있는 것임
  DrumKit({
    super.anchor = Anchor.center,
    required this.ref,
  });
  final WidgetRef ref;

  late final DrumParts snare;
  late final DrumParts kick;
  late final DrumParts rim;
  late final DrumParts tomHigh;
  late final DrumParts tomMid;
  late final DrumParts tomLow;
  late final DrumParts hat;
  late final DrumParts crash;
  late final DrumParts ride;
  // final List<double> partsAllign = [83.0, 80.0];
  late double aU; //alignUnit
  RectangleComponent background = RectangleComponent(
    paint: Paint()..color = const Color.fromARGB(180, 0, 0, 0),
    anchor: Anchor.bottomCenter,
  );
  @override
  Future<void> onLoad() async {
    background
      ..size = Vector2(game.canvasSize.x,
          game.canvasSize.x * 19 / 200 + game.canvasSize.x * 19 / 200 / 3)
      ..position =
          Vector2(game.canvasSize.x / 2, game.canvasSize.y - size.x / 2);
    add(background);

    addAll([
      snare = DrumParts(partsName: "snare", ref: ref),
      hat = DrumParts(partsName: "hat", ref: ref),
      rim = DrumParts(partsName: "rim", ref: ref),
      tomHigh = DrumParts(partsName: "tomHigh", ref: ref),
      tomMid = DrumParts(partsName: "tomMid", ref: ref),
      tomLow = DrumParts(partsName: "tomLow", ref: ref),
      crash = DrumParts(partsName: "crash", ref: ref),
      ride = DrumParts(partsName: "ride", ref: ref),
      kick = DrumParts(partsName: "kick", ref: ref)
    ]);

    // print("드럼키트 온로드!");
  }
}
