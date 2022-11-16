import 'package:bowlapp/cubit/game_cubit.dart';
import 'package:bowlapp/funtions.dart';
import 'package:bowlapp/models/round.dart';
import 'package:bowlapp/widgets/scoreboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController playerOne1 = TextEditingController(text: '0');

  final TextEditingController playerOne2 = TextEditingController(text: '0');

  final TextEditingController playerOne3 = TextEditingController(text: '0');

  final TextEditingController playerTwo1 = TextEditingController(text: '0');

  final TextEditingController playerTwo2 = TextEditingController(text: '0');

  final TextEditingController playerTwo3 = TextEditingController(text: '0');

  late final GameCubit cubit1;
  late final GameCubit cubit2;

  @override
  void initState() {
    super.initState();
    cubit1 = GameCubit();
    cubit2 = GameCubit();
  }

  @override
  Widget build(BuildContext context) {
    final state1 = (cubit1.state as GameInProgress);
    final state2 = (cubit2.state as GameInProgress);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Scoreboard(
          player1List: (cubit1.state as GameInProgress).rounds,
          player2List: (cubit2.state as GameInProgress).rounds,
        ),
        Column(
          children: [
            if (state1.currentRound < 10)
              SizedBox(
                height: 50,
                width: 400,
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: playerOne1,
                        maxLength: 2,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        controller: playerOne2,
                        maxLength: 2,
                      ),
                    ),
                    if (state1.currentRound == 9)
                      Flexible(
                        child: TextField(
                          controller: playerOne3,
                          maxLength: 2,
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        addPlayerPoints(
                            cubit1,
                            playerOne1.text,
                            playerOne2.text,
                            playerOne3.text,
                            state1.currentRound == 9);
                      }),
                      child: const Text('Add player 1 points'),
                    )
                  ],
                ),
              ),
            const SizedBox(
              height: 200,
            ),
            if (state2.currentRound < 10)
              SizedBox(
                height: 50,
                width: 400,
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: playerTwo1,
                        maxLength: 2,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        controller: playerTwo2,
                        maxLength: 2,
                      ),
                    ),
                    if (state2.currentRound == 9)
                      Flexible(
                        child: TextField(
                          controller: playerTwo3,
                          maxLength: 2,
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        addPlayerPoints(
                          cubit2,
                          playerTwo1.text,
                          playerTwo2.text,
                          playerTwo3.text,
                          state2.currentRound == 9,
                        );
                      }),
                      child: const Text('Add player 2 points'),
                    )
                  ],
                ),
              )
          ],
        ),
      ],
    );
  }
}
