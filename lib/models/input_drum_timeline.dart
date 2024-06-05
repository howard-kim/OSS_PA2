import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drum/models/beat_timeline.dart';

// inputDrum 상태를 관리하는 프로바이더 정의
final inputDrumProvider =
    StateNotifierProvider<InputDrumNotifier, BeatTimeline>((ref) {
  return InputDrumNotifier();
});

class InputDrumNotifier extends StateNotifier<BeatTimeline> {
  InputDrumNotifier()
      : super(BeatTimeline(
          kick: [],
          snare: [],
          rim: [],
          tomHigh: [],
          tomMid: [],
          tomLow: [],
          hat: [],
          crash: [],
          ride: [],
        ));

  void addBeat(String type, double time) {
    state = state.copyWith(
      kick: type == 'kick' ? [...state.kick, time] : state.kick,
      snare: type == 'snare' ? [...state.snare, time] : state.snare,
      rim: type == 'rim' ? [...state.rim, time] : state.rim,
      tomHigh: type == 'tomHigh' ? [...state.tomHigh, time] : state.tomHigh,
      tomMid: type == 'tomMid' ? [...state.tomMid, time] : state.tomMid,
      tomLow: type == 'tomLow' ? [...state.tomLow, time] : state.tomLow,
      hat: type == 'hat' ? [...state.hat, time] : state.hat,
      crash: type == 'crash' ? [...state.crash, time] : state.crash,
      ride: type == 'ride' ? [...state.ride, time] : state.ride,
    );
    print('$type tapped at $time');
  }

  void reset() {
    state = BeatTimeline(
      kick: [],
      snare: [],
      rim: [],
      tomHigh: [],
      tomMid: [],
      tomLow: [],
      hat: [],
      crash: [],
      ride: [],
    );
    print('Input drum reset');
  }
}
