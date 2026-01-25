import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/utils/assets.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/features/auth/widgets/custom_text_form_field_phone_register.dart';
import 'package:tasky/features/auth/widgets/custom_text_form_filed_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.assetsImagesSplashImage,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login", style: Styels.textStyle24),
                const SizedBox(height: 31),
                CustomTextFormFieldPhoneRegister(
                  phoneController: phoneController,
                ),
                const SizedBox(height: 16),
                CustomTextFormFieldWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
