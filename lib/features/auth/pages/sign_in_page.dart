import 'package:app_forms/app_forms.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tasky/core/extensions/context_extension.dart';
import 'package:tasky/core/utils/assets.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/gester_button.dart';
import 'package:tasky/features/auth/auth_feature.dart';
import 'package:tasky/features/auth/bloc/auth_bloc.dart';
import 'package:tasky/features/auth/bloc/auth_state.dart';
import 'package:tasky/features/home/home_feature.dart';

import 'package:tasky/theme/app_colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obscureText = true;

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormBuilderState>();
  String? coutryCode = "+20";
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
                  height: context.height * 0.5,
                  child: SvgPicture.asset(
                    Assets.assetsImagesSplashImage,
                    width: ContextExtension(context).width,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login", style: Styels.textStyle24),
                        const SizedBox(height: 31),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
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
                        const SizedBox(height: 16),

                        FormBuilderTextField(
                          name: "password",
                          obscureText: obscureText,
                          validator: FormBuilderValidators.required(
                            errorText: "Password is required",
                          ),
                          decoration: InputDecoration(
                            hintText: "Password...",

                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
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
                          text: "Sign In",
                          onTap: () async {
                            if (_formKey.currentState?.saveAndValidate() ??
                                false) {
                              final formData = _formKey.currentState!.value;
                              final fullPhone =
                                  "$coutryCode${formData['phone']}";
                              final finalData = {
                                ...formData,
                                "phone": fullPhone,
                              };

                              await AuthBloc.to.signIn(
                                phone: finalData['phone'],
                                password: finalData['password'],
                              );
                              HomeFeature.to.go();
                            }
                          },
                        ),
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
