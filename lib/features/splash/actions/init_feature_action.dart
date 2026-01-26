import 'package:flutter/material.dart';
import 'package:tasky/core/app_storage.dart';
import 'package:tasky/core/utils/api_util.dart';
import 'package:tasky/features/auth/auth_feature.dart';
import 'package:tasky/features/home/home_feature.dart';
import 'package:tasky/features/splash/splash_feature.dart';

class InitFeatureAction {
  static Future<void> execute(BuildContext context) async {
    ApiUtils.init(context);

    await Future.delayed(const Duration(seconds: 3));

    final isOnboardingSeen = AppStorage.to.getOnboardingSeen();
    final token = AppStorage.to.getToken();
    if (isOnboardingSeen) {
      if (token != null) {
        HomeFeature.to.go();
      } else {
        AuthFeature.to.go();
      }
    } else {
      SplashFeature.to.goToOnboardingPage();
    }
  }
}
