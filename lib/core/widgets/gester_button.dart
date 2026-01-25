import 'package:flutter/material.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/theme/app_colors.dart';

class GesterButton extends StatelessWidget {
  const GesterButton({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: Styels.textStyle19.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
