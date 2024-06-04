import 'dart:async';

import 'package:drum/1_main/drum_parts/drum_parts.dart';
import 'package:drum/1_main/drum_simulation.dart';

import 'package:flame/components.dart';

class DrumKit extends PositionComponent with HasGameReference<DrumSimulation> {
  //hasGameReference가 있기 때문에 loadSprite 함수를 가져와서 사용할 수 있는 것임
  // DrumKit({
  //   super.anchor = Anchor.bottomLeft,
  // });

  late final DrumParts snare;
  late final DrumParts kick;
  late final DrumParts rim;
  late final DrumParts tomHigh;
  late final DrumParts tomMid;
  late final DrumParts tomLow;
  late final DrumParts hat;
  late final DrumParts crash;
  late final DrumParts ride;
  late double alignUnit;
  @override
  Future<void> onLoad() async {
    // print("is it called");
    position = Vector2(game.canvasSize.x / 2 + 54, game.canvasSize.y / 2);
    alignUnit = game.canvasSize.x / 25;
    await addAll(
      {
        kick = DrumParts(
          text: 'kick',
          action: () {},
        )
          ..sprite = await game.loadSprite('drum_parts/kick.png')
          ..position = Vector2(0, alignUnit * 3.4),
        snare = DrumParts(
          text: 'snare',
          action: () {},
        )
          ..sprite = await game.loadSprite('drum_parts/snare.png')
          ..position = Vector2(alignUnit * -5, alignUnit * 2),
        rim = DrumParts(
          text: 'rim',
          action: () {},
        )
          ..sprite = await game.loadSprite('drum_parts/rim.png')
          ..position = Vector2(alignUnit * -5, alignUnit * 4.5),
        tomHigh = DrumParts(
          text: 'tomhigh',
          action: () {},
        )
          ..sprite = await game.loadSprite('drum_parts/tomhigh.png')
          ..position = Vector2(alignUnit * -2, alignUnit * -1),
        tomMid = DrumParts(
          text: 'tommid',
          action: () {},
        )
          ..sprite = await game.loadSprite('drum_parts/tommid.png')
          ..position = Vector2(alignUnit * 3, alignUnit * -1),
        tomLow = DrumParts(
          text: 'tomlow',
          action: () {},
        )
          ..sprite = await game.loadSprite('drum_parts/tomlow.png')
          ..position = Vector2(alignUnit * 5, alignUnit * 4.2),
        hat = DrumParts(
          text: 'hat',
          action: () {},
        )
          ..sprite = await game.loadSprite('drum_parts/hat.png')
          ..position = Vector2(alignUnit * -9, alignUnit * 1),
        crash = DrumParts(
          text: 'crash',
          action: () {},
        )
          ..sprite = await game.loadSprite('drum_parts/crash.png')
          ..position = Vector2(alignUnit * -6.5, alignUnit * -1),
        ride = DrumParts(
          text: 'ride',
          action: () {},
        )
          ..sprite = await game.loadSprite('drum_parts/ride.png')
          ..position = Vector2(alignUnit * 7, alignUnit * -0.2),
      },
    );
    // print("드럼키트 온로드!");
  }

  @override
  void onGameResize(Vector2 size) {
    double forDetails = DrumParts.partsSize;
    kick.size = Vector2(forDetails / 4.4, forDetails / 4.4);
    tomLow.size = Vector2(forDetails / 6, forDetails / 6);
    hat.size = Vector2(forDetails / 7, forDetails / 6.5);
    crash.size = Vector2(forDetails / 6, forDetails / 7.4);
    super.onGameResize(size);
  }
}
