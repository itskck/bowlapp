import 'package:bowlapp/cubit/game_cubit.dart';
import 'package:bowlapp/models/round.dart';
import 'package:win_toast/win_toast.dart';

bool addPlayerPoints(GameCubit cubit, String firstShot, String secondShot,
    String thirdShot, bool isThisLast) {
  final Operations o = Operations();

  if (!o.isNumeric(firstShot) ||
      !o.isNumeric(secondShot) ||
      !o.isNumeric(thirdShot)) {
    WinToast.instance()
        .showToast(type: ToastType.text01, title: "Invalid data");
    return false;
  }

  if (!o.isBetween0And10(int.parse(firstShot)) ||
      !o.isBetween0And10(int.parse(secondShot)) ||
      !o.isBetween0And10(int.parse(thirdShot))) {
    WinToast.instance()
        .showToast(type: ToastType.text01, title: "Invalid data");
    return false;
  }

  if (!isThisLast &&
      o.isSumGreaterThan10(
        int.parse(firstShot),
        int.parse(secondShot),
        int.parse(thirdShot),
      )) {
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

class Operations {
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  bool isBetween0And10(int number) {
    return number >= 0 && number <= 10;
  }

  bool isSumGreaterThan10(int firstShot, int secondShot, int thirdShot) {
    return firstShot + secondShot + thirdShot > 10;
  }
}
