import 'package:drum/1_main/drum_simulation.dart';
import 'package:drum/widgets/game_level_widget.dart';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    ); // hide top Status bar
    return Scaffold(
      body: Center(
        child: GameWidget<DrumSimulation>(
          game: DrumSimulation(),
          overlayBuilderMap: {
            'game': (context, game) => GameLevelWidget(
                  game,
                  ref: ref,
                ),
          },
        ),
      ),
    );
  }
}
