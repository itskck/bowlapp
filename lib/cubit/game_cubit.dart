import 'package:bloc/bloc.dart';
import 'package:bowlapp/models/round.dart';
import 'package:equatable/equatable.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit()
      : super(GameInProgress(
          currentRound: 0,
          rounds: [for (int i = 0; i < 10; i++) Round.empty()],
        ));

  void progressGame(Round round1) {
    var rounds = (state as GameInProgress).rounds;

    var current = (state as GameInProgress).currentRound;

    switch (current) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
        break;
    }

    rounds[current] = round1;
    current = current + 1;

    emit(GameInProgress(
        currentRound: current, rounds: checkAdditionalPoints(rounds)));
  }

  List<Round> checkAdditionalPoints(List<Round> rounds) {
    var newRounds = rounds;
    for (var i = 0; i < rounds.length - 2; i++) {
      if (i < 8) {
        if (rounds[i].isStrike) {
          if (rounds[i + 1].isStrike) {
            newRounds[i].additionalPoints =
                rounds[i + 1].firstShot + rounds[i + 2].firstShot;
          } else {
            newRounds[i].additionalPoints =
                rounds[i + 1].firstShot + rounds[i + 2].secondShot!;
          }
        }
        if (rounds[i].isSpare) {
          newRounds[i].additionalPoints = rounds[i + 1].firstShot;
        }
      }
      if (i == 8) {
        if (rounds[i].isStrike) {
          if (rounds[i + 1].isStrike) {
            newRounds[i].additionalPoints = rounds[i + 1].firstShot;
          } else {
            newRounds[i].additionalPoints =
                rounds[i + 1].firstShot + rounds[i + 2].secondShot!;
          }
        }
        if (rounds[i].isSpare) {
          newRounds[i].additionalPoints = rounds[i + 1].firstShot;
        }
      }
    }

    return newRounds;
  }
}
