import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/config/app_config.dart';
import 'package:tasky/core/app_storage.dart';
import 'package:tasky/core/utils/assets.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/gester_button.dart';
import 'package:tasky/features/auth/auth_feature.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 450,
              width: double.infinity,
              child: SvgPicture.asset(
                Assets.assetsImagesSplashImage,
                fit: BoxFit.fill,
              ),
            ),

            Text('Task Management &', style: Styels.textStyle24),
            Text('To-Do List', style: Styels.textStyle24),
            SizedBox(height: 16),
            Text(
              "This productive tool is designed to help",
              style: Styels.textStyle14,
            ),
            Text("you better manage your task", style: Styels.textStyle14),
            Text("project-wise conveniently!", style: Styels.textStyle14),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GesterButton(
                text: "Let's Get Started",

                ///
                onTap: () {
                  getIt.get<AppStorage>().setOnboardingSeen(true);
                  AuthFeature.to.go();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
