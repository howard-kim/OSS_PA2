import 'package:drum/1_main/drum_simulation.dart';
import 'package:drum/2_beat_game/screens/beat_game_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameLevelWidget extends StatelessWidget {
  const GameLevelWidget(this.game, {super.key});

  final DrumSimulation game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => game.overlays.remove("game"),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            children: [
              Container(
                width: 300,
                height: 260,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(200, 60, 21, 84),
                    border: Border.all(
                      color: const Color.fromARGB(193, 243, 229, 33),
                      width: 3,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      "Select Level, Play Game!",
                      style: TextStyle(
                        wordSpacing: 3,
                        fontSize: 17,
                        fontFamily: "ABeeZee",
                        color: Color.fromARGB(193, 243, 229, 33),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        game.overlays.remove("game");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const BeatGameScreen(
                                  level: 1,
                                )));
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(193, 243, 229, 33),
                          width: 2,
                        ),
                        backgroundColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        "Level 1",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(193, 243, 229, 33),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        game.overlays.remove("game");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const BeatGameScreen(
                                  level: 2,
                                )));
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(193, 243, 229, 33),
                          width: 2,
                        ),
                        backgroundColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 15,
                        ),
                      ),
                      child: const Text("Level 2",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(193, 243, 229, 33),
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        game.overlays.remove("game");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const BeatGameScreen(
                                  level: 3,
                                )));
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(193, 243, 229, 33),
                          width: 2,
                        ),
                        backgroundColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 15,
                        ),
                      ),
                      child: const Text("Level 3",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(193, 243, 229, 33),
                          )),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    game.overlays.remove("game");
                  },
                  icon: const Icon(CupertinoIcons.xmark_square),
                  color: const Color.fromARGB(193, 243, 229, 33),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
