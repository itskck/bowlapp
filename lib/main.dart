import 'package:bowlapp/widgets/point_frame.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return PointFrame();
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
