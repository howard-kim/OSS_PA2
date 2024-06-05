import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/models/beat_timeline.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'package:flutter/material.dart';

class MainGameScreen extends Component
    with HasGameReference<BeatGame>, HasCollisionDetection {
  MainGameScreen(this.level);
  final int level;
  late BeatTimeline gameSong;
  late double aU;
  late TextComponent levelText = TextComponent(
      text: level.toString(),
      size: Vector2.all(100),
      position: Vector2.all(100));
  double timeOfGame = -3; //게임 전체 기준 시간
  double recogTime = -3 - 1.26; //1.21
  bool isGameScoreCalled = false;
}
