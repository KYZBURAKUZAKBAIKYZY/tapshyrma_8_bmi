import 'package:flutter/material.dart';
import 'package:tapshyrma_8_bmi/theme/app_tezt_style.dart';

class MaleFemale extends StatelessWidget {
  const MaleFemale({
    super.key,
    required this.icon,
    required this.text,
    required this.isTrue,
  });

  final IconData? icon;
  final String text;
  final bool isTrue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: isTrue ? Colors.red : null,
        ),
        Text(
          text,
          style: AppTextStyles.titleStyle,
        ),
      ],
    );
  }
}
