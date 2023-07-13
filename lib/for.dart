import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tapshyrma_8_bmi/components/calcule_button.dart';
import 'package:tapshyrma_8_bmi/components/height.dart';
import 'package:tapshyrma_8_bmi/components/male_female.dart';
import 'package:tapshyrma_8_bmi/components/result_page.dart';
import 'package:tapshyrma_8_bmi/components/status_card.dart';
import 'package:tapshyrma_8_bmi/components/weight_age.dart';

import 'package:tapshyrma_8_bmi/theme/app_colors.dart';
import 'package:tapshyrma_8_bmi/theme/app_texts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  bool isTrue = true;
  int weight = 60;
  int age = 23;
  double height = 180;

  void resulattar() {
    final res = weight / pow(height / 100, 2);
    if (res <= 18.5) {
      _showAlerDialog(context, "Сиз арыксыз");
    } else if (res >= 18.6 && res <= 25) {
      _showAlerDialog(context, "Сиздин салмагыныз нормалдуу");
    } else if (res >= 25.1 && res <= 30) {
      _showAlerDialog(context, "Сиз ашыкча салмактуусуз!");
    } else {
      _showAlerDialog(context, "Сиз семизсиз!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgsColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgsColor,
        title: const Center(child: Text(AppTexts.bmi)),
        elevation: 0,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 21, top: 32, right: 21, bottom: 42),
        child: Column(children: [
          Expanded(
            child: Row(
              children: [
                StatusCard(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue = true;
                        // ignore: avoid_print
                        print("object1");
                      });
                    },
                    child: MaleFemale(
                      icon: Icons.male,
                      text: AppTexts.male,
                      isTrue: isTrue,
                    ),
                  ),
                ),
                const SizedBox(width: 39),
                StatusCard(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue = false;
                        // ignore: avoid_print
                        print("object2");
                      });
                    },
                    child: MaleFemale(
                      icon: Icons.female,
                      text: AppTexts.female,
                      isTrue: !isTrue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          StatusCard(
            child: Height(
              text: AppTexts.height,
              text1: "${height.toInt()}",
              text2: "cm",
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
              height: height,
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Row(
              children: [
                StatusCard(
                  child: WeightAge(
                    text: AppTexts.weight,
                    san: " $weight",
                    removeBasuu: () {
                      setState(() {
                        weight--;
                      });
                    },
                    addBasuu: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 39),
                StatusCard(
                  child: WeightAge(
                    text: AppTexts.age,
                    san: "$age",
                    addBasuu: () {
                      setState(() {
                        age++;
                      });
                    },
                    removeBasuu: () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: CalculateButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                metri: height,
                salmak: weight,
              ),
            ),
          );
          debugPrint("Clicked");
        },
      ),
    );
  }
}

Future<void> _showAlerDialog(context, String text) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.cardColor,
        title: const Text(
          AppTexts.bmi,
          textAlign: TextAlign.center,
        ),
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Чыгуу'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
