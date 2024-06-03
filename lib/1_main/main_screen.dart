import 'package:drum/1_main/drum_simulation.dart';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    ); // hide top Status bar
    return Scaffold(
      body: Center(
        child: GameWidget<DrumSimulation>(
          game: DrumSimulation(),
          overlayBuilderMap: {
            // 'putChannel': (context, game) => WhereToCallWidget(game),
            // 'game': (context, game) => GameLevelWidget(game),
          },
        ),
      ),
      // drawer: const LeftDrawer(),
      // endDrawer: const LeftDrawer(),
    );
  }
}
