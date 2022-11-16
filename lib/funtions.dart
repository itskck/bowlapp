import 'package:bowlapp/cubit/game_cubit.dart';
import 'package:bowlapp/models/round.dart';
import 'package:win_toast/win_toast.dart';

bool addPlayerPoints(GameCubit cubit, String firstShot, String secondShot,
    String thirdShot, bool isThisLast) {
  if (!isNumeric(firstShot) ||
      !isNumeric(secondShot) ||
      !isNumeric(thirdShot)) {
    WinToast.instance()
        .showToast(type: ToastType.text01, title: "Invalid data");
    return false;
  }

  if (!isBetween0And10(firstShot) ||
      !isBetween0And10(secondShot) ||
      !isBetween0And10(thirdShot)) {
    WinToast.instance()
        .showToast(type: ToastType.text01, title: "Invalid data");
    return false;
  }

  if (!isThisLast && isSumGreaterThan10(firstShot, secondShot, thirdShot)) {
    WinToast.instance()
        .showToast(type: ToastType.text01, title: "Invalid data");
    return false;
  }

  cubit.progressGame(
    Round(
      firstShot: int.parse(firstShot),
      secondShot: int.parse(secondShot),
      thirdShot: int.parse(thirdShot),
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

bool isBetween0And10(String number) {
  return int.parse(number) >= 0 && int.parse(number) <= 10;
}

bool isSumGreaterThan10(String firstShot, String secondShot, String thirdShot) {
  return int.parse(firstShot) + int.parse(secondShot) + int.parse(thirdShot) >
      10;
}
