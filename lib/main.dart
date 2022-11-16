import 'package:bowlapp/cubit/game_cubit.dart';
import 'package:bowlapp/main_screen.dart';
import 'package:bowlapp/models/round.dart';
import 'package:bowlapp/widgets/point_frame.dart';
import 'package:bowlapp/widgets/scoreboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:win_toast/win_toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WinToast.instance().initialize(
      appName: 'Bowlapp', productName: 'Bowlapp', companyName: 'Bowlcompany');
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: MainScreen(),
          ),
        ),
      ),
    );
  }
}
