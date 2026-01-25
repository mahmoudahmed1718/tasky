import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/extensions/context_extension.dart';
import 'package:tasky/core/utils/assets.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/gester_button.dart';
import 'package:tasky/features/auth/auth_feature.dart';
import 'package:tasky/features/auth/bloc/auth_bloc.dart';
import 'package:tasky/features/auth/bloc/auth_state.dart';
import 'package:tasky/features/auth/widgets/custom_text_form_field_phone_register.dart';
import 'package:tasky/features/auth/widgets/custom_text_form_filed_widget.dart';
import 'package:tasky/theme/app_colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: AuthBloc.to,
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: ContextExtension(context).height * 0.5,
                  child: SvgPicture.asset(
                    Assets.assetsImagesSplashImage,
                    width: ContextExtension(context).width,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login", style: Styels.textStyle24),
                        const SizedBox(height: 31),
                        CustomTextFormFieldPhoneRegister(
                          phoneController: phoneController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormFieldWidget(
                          hintText: "Password",
                          obscureText: obscureText,
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                        GesterButton(text: "Sign In", onTap: () {}),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "context.loc.noAccount",
                              style: Styels.textStyle14,
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                AuthFeature.to.goToSignUpPage();
                              },
                              child: Text(
                                "Sign Up Here",
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
              ],
            );
          },
        ),
      ),
    );
  }
}
