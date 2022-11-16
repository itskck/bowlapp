import 'dart:core';

class Round {
  Round({
    required this.firstShot,
    this.secondShot,
  });

  Round.empty({
    this.firstShot = 0,
    this.secondShot = 0,
  });

  int firstShot;
  int? secondShot;

  int? additionalPoints;

  bool get isStrike => firstShot == 10 && secondShot == 0;

  bool get isSpare => secondShot != null && (firstShot + secondShot! == 10);

  int get sum {
    int first = firstShot;
    int second = secondShot ?? 0;
    int additional = additionalPoints ?? 0;

    return first + second + additional;
  }
}
