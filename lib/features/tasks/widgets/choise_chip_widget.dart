import 'package:flutter/material.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/theme/app_colors.dart';

class ChoiceChipWidget extends StatelessWidget {
  const ChoiceChipWidget({
    super.key,
    required this.title,
    required this.onSelected,
    required this.selected,
  });
  final String title;
  final Function(void) onSelected;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: AppColors.primaryColor,
      disabledColor: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      labelPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      showCheckmark: false,
      label: Text(title),
      labelStyle: Styels.textStyle16.copyWith(
        color: selected ? Colors.white : Colors.grey,
      ),
      selected: selected,
      onSelected: onSelected,
    );
  }
}
