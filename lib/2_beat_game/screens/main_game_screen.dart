import 'dart:math';

import 'package:drum/2_beat_game/game_components/drum_parts/drum_kit.dart';
import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/2_beat_game/game_components/beat.dart';
import 'package:drum/2_beat_game/game_components/game_background.dart';
import 'package:drum/2_beat_game/game_components/game_time_provider.dart';
import 'package:drum/2_beat_game/game_components/pause_button.dart';
import 'package:drum/models/beat_timeline.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainGameScreen extends Component
    with HasGameReference<BeatGame>, HasCollisionDetection {
  MainGameScreen(this.level, this.ref);
  final int level;
  final WidgetRef ref;
  late BeatTimeline gameSong;
  late double aU;
  late TextComponent levelText = TextComponent(
      text: level.toString(),
      size: Vector2.all(100),
      position: Vector2.all(100));
  double timeOfGame = -3; //게임 전체 기준 시간
  double recogTime = -3 - 1.26; //1.21
  bool isGameScoreCalled = false;

  late DrumKit mainDrum; //메인드럼키트 초기화

  late TimerComponent realTimer = TimerComponent(
    period: 0.01, //1 / 60,
    repeat: true,
    onTick: () {
      // print(level);
      timeOfGame = double.parse(timeOfGame.toStringAsFixed(2));
      print('${ref.read(recordTimeProvider).truncate()} sec');
      // print('${timeOfGame} sec');
      switch (timeOfGame) {
        case -3:
          add(
            CircleComponent(
              paint: Paint()..color = const Color.fromARGB(180, 0, 0, 0),
              radius: 30,
              anchor: Anchor.center,
              position:
                  Vector2(game.canvasSize.x / 2, game.canvasSize.y / 2 - 50),
              children: [
                TextComponent(
                  anchor: Anchor.center,
                  position: Vector2(30, 30),
                  text: '3',
                  textRenderer: TextPaint(
                    style: const TextStyle(
                      fontFamily: "Loster",
                      fontSize: 50,
                      color: Color.fromARGB(230, 243, 229, 33),
                    ),
                  ),
                ),
                RemoveEffect(
                  delay: 0.5,
                ),
              ],
            ),
          );
        case -2:
          add(
            CircleComponent(
              paint: Paint()..color = const Color.fromARGB(180, 0, 0, 0),
              radius: 30,
              anchor: Anchor.center,
              position:
                  Vector2(game.canvasSize.x / 2, game.canvasSize.y / 2 - 50),
              children: [
                TextComponent(
                  anchor: Anchor.center,
                  position: Vector2(30, 30),
                  text: '2',
                  textRenderer: TextPaint(
                    style: const TextStyle(
                      fontFamily: "Loster",
                      fontSize: 50,
                      color: Color.fromARGB(230, 243, 229, 33),
                    ),
                  ),
                ),
                RemoveEffect(
                  delay: 0.5,
                ),
              ],
            ),
          );
        case -1:
          add(
            CircleComponent(
              paint: Paint()..color = const Color.fromARGB(180, 0, 0, 0),
              radius: 30,
              anchor: Anchor.center,
              position:
                  Vector2(game.canvasSize.x / 2, game.canvasSize.y / 2 - 50),
              children: [
                TextComponent(
                  anchor: Anchor.center,
                  position: Vector2(30, 30),
                  text: '1',
                  textRenderer: TextPaint(
                    style: const TextStyle(
                      fontFamily: "Loster",
                      fontSize: 50,
                      color: Color.fromARGB(230, 243, 229, 33),
                    ),
                  ),
                ),
                RemoveEffect(
                  delay: 0.5,
                ),
              ],
            ),
          );

        default:
          break;
      }

      if (gameSong.hat.contains(timeOfGame)) {
        add(Beat(Vector2(aU * 1, 0), level));
      }
      if (gameSong.crash.contains(timeOfGame)) {
        add(Beat(Vector2(aU * 2, 0), level));
      }
      if (gameSong.snare.contains(timeOfGame)) {
        add(Beat(Vector2(aU * 3, 0), level));
      }
      if (gameSong.rim.contains(timeOfGame)) {
        add(Beat(Vector2(aU * 4, 0), level));
      }
      if (gameSong.tomHigh.contains(timeOfGame)) {
        add(Beat(Vector2(aU * 5, 0), level));
      }
      if (gameSong.kick.contains(timeOfGame)) {
        add(Beat(Vector2(aU * 6, 0), level));
      }
      if (gameSong.tomMid.contains(timeOfGame)) {
        add(Beat(Vector2(aU * 7, 0), level));
      }
      if (gameSong.tomLow.contains(timeOfGame)) {
        add(Beat(Vector2(aU * 8, 0), level));
      }
      if (gameSong.ride.contains(timeOfGame)) {
        add(Beat(Vector2(aU * 9, 0), level));
      }
      // addBeats(examBeats120bpm, timeOfGame);
      double gameOver = whenToFinishGame(examBeats120bpm);
      if (timeOfGame == gameOver) {
        // testScore = score(boolsForGrade);
      }
      // print(isGameScoreCalled);
      if (isGameScoreCalled == false) {
        //   if (timeOfGame > gameOver + 3) {
        print(testScore);
        isGameScoreCalled = true;
        // print(inputDrum.kick);
        // removeFromParent();
      }
      timeOfGame += 0.01; //1 / 60;
      // ref.read(timeOfGameProvider.notifier).state += 0.01;
      ref.read(recordTimeProvider.notifier).state += 0.01;

      // }
    },
  );

  BeatTimeline examBeats120bpm = BeatTimeline(
    kick: [0, 0.35, 1, 1.35, 2, 2.35],
    hat: [0.5, 1.5, 2.5],
    snare: [0.75, 1.75, 2.75],
    rim: [10],
    tomHigh: [10],
    tomMid: [10],
    tomLow: [10],
    crash: [10], ride: [10],
    // kick: [0, 1.0, 3.75, 4.0, 4.75, 5.5, 6.0, 6.75],
    // snare: [0.5, 1.5, 2.12, 2.37, 2.62, 2.87, 3.12, 3.37],
    // rim: [5.0, 7.0],
    // tomHigh: [2.0, 2.25],
    // tomMid: [2.5, 2.75],
    // tomLow: [3.0, 3.25],
    // hat: [0.0, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75],
    // crash: [3.5],
    // ride: [4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5],
  );

  /////////점수 용 드럼 연주 기록

  // BeatTimeline inputDrum = BeatTimeline(
  //   kick: [],
  //   snare: [],
  //   rim: [],
  //   tomHigh: [],
  //   tomMid: [],
  //   tomLow: [],
  //   hat: [],
  //   crash: [],
  //   ride: [],
  // );

  int testScore = -1;

  TextComponent hitEffect = TextComponent(
    text: "HIT",
    textRenderer: TextPaint(
      style: const TextStyle(
          fontFamily: "Lobster",
          color: Color.fromARGB(255, 30, 149, 0),
          fontSize: 50),
    ),
    position: Vector2(
        Random().nextDouble() * 600 + 50, Random().nextDouble() * 300 + 50),
  )..add(
      RemoveEffect(delay: 0.1),
    );

  @override
  Future<void> onLoad() async {
    mainDrum = DrumKit(ref: ref);
    aU = game.canvasSize.x / 10;
    // gameSong = examBeats120bpm.levelControll(level);
    gameSong = examBeats120bpm;
    for (int i = 0; i < gameSong.snare.length; i++) {
      // print("1==========================${gameSong.snare[i]}");
      gameSong.snare[i] =
          double.parse((gameSong.snare[i] / level).toStringAsFixed(2));

      // print("2==========================${gameSong.snare[i]}");
    }
    for (int i = 0; i < gameSong.kick.length; i++) {
      // print("==========================${gameSong.kick[i]}");
      gameSong.kick[i] =
          double.parse((gameSong.kick[i] / level).toStringAsFixed(2));

      // print("==========================${gameSong.kick[i]}");
    }
    for (int i = 0; i < gameSong.hat.length; i++) {
      // print("==========================${gameSong.hat[i]}");
      gameSong.hat[i] =
          double.parse((gameSong.hat[i] / level).toStringAsFixed(2));

      // print("==========================${gameSong.hat[i]}");
    }
    addAll(
      {
        GameBackGround(),
        PauseButton(),
        mainDrum,
        realTimer,
      },
    );
    // add(levelText);
    // boolsForGrade.setFalse(gameSong);

    print("main loaded");
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {}

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onRemove() {
    print("=========main removed=========");

    super.onRemove();
  }
}

double whenToFinishGame(BeatTimeline beats) {
  double when = 0.0;

  when = max(when, beats.crash[beats.crash.length - 2]);
  when = max(when, beats.hat[beats.hat.length - 2]);
  when = max(when, beats.kick[beats.kick.length - 2]);
  when = max(when, beats.ride[beats.ride.length - 2]);
  when = max(when, beats.rim[beats.rim.length - 2]);
  when = max(when, beats.snare[beats.snare.length - 2]);
  when = max(when, beats.tomLow[beats.tomLow.length - 2]);
  when = max(when, beats.tomMid[beats.tomMid.length - 2]);
  when = max(when, beats.tomHigh[beats.tomHigh.length - 2]);

  return when + 1.0;
}
