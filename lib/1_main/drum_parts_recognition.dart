import 'dart:async';
import 'package:drum/1_main/drum_parts/drum_kit.dart';
import 'package:drum/1_main/drum_simulation.dart';
import 'package:drum/1_main/game_button.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

// const String appId = "c17e83b482844f599ba02172d21b9178";

class DrumPartsRecognition extends PositionComponent
    with HasGameReference<DrumSimulation> {
  bool _drumKitShown = false;
  bool _shown = false;

  late DrumKit mainDrum; //드럼키트 전체
  late GameButton gameButton; //게임 버튼

  late TextComponent mainText = TextComponent(
    anchor: Anchor.center,
    text: "Drum Simulation Game",
  )
    ..textRenderer = TextPaint(
      style: TextStyle(
        color: const Color.fromARGB(193, 243, 229, 33),
        fontSize: game.canvasSize.x / 20,
        fontFamily: "ABeeZee",
        decoration: TextDecoration.combine(
          [TextDecoration.overline],
        ),
      ),
    )
    ..add(
      ScaleEffect.to(
        Vector2.all(1.01),
        EffectController(
          duration: 0.2,
          alternate: true,
          infinite: true,
        ),
      ),
    );

  late TimerComponent whenToShowDrum = TimerComponent(
    period: 0.009,
    repeat: false,
    removeOnFinish: true,
    onTick: () {
      _drumKitShown = true;
    },
  );

  @override
  void onMount() {
    mainText.position = Vector2(game.canvasSize.x / 2, game.canvasSize.y / 7);
    mainDrum = DrumKit();
    gameButton = GameButton(eraseDrum: eraseDrum);
    super.onMount();
  }

  @override
  void update(double dt) {
    if (_drumKitShown && !_shown) {
      addAll(
        [
          mainDrum,
          // callButton,
          gameButton,
        ],
      );
      // initPlugin();
      _shown = true;
    }
    super.update(dt);
  }

  @override
  Future<void> onLoad() async {
    await addAll(
      {
        mainText,
        whenToShowDrum,
      },
    );

    return super.onLoad();
  }

  void eraseDrum() {}

  @override
  void render(Canvas canvas) {
    canvas.drawColor(const Color.fromARGB(255, 25, 3, 63), BlendMode.srcIn);
    super.render(canvas);
  }
}
