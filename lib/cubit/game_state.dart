part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInProgress extends GameState {
  const GameInProgress({
    required this.currentRound,
    required this.rounds,
  });
  final int currentRound;
  final List<Round> rounds;

  @override
  List<Object> get props => [currentRound, rounds];
}
