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

    rounds[current] = round1;
    current = current + 1;

    final newRounds = checkAdditionalPoints(rounds);

    emit(GameInProgress(currentRound: current, rounds: newRounds));
  }

  List<Round> checkAdditionalPoints(List<Round> rounds) {
    var newRounds = rounds;
    for (var i = 0; i < rounds.length - 1; i++) {
      if (i < 8) {
        if (rounds[i].isStrike) {
          if (rounds[i + 1].isStrike) {
            newRounds[i].additionalPoints =
                rounds[i + 1].firstShot + rounds[i + 2].firstShot;
          } else {
            newRounds[i].additionalPoints =
                rounds[i + 1].firstShot + rounds[i + 1].secondShot!;
          }
        }
        if (rounds[i].isSpare) {
          newRounds[i].additionalPoints = rounds[i + 1].firstShot;
        }
      }
      if (i == 8) {
        if (rounds[i].isStrike) {
          newRounds[i].additionalPoints =
              rounds[i + 1].firstShot + rounds[i + 1].secondShot!;
        }
        if (rounds[i].isSpare) {
          newRounds[i].additionalPoints = rounds[i + 1].firstShot;
        }
      }
    }

    return newRounds;
  }
}
