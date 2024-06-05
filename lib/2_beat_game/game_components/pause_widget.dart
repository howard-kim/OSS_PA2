import 'package:drum/2_beat_game/beat_game.dart';
import 'package:drum/2_beat_game/beat_game_screen.dart';
import 'package:drum/2_beat_game/game_components/game_time_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PauseWidget extends StatefulWidget {
  const PauseWidget(this.thisGame, {super.key, required this.ref});
  final BeatGame thisGame;
  final WidgetRef ref;
  @override
  State<PauseWidget> createState() => _PauseWidgetState();
}

class _PauseWidgetState extends State<PauseWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.thisGame.overlays.remove("pause");
        widget.thisGame.resumeEngine();
      },
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
                      "Pause",
                      style: TextStyle(
                        wordSpacing: 7,
                        fontSize: 18,
                        fontFamily: "ABeeZee",
                        letterSpacing: 3,
                        color: Color.fromARGB(193, 243, 229, 33),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.thisGame.overlays.remove("pause");
                        widget.thisGame.resumeEngine();
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: Color.fromARGB(193, 243, 229, 33),
                            width: 2,
                          ),
                          backgroundColor: Colors.transparent,
                          // padding: const EdgeInsets.symmetric(
                          //   horizontal: 80,
                          //   vertical: 15,
                          // ),
                          fixedSize: Size(230, 60)),
                      child: const Text("RESUME",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(193, 243, 229, 33),
                            letterSpacing: 3,
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.thisGame.overlays.remove("pause");
                        widget.ref.read(recordTimeProvider.notifier).reset();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => BeatGameScreen(
                              level: widget.thisGame.level,
                              ref: widget.ref,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(193, 243, 229, 33),
                          width: 2,
                        ),
                        backgroundColor: Colors.transparent,
                        fixedSize: Size(230, 60),
                      ),
                      child: const Text("RESTART",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(193, 243, 229, 33),
                            letterSpacing: 3,
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.thisGame.overlays.remove("pause");
                        Navigator.of(context).pop();
                        widget.ref.read(recordTimeProvider.notifier).reset();

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => BeatGameScreen(
                        //           level: 3,
                        //         )));
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: Color.fromARGB(193, 243, 229, 33),
                            width: 2,
                          ),
                          backgroundColor: Colors.transparent,
                          fixedSize: Size(230, 60)),
                      child: const Text("QUIT",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(193, 243, 229, 33),
                            letterSpacing: 3,
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
                    widget.thisGame.overlays.remove("pause");
                    widget.thisGame.resumeEngine();
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

  @override
  void dispose() {
    print("pause widget disposed!??????????!!!!!!!!!");
    super.dispose();
  }
}
