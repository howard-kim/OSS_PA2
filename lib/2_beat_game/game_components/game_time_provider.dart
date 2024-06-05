import 'package:flutter_riverpod/flutter_riverpod.dart';

// timeOfGame 상태를 관리하는 프로바이더 정의
final recordTimeProvider = StateProvider<double>((ref) {
  return -3 - 1.26; // 초기 값 설정
});
