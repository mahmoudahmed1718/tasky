import 'package:flutter/material.dart';
import 'package:tasky/config/app_config.dart';
import 'package:tasky/core/app_storage.dart';
import 'package:tasky/core/utils/api_util.dart';
import 'package:tasky/features/auth/auth_feature.dart';
import 'package:tasky/features/splash/splash_feature.dart';

class InitFeatureAction {
  static Future<void> execute(BuildContext context) async {
    ApiUtils.init(context);

    await Future.delayed(const Duration(seconds: 3));

    final isOnboardingSeen = AppStorage.to.getOnboardingSeen();

    if (isOnboardingSeen) {
      AuthFeature.to.go();
    } else {
      SplashFeature.to.go;
    }
  }
}
