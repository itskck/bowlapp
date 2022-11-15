import 'package:flutter/material.dart';

class PointFrame extends StatelessWidget {
  const PointFrame({super.key});

  static const double width = 30;

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
              child: Text('5'),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(10),
              child: Text('5'),
            )
          ],
        ),
        Container(
          width: 2 * width,
          decoration: BoxDecoration(border: Border.all()),
          padding: EdgeInsets.all(10),
          child: Text('5'),
        )
      ],
    );
  }
}
