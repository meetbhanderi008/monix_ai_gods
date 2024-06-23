import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monix_ai_gods/core/colors/colors.dart';
import 'package:monix_ai_gods/customs/custom_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      height: 106.h,
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      leadingWidth: 18.5.w,
      leading: Image.asset("assets/images/png/leading_icon.png"),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 50.w),
          Text(
            "Monix AI Gods",
            style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
      body: Container(),
      onIndexChanged: (int) {},
    );
  }
}
