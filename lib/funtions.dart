import 'package:bowlapp/cubit/game_cubit.dart';
import 'package:bowlapp/models/round.dart';
import 'package:win_toast/win_toast.dart';

bool addPlayerPoints(GameCubit cubit, String firstShot, String secondShot) {
  if (!isNumeric(firstShot) || !isNumeric(secondShot)) {
    WinToast.instance()
        .showToast(type: ToastType.text01, title: "Invalid data");
    return false;
  }

  if (int.parse(firstShot) > 10 || int.parse(secondShot) > 10) {
    WinToast.instance()
        .showToast(type: ToastType.text01, title: "Invalid data");
    return false;
  }

  if (int.parse(firstShot) + int.parse(secondShot) > 10) {
    WinToast.instance()
        .showToast(type: ToastType.text01, title: "Invalid data");
    return false;
  }

  cubit.progressGame(
    Round(
      firstShot: int.parse(firstShot),
      secondShot: int.parse(secondShot),
    ),
  );
  return true;
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}
