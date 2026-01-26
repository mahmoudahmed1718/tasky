import 'package:app_forms/app_forms.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tasky/core/extensions/context_extension.dart';
import 'package:tasky/core/utils/assets.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/gester_button.dart';
import 'package:tasky/theme/app_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormBuilderState>();
  bool obscureText = true;
  String? coutryCode = "+20";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ContextExtension(context).height * 0.2,
                child: SvgPicture.asset(
                  Assets.assetsImagesSplashImage,
                  width: ContextExtension(context).width,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _inputField(name: "name", hint: "Name..."),
                      const SizedBox(height: 14),

                      FormBuilderTextField(
                        name: "phone",
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: CountryCodePicker(
                            initialSelection: 'EG',
                            favorite: ['+20', 'EG'],
                            onChanged: (code) {
                              setState(() {
                                coutryCode = code.dialCode;
                              });
                            },
                          ),
                          hintText: "123 456-7890",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "Phone number required",
                          ),
                          FormBuilderValidators.numeric(
                            errorText: "Enter valid number",
                          ),
                        ]),
                      ),

                      const SizedBox(height: 14),
                      _inputField(
                        name: "experience_years",
                        hint: "Years of experience...",
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 14),

                      // Dropdown Experience Level
                      FormBuilderDropdown(
                        name: "level",
                        validator: FormBuilderValidators.required(
                          errorText: "experience level is required",
                        ),
                        decoration: const InputDecoration(
                          hintText: "Choose experience Level",
                          border: OutlineInputBorder(),
                        ),
                        items: ["Junior", "Mid", "Senior"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                      ),

                      const SizedBox(height: 14),

                      _inputField(name: "address", hint: "Address..."),

                      const SizedBox(height: 14),

                      // Password
                      FormBuilderTextField(
                        name: "password",
                        obscureText: obscureText,
                        validator: FormBuilderValidators.required(
                          errorText: "Password is required",
                        ),
                        decoration: InputDecoration(
                          hintText: "Password...",

                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                      GesterButton(
                        text: "Sign Up",
                        onTap: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            final formData = _formKey.currentState!.value;
                            final fullPhone = "$coutryCode${formData['phone']}";

                            final finalData = {...formData, "phone": fullPhone};
                            print('Form Data: $finalData');
                          } else {
                            print('Validation failed');
                          }
                        },
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: Styels.textStyle14,
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign In",
                              style: Styels.textStyle14.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required String name,
    required String hint,

    TextInputType? keyboardType,
  }) {
    return FormBuilderTextField(
      name: name,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      validator: FormBuilderValidators.required(errorText: "$name is required"),
    );
  }
}
