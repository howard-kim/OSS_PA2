import 'dart:async';

import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/2_beat_game/game_components/drum_parts/drum_parts.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class DrumKit extends PositionComponent with HasGameReference<BeatGame> {
  //hasGameReference가 있기 때문에 loadSprite 함수를 가져와서 사용할 수 있는 것임
  DrumKit({
    super.anchor = Anchor.center,
  });

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
      snare = DrumParts(partsName: "snare"),
      hat = DrumParts(partsName: "hat"),
      rim = DrumParts(partsName: "rim"),
      tomHigh = DrumParts(partsName: "tomHigh"),
      tomMid = DrumParts(partsName: "tomMid"),
      tomLow = DrumParts(partsName: "tomLow"),
      crash = DrumParts(partsName: "crash"),
      ride = DrumParts(partsName: "ride"),
      kick = DrumParts(partsName: "kick")
    ]);

    // print("드럼키트 온로드!");
  }
}
