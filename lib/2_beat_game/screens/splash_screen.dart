import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/2_beat_game/screens/main_game_screen.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame_lottie/flame_lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends PositionComponent
    with TapCallbacks, HasGameReference<BeatGame> {
  SplashScreen(this.level);
  final int level;
  TextComponent splashText = TextComponent(
    text: 'Ready? Touch the Screen to get Started',
    textRenderer: TextPaint(
      style: const TextStyle(
        fontFamily: "Lobster",
        color: Color.fromARGB(255, 243, 229, 33),
        fontSize: 35,
        letterSpacing: 3,
      ),
    ),
    anchor: Anchor.center,
    children: [
      ScaleEffect.to(
        Vector2.all(1.015),
        EffectController(
          duration: 0.22,
          alternate: true,
          infinite: true,
        ),
      ),
    ],
  );
  TextComponent levelText = TextComponent(
    // text: 'Level : $level',
    textRenderer: TextPaint(
      style: const TextStyle(
        fontFamily: "ABeeZee",
        color: Color.fromARGB(220, 243, 229, 33),
        fontSize: 50,
        // wordSpacing: 30,
        letterSpacing: 20,
      ),
    ),
    anchor: Anchor.center,
    children: [
      ScaleEffect.to(
        Vector2.all(1.01),
        EffectController(
          duration: 1,
          alternate: true,
          infinite: true,
        ),
      ),
    ],
  );
  late LottieComponent rhythm;
  @override
  Future<void> onLoad() async {
    final double x = game.canvasSize.x;
    final double y = game.canvasSize.y;
    final asset = Lottie.asset("assets/lotties/rhythm.json");
    final animation = await loadLottie(asset);
    rhythm = LottieComponent(
      animation,
      size: Vector2.all(x),
      scale: Vector2(1.8, 2),
      repeating: true,
      anchor: Anchor.center,
      position: Vector2(x / 2 - x / 42, y - y / 11),
    );
    addAll(
      [
        splashText..position = Vector2(x / 2, y / 2),
        levelText
          ..text = "Level  $level"
          ..position = Vector2(x / 2, y / 2 - y / 4),
        rhythm,
      ],
    );
  }

  @override
  void render(Canvas canvas) {
    canvas.drawColor(const Color.fromARGB(204, 32, 6, 68), BlendMode.srcATop);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    print('splash -- tap up');
    // game.router.pushNamed('main');
    game.remove(this);
    game.add(MainGameScreen(level));
    print("did splash call main");
    // removeFromParent();
  }

  @override
  void onRemove() {
    print("splash removed");
    super.onRemove();
  }
}
