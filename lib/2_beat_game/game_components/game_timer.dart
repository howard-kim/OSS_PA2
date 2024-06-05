import 'package:drum/2_beat_game/beat_game.dart';
import 'package:flame/components.dart';

class GameTimer extends TimerComponent with HasGameReference<BeatGame> {
  GameTimer({required super.period});
}
