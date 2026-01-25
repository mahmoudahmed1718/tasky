import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.keyboardType,
    this.onSaved,
    required this.hintText,
  });
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final String hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hintText';
        }
        return null;
      },
      onSaved: onSaved,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: outlineborder(),
        enabledBorder: outlineborder(),
        focusedBorder: outlineborder(),
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder outlineborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0XFFBABABA)),
    );
  }
}
