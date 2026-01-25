import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldPhoneRegister extends StatelessWidget {
  const CustomTextFormFieldPhoneRegister({
    super.key,
    required this.phoneController,
    this.onchanged,
  });

  final TextEditingController phoneController;

  final void Function(CountryCode)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
      controller: phoneController,
      onChanged: (value) => phoneController.text = value,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "123 456 7890",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: CountryCodePicker(
          onChanged: onchanged,
          initialSelection: 'EG',
          favorite: ['+20', 'EG'],
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
      ),
    );
  }
}
