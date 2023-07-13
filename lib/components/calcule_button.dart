import 'package:flutter/material.dart';
import 'package:tapshyrma_8_bmi/theme/app_colors.dart';
import 'package:tapshyrma_8_bmi/theme/app_texts.dart';
import 'package:tapshyrma_8_bmi/theme/app_tezt_style.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CalculateButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 73,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pinkColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero))),
        onPressed: onPressed,
        child: const Text(
          AppTexts.calculator,
          style: AppTextStyles.calculateTextStyle,
        ),
      ),
    );
  }
}
