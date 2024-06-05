import 'package:drum/models/beat_timeline.dart';

class BeatGrading {
  @override
  BeatGrading();

  List<bool> kick = [];
  List<bool> snare = [];
  List<bool> rim = [];
  List<bool> tomHigh = [];
  List<bool> tomMid = [];
  List<bool> tomLow = [];
  List<bool> hat = [];
  List<bool> crash = [];
  List<bool> ride = [];

  void setFalse(BeatTimeline beats) {
    print("called?");
    if (beats.crash.isNotEmpty) {
      for (int i = 0; i < beats.crash.length; i++) {
        crash.add(false);
      }
    }
    if (beats.hat.isNotEmpty) {
      for (int i = 0; i < beats.hat.length; i++) {
        hat.add(false);
      }
    }
    if (beats.ride.isNotEmpty) {
      for (int i = 0; i < beats.ride.length; i++) {
        ride.add(false);
      }
    }
    if (beats.rim.isNotEmpty) {
      for (int i = 0; i < beats.rim.length; i++) {
        rim.add(false);
      }
    }
    if (beats.snare.isNotEmpty) {
      for (int i = 0; i < beats.snare.length; i++) {
        snare.add(false);
      }
    }
    if (beats.kick.isNotEmpty) {
      for (int i = 0; i < beats.kick.length; i++) {
        kick.add(false);
      }
    }
    if (beats.tomHigh.isNotEmpty) {
      for (int i = 0; i < beats.tomHigh.length; i++) {
        tomHigh.add(false);
      }
    }
    if (beats.tomMid.isNotEmpty) {
      for (int i = 0; i < beats.tomMid.length; i++) {
        tomMid.add(false);
      }
    }
    if (beats.tomLow.isNotEmpty) {
      for (int i = 0; i < beats.tomLow.length; i++) {
        tomLow.add(false);
      }
    }
  }
}

int whereMinDifference(double inputTIme, List<double> partsTimeline) {
  double minDifference = double.infinity;
  int where = -1;
  int index = 0;
  for (double partsTime in partsTimeline) {
    double difference = (partsTime - inputTIme).abs();
    if (difference < 0.4) {
      if (difference < minDifference) {
        minDifference = difference;
        where = index;
      }
    }
    index++;
  }

  return where;
}

int score(BeatGrading forGrading) {
  print("score called?");
  int score = 0;
  double trues = 0;
  int total = forGrading.hat.length +
      forGrading.crash.length +
      forGrading.snare.length +
      forGrading.rim.length +
      forGrading.kick.length +
      forGrading.ride.length +
      forGrading.tomHigh.length +
      forGrading.tomLow.length +
      forGrading.tomMid.length -
      9;
  for (bool isItTrue in forGrading.hat) {
    if (isItTrue == true) {
      trues++;
    }
  }
  for (bool isItTrue in forGrading.crash) {
    if (isItTrue == true) {
      trues++;
    }
  }
  for (bool isItTrue in forGrading.kick) {
    if (isItTrue == true) {
      trues++;
    }
  }
  for (bool isItTrue in forGrading.ride) {
    if (isItTrue == true) {
      trues++;
    }
  }
  for (bool isItTrue in forGrading.rim) {
    if (isItTrue == true) {
      trues++;
    }
  }
  for (bool isItTrue in forGrading.snare) {
    if (isItTrue == true) {
      trues++;
    }
  }
  for (bool isItTrue in forGrading.tomHigh) {
    if (isItTrue == true) {
      trues++;
    }
  }
  for (bool isItTrue in forGrading.tomMid) {
    if (isItTrue == true) {
      trues++;
    }
  }
  for (bool isItTrue in forGrading.tomLow) {
    if (isItTrue == true) {
      trues++;
    }
  }

  if (trues == 0) {
    return 0;
  }
  print("real Trues : $trues");
  trues *= 1.4;
  if (trues >= total) {
    return 100;
  }
  score = (trues / total * 100).truncate();
  print("trues : $trues\ntotal : $total\nscore : $score");
  return score;
}
