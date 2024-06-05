import 'dart:async';
import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/2_beat_game/beat_game_screen.dart';
import 'package:drum/2_beat_game/game_components/rounded_button.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame_lottie/flame_lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScore extends PositionComponent
    with TapCallbacks, HasGameReference<BeatGame> {
  GameScore({required this.ref, required this.score, required this.level})
      : super();
  int score, level;
  final WidgetRef ref;

  late LottieComponent background;
  TextComponent scoreText = TextComponent(
    anchor: Anchor.center,
    children: [
      ScaleEffect.to(Vector2.all(1.05),
          EffectController(duration: 0.2, infinite: true, reverseDuration: 0.2))
    ],
  );
  TextComponent textText = TextComponent(
    anchor: Anchor.center,
    children: [
      ScaleEffect.to(Vector2.all(1.01),
          EffectController(duration: 0.2, infinite: true, reverseDuration: 0.2))
    ],
  );

  @override
  void onRemove() {
    print("score removed");
    super.onRemove();
  }

  @override
  Future<void> onLoad() async {
    double unit = game.canvasSize.y;
    final asset = Lottie.asset("assets/lotties/score_backscreen.json");
    final animation = await loadLottie(asset);
    background = LottieComponent(animation,
        size: Vector2(game.canvasSize.x, game.canvasSize.y),
        scale: Vector2.all(1.5),
        repeating: true,
        anchor: Anchor.center,
        // position: Vector2(0, 0));
        position: Vector2(game.canvasSize.x / 2, game.canvasSize.y / 2));
    add(background);

    late String showText;
    final int textSel = score ~/ 20;
    print("=====================================================$score");

    switch (textSel) {
      case 0:
        showText = "Never played drum before huh?";
        break;
      case 1:
        showText = "Well...Keep it going !";
        break;
      case 2:
        showText = "Practice harder, almost there";
        break;
      case 3:
        showText = "Good enough to play infront of people !";
        break;
      case 4:
        showText = "YOU ARE ON FIRE!!";
        break;
      case 5:
        showText = "GOD OF DRUM";
        break;
      default:
        showText = "Default";
        break;
    }

    scoreText
      ..text = score.toString()
      ..position = Vector2(game.canvasSize.x / 2, game.canvasSize.y / 2)
      ..textRenderer = TextPaint(
        style: TextStyle(
          fontFamily: 'lobster',
          fontSize: unit / 5,
          color: const Color.fromARGB(255, 86, 255, 230),
        ),
      );
    textText
      ..text = showText
      ..position = Vector2(game.canvasSize.x / 2, game.canvasSize.y / 8)
      ..textRenderer = TextPaint(
        style: TextStyle(
          fontFamily: 'lobster',
          letterSpacing: 1.3,
          fontSize: unit / 13,
          color: const Color.fromARGB(255, 86, 255, 230),
        ),
      );

    add(scoreText);
    add(textText);
    addAll(
      [
        RoundedButton(
          text: 'REPLAY',
          action: () {
            Navigator.of(game.buildContext!).pop();
            Navigator.of(game.buildContext!).push(MaterialPageRoute(
                builder: (BuildContext context) => BeatGameScreen(
                      level: level,
                      ref: ref,
                    )));
          },
          color: const Color.fromARGB(70, 199, 36, 196),
          borderColor: const Color.fromARGB(255, 86, 255, 230),
        )..position =
            Vector2(game.canvasSize.x * 38 / 100, game.canvasSize.y * 9 / 10),
        RoundedButton(
          text: 'QUIT',
          action: () {
            Navigator.of(game.buildContext!).pop();
          },
          color: const Color.fromARGB(70, 199, 36, 196),
          borderColor: const Color.fromARGB(255, 86, 255, 230),
        )..position =
            Vector2(game.canvasSize.x * 62 / 100, game.canvasSize.y * 9 / 10),
      ],
    );

    print("Score Screen onload");
    return super.onLoad();
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   print("whywwwwwwwwwww");
  //   game.overlays.add('pause');
  //   super.onTapDown(event);
  // }
}
