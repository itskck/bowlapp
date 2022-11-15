import 'dart:core';

class Round {
  Round({
    required this.firstShot,
    this.secondShot,
    required this.isSpare,
    required this.isStrike,
  });

  int firstShot;
  int? secondShot;
  bool isStrike;
  bool isSpare;
}
