import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monix_ai_gods/core/colors/colors.dart';
import 'package:monix_ai_gods/customs/custom_app_text.dart';
import 'package:monix_ai_gods/customs/custom_scaffold.dart';

class ViewCategoriesScreen extends StatefulWidget {
  final String title;
  final String image;
  final bool? showSquareImage;
  const ViewCategoriesScreen(
      {super.key,
      required this.title,
      this.showSquareImage,
      required this.image});

  @override
  State<ViewCategoriesScreen> createState() => _ViewCategoriesScreenState();
}

class _ViewCategoriesScreenState extends State<ViewCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.transparent,
      showbottomNavigationBar: false,
      showTitleSpaceBetween: false,
      extendBodyBehindAppBar: true,
      showBottomBorder: false,
      extendBody: true,
      bodyPadding: EdgeInsets.zero,
      title: CustomAppText(
        text: widget.title,
        fontSize: 21.sp,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
      ),
      trailing: Container(
        height: 37.h,
        margin: EdgeInsets.only(right: 20.w),
        child: Center(
          child: Image.asset("assets/images/png/share.png",
              height: 37.h, width: 86.w),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                    widget.showSquareImage == true
                        ? "assets/images/png/bg_image.png"
                        : widget.image,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover),
                Container(
                  height: 158.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // stops: const [0, 52, 95],
                      colors: [
                        AppColors.blackColor,
                        AppColors.darkGreyColor2.withOpacity(0.64),
                        AppColors.darkGreyColor2.withOpacity(0),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          if (widget.showSquareImage == true)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(widget.image),
                  Padding(
                    padding: EdgeInsets.only(bottom: 46.h),
                    child: CustomAppText(
                      text: "@monix_AI_GODS @monix_AI_G".toUpperCase(),
                      fontSize: MediaQuery.of(context).size.width / 24,
                      color: AppColors.whiteColor.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/png/free_button.png"),
            SizedBox(height: 14.h),
            Image.asset("assets/images/png/watch_ad_button.png"),
            SizedBox(height: 35.h),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
