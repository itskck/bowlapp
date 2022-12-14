import 'dart:core';

class Round {
  Round({required this.firstShot, this.secondShot, this.thirdShot});

  Round.empty({this.firstShot = 0, this.secondShot = 0, this.thirdShot});

  int firstShot;
  int? secondShot;
  int? thirdShot;

  int? additionalPoints;

  bool get isStrike => firstShot == 10 && secondShot == 0;

  bool get isSpare => firstShot != 10 && (firstShot + secondShot! == 10);

  int get sum {
    int first = firstShot;
    int second = secondShot ?? 0;
    int additional = additionalPoints ?? 0;
    int third = thirdShot ?? 0;

    return first + second + additional + third;
  }

  @override
  String toString() {
    return '$firstShot $secondShot $additionalPoints $isStrike $isSpare';
  }
}
