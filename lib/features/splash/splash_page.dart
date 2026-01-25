import 'package:app_features/app_features.dart';
import 'package:flutter/material.dart';
import 'package:tasky/app/app_feature.dart';
import 'package:tasky/config/app_config.dart';
import 'package:tasky/core/app_storage.dart';
import 'package:tasky/features/auth/auth_feature.dart';
import 'package:tasky/features/home/home_feature.dart';
import 'package:tasky/features/splash/splash_feature.dart';
import 'package:tasky/theme/app_colors.dart';
import '../../core/utils/api_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ApiUtils.init(context);
    });

    Future.delayed(const Duration(seconds: 3), () {
      final isOnboardingSeen = getIt.get<AppStorage>().getOnboardingSeen();
      if (isOnboardingSeen) {
        AuthFeature.to.goToSignInPage();
      } else {
        SplashFeature.to.goToOnboardingPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Task",
              style: TextStyle(
                color: Colors.white,
                fontSize: 46,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "y",
              style: TextStyle(
                color: Color(0XFFF5F876),
                fontSize: 46,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
