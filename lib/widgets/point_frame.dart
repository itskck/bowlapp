import 'package:bowlapp/models/round.dart';
import 'package:flutter/material.dart';

class PointFrame extends StatelessWidget {
  const PointFrame({super.key, required this.round});

  static const double width = 40;
  final Round round;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(10),
              child: Text(round.firstShot.toString()),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(10),
              child: Text(round.secondShot.toString()),
            )
          ],
        ),
        Container(
          width: 2 * width,
          decoration: BoxDecoration(border: Border.all()),
          padding: EdgeInsets.all(10),
          child: Text(round.sum.toString()),
        )
      ],
    );
  }
}
