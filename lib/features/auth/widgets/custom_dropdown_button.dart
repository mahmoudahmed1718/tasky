import 'package:flutter/material.dart';
import 'package:tasky/core/utils/styels.dart';

DropdownButtonFormField<String> dropdownButtonMethodWidget({
  required String hintText,
  String? selectedValue,
  required ValueChanged<String?> onChanged,
}) {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Color(0XFFBABABA)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Color(0XFFBABABA), width: 1),
      ),
    ),
    hint: Text(
      hintText,
      style: Styels.textStyle14.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
    value: selectedValue,
    items: ["Entry Level", "Mid Level", "Senior", "Expert"]
        .map(
          (String level) => DropdownMenuItem(value: level, child: Text(level)),
        )
        .toList(),
    onChanged: onChanged,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your $hintText';
      }
      return null;
    },
  );
}
