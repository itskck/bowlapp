import 'package:bowlapp/cubit/game_cubit.dart';
import 'package:bowlapp/models/round.dart';
import 'package:bowlapp/widgets/point_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard(
      {super.key, required this.player1List, required this.player2List});

  final List<Round> player1List;
  final List<Round> player2List;

  @override
  Widget build(BuildContext context) {
    var sum1 = 0;
    player1List.forEach((element) => sum1 += element.sum);

    var sum2 = 0;
    player2List.forEach((element) => sum2 += element.sum);
    return Column(
      children: [
        const Text('Player 1'),
        SizedBox(
          height: 100,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return PointFrame(round: player1List[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 2,
            ),
          ),
        ),
        Text('Sum: $sum1'),
        const SizedBox(
          height: 50,
        ),
        const Text('Player 2'),
        SizedBox(
          height: 100,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return PointFrame(round: player2List[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 2,
            ),
          ),
        ),
        Text('Sum: $sum2'),
      ],
    );
  }
}
