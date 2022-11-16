import 'package:bowlapp/funtions.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('true if string is a integer', () {
    final Operations operations = Operations();

    final params = {
      '24': true,
      '2': true,
      '1.5': false,
      'e': false,
      'notANumber': false
    };

    params.forEach((element, expected) {
      test('$element => $expected', () {
        expect(operations.isNumeric(element), expected);
      });
    });
  });

  group('true if sum of ints is greater than 10', () {
    final Operations operations = Operations();

    final params = {
      '10/10/10': true,
      '3/3/3': false,
      '1/-5/3': false,
      '0/0/0': false,
      '10/0/0': false
    };

    params.forEach((key, value) {
      test('$key => $value', () {
        final numsAsStrings = key.split('/');
        List<int> nums = [];
        numsAsStrings.forEach((element) {
          nums.add(int.parse(element));
        });

        expect(operations.isSumGreaterThan10(nums[0], nums[1], nums[2]), value);
      });
    });
  });

  group('true if int is between 0 and 10', () {
    final Operations operations = Operations();

    final params = {
      24: false,
      2: true,
      0: true,
      10: true,
      9: true,
    };

    params.forEach((element, expected) {
      test('$element => $expected', () {
        expect(operations.isBetween0And10(element), expected);
      });
    });
  });
}
