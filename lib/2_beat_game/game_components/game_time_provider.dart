import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// timeOfGame 상태를 관리하는 프로바이더 정의
final recordTimeProvider =
    StateNotifierProvider<RecordTimeNotifier, double>((ref) {
  return RecordTimeNotifier(); // 초기 값 설정
});

class RecordTimeNotifier extends StateNotifier<double> {
  RecordTimeNotifier() : super(-3 - 1.26);

  void reset() {
    state = -3 - 1.26;
  }
}
