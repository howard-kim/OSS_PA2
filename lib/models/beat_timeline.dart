class BeatTimeline {
  BeatTimeline({
    required this.kick,
    required this.snare,
    required this.rim,
    required this.tomHigh,
    required this.tomMid,
    required this.tomLow,
    required this.hat,
    required this.crash,
    required this.ride,
  });
  Iterator<List<double>> get iterator => [
        kick,
        snare,
        rim,
        tomHigh,
        tomMid,
        tomLow,
        hat,
        crash,
        ride,
      ].iterator;

  List<double> operator [](String key) {
    if (key == kick.toString()) {
      return kick;
    }
    if (key == snare.toString()) {
      return snare;
    }
    if (key == rim.toString()) {
      return rim;
    }
    if (key == tomHigh.toString()) {
      return tomHigh;
    }
    if (key == tomMid.toString()) {
      return tomMid;
    }
    if (key == tomLow.toString()) {
      return tomLow;
    }
    if (key == hat.toString()) {
      return hat;
    }
    if (key == crash.toString()) {
      return crash;
    }
    if (key == ride.toString()) {
      return ride;
    }
    return [];
  }

  final List<double> kick;
  final List<double> snare;
  final List<double> rim;
  final List<double> tomHigh;
  final List<double> tomMid;
  final List<double> tomLow;
  final List<double> hat;
  final List<double> crash;
  final List<double> ride;

  BeatTimeline levelControll(int level) {
    BeatTimeline result = BeatTimeline(
        kick: kick,
        snare: snare,
        rim: rim,
        tomHigh: tomHigh,
        tomMid: tomMid,
        tomLow: tomLow,
        hat: hat,
        crash: crash,
        ride: ride);

    // for (String key in originBeat.iterator) result = this;
    for (double t in result.crash) {
      t = t / level;
    }
    for (double t in result.snare) {
      t = t / level;
    }
    for (double t in result.kick) {
      t = t / level;
    }
    for (double t in tomHigh) {
      t = t / level;
    }
    for (double t in tomLow) {
      t = t / level;
    }
    for (double t in tomMid) {
      t = t / level;
    }
    for (double t in result.hat) {
      t = t / level;
    }
    for (double t in ride) {
      t = t / level;
    }
    for (double t in rim) {
      t = t / level;
    }
    // result = this;
    return result;
  }
}
