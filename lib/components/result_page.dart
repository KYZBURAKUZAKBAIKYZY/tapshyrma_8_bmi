import 'package:flutter/material.dart';

import 'package:tapshyrma_8_bmi/components/all_calculator.dart';
import 'package:tapshyrma_8_bmi/theme/app_colors.dart';
import 'package:tapshyrma_8_bmi/theme/app_texts.dart';
import 'package:tapshyrma_8_bmi/theme/app_tezt_style.dart';

class ResultPage extends StatelessWidget {
  final double metri;
  final int salmak;

  const ResultPage({super.key, required this.metri, required this.salmak});

  @override
  Widget build(BuildContext context) {
    double resulattar = BmiCalculator().bmi(height: metri, weight: salmak);
    return Scaffold(
      backgroundColor: AppColors.bgsColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgsColor,
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Ден соолук индекси (BMI)')),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 11, right: 9, top: 43),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 14),
              child: Text(
                'Жыйынтык',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whitColor),
              ),
            ),
            Container(
              height: 315,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.cardColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    BmiCalculator().bmiResult(resulattar),
                    style: const TextStyle(
                        fontSize: 24, color: Color.fromARGB(255, 7, 111, 24)),
                  ),
                  Text(
                    resulattar.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 80, color: AppColors.whitColor),
                  ),
                  Text(
                    BmiCalculator().bmiDescription(resulattar),
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.pinkColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pinkColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          minimumSize: const Size(double.infinity, 73),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          AppTexts.kairaesepte,
          style: AppTextStyles.calculateTextStyle,
        ),
      ),
    );
  }
}
