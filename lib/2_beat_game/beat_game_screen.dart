import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/2_beat_game/game_components/small_components/pause_widget.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BeatGameScreen extends StatefulWidget {
  const BeatGameScreen({super.key, required this.level, required this.ref});

  final int level;
  final WidgetRef ref;

  @override
  State<BeatGameScreen> createState() => _BeatGameScreenState();
}

class _BeatGameScreenState extends State<BeatGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GameWidget<BeatGame>(
          game: BeatGame(level: widget.level, ref: widget.ref),
          overlayBuilderMap: {
            'pause': (context, game) => PauseWidget(
                  game,
                  ref: widget.ref,
                )
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
