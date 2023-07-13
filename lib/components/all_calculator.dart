import 'dart:math';

class BmiCalculator {
  double bmi({required double height, required int weight}) {
    final res = weight / pow(height / 100, 2);
    return res;
  }

  String bmiResult(res) {
    if (res <= 18.5) {
      return 'Сиз арыксыз';
    } else if (res >= 18.6 && res <= 25) {
      return 'Нормалдуу';
    } else if (res >= 25.1 && res <= 30) {
      return 'Сиз Ашыкча салмактуусуз';
    } else {
      return 'Сиз семиссиз';
    }
  }

  String bmiDescription(res) {
    if (res <= 18.5) {
      return 'Сиз арыксыз, тамактануу нормаңызды карап коюуңуз шарт';
    } else if (res >= 18.6 && res <= 25) {
      return 'Сиздин дене салмагыңыз нормалдуу. Азаматсыз!';
    } else if (res >= 25.1 && res <= 30) {
      return 'Сиз Ашыкча салмактуу экенсиз, спорт менен алектениңиз!!!';
    } else {
      return 'Сиз семизсиз, срочно фитнес клубка барыңыз!! Аз жеңиз!!';
    }
  }
}
