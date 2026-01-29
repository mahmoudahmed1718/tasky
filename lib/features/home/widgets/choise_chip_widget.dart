import 'package:flutter/material.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/theme/app_colors.dart';

class ChoiceChipWidget extends StatelessWidget {
  const ChoiceChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: AppColors.primaryColor,
      disabledColor: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      labelPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      showCheckmark: false,
      label: Text("Task"),
      labelStyle: Styels.textStyle19.copyWith(color: Colors.white),
      selected: true,
      onSelected: (value) {},
    );
  }
}
