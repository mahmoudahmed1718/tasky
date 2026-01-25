import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.phoneController});

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "123 456 7890",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: CountryCodePicker(
          onChanged: (code) {
            // print("Selected country: ${code.dialCode}");
          },
          initialSelection: 'EG', // Egypt default
          favorite: ['+20', 'EG'],
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
      ),
    );
  }
}
