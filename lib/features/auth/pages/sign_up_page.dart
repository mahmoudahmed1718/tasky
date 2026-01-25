import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/core/extensions/context_extension.dart';
import 'package:tasky/core/utils/assets.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/gester_button.dart';
import 'package:tasky/features/auth/widgets/custom_dropdown_button.dart';
import 'package:tasky/features/auth/widgets/custom_text_form_field_phone_register.dart';
import 'package:tasky/features/auth/widgets/custom_text_form_filed_widget.dart';
import 'package:tasky/theme/app_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  bool obscureText = true;
  String? selectedValue;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign Up", style: Styels.textStyle24),
                    const SizedBox(height: 12),
                    CustomTextFormFieldWidget(
                      hintText: "Name",
                      onSaved: (value) {},
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormFieldPhoneRegister(
                      phoneController: phoneController,
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormFieldWidget(
                      hintText: "Years of Experience",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    dropdownButtonMethodWidget(
                      hintText: "Choose your Experince Level",
                      selectedValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormFieldWidget(
                      hintText: "Address",
                      keyboardType: TextInputType.streetAddress,
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormFieldWidget(
                      hintText: "Password",
                      obscureText: obscureText,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            // Toggle the obscureText value
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    GesterButton(text: "Sign Up", onTap: () {}),
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
            ],
          ),
        ),
      ),
    );
  }
}
