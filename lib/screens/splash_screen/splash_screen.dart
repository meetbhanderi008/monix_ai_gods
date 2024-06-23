import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:monix_ai_gods/core/colors/colors.dart';
import 'package:monix_ai_gods/customs/custom_app_text.dart';
import 'package:monix_ai_gods/screens/onbording_screen/onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void gotoNextPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ));
    });
  }

  @override
  void initState() {
    super.initState();
    gotoNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset("assets/images/png/splash.png",
            height: 259.h, width: 264.w),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Lottie.asset("assets/lottie/monix_loader.json",
              height: 85.h, width: 85.w),
          SizedBox(height: 60.h),
          CustomAppText(
            text: "Powered by Mavdi",
            fontSize: 14.sp,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w300,
          ),
          SizedBox(height: 25.h),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
