import 'package:drum/2_beat_game/beat_game.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';

class BeatGameScreen extends StatefulWidget {
  const BeatGameScreen({super.key, required this.level});

  final int level;

  @override
  State<BeatGameScreen> createState() => _BeatGameScreenState();
}

class _BeatGameScreenState extends State<BeatGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GameWidget<BeatGame>(
          game: BeatGame(level: widget.level),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
