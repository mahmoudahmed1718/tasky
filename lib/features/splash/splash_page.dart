import 'package:flutter/material.dart';
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

    // Future.delayed(const Duration(seconds: 3), () {
    //   // AppFeatures.get<HomeFeature>().go();
    //   // SplashFeature.to.goToOnboardingPage();
    // });
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
