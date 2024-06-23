// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monix_ai_gods/core/colors/colors.dart';
import 'package:monix_ai_gods/customs/custom_app_text.dart';
import 'package:monix_ai_gods/screens/home_screen/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool _allowSwipe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: NonSwipablePageView(
        controller: _pageController,
        allowSwipe: _allowSwipe,
        children: [
          OnboardingPage1(
              controller: _pageController,
              onLastPage: () {
                setState(() {
                  _allowSwipe = false;
                });
              }),
          const OnboardingPage2(),
        ],
      ),
    );
  }
}

class OnboardingPage1 extends StatelessWidget {
  final PageController controller;
  final VoidCallback onLastPage;

  const OnboardingPage1({
    required this.controller,
    required this.onLastPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset("assets/images/png/onboarding1.png", fit: BoxFit.cover),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 6.h,
                    width: 23.w,
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Container(
                    height: 6.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 19.h),
              CustomAppText(
                text: "Explore little God images Gallery by Monix",
                color: AppColors.whiteColor,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                textCenter: true,
              ),
              SizedBox(height: 14.h),
              CustomAppText(
                text:
                    "Discover the magic of art and technology!\nStep into Monix AI Gods App, where\ncreativity knows no bounds.",
                color: AppColors.greyColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                textCenter: true,
              ),
              SizedBox(height: 29.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    child: SizedBox(
                      height: 52.h,
                      width: 152.w,
                      child: Image.asset("assets/images/png/skip.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      onLastPage();
                    },
                    child: Container(
                      height: 52.h,
                      width: 152.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 16),
                            color: AppColors.redColor.withOpacity(0.17),
                            blurRadius: 38,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Image.asset("assets/images/png/next.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset("assets/images/png/onboarding2.png", fit: BoxFit.cover),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 6.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Container(
                    height: 6.h,
                    width: 23.w,
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 19.h),
              CustomAppText(
                text: "Get started by Explore All Gods Categories",
                color: AppColors.whiteColor,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                textCenter: true,
              ),
              SizedBox(height: 14.h),
              CustomAppText(
                text:
                    "Where imagination meets innovation.\nDive into an enchanting gallery of AI-generated wonders",
                color: AppColors.greyColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                textCenter: true,
              ),
              SizedBox(height: 29.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                child: Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 16),
                        color: AppColors.redColor.withOpacity(0.17),
                        blurRadius: 38,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Image.asset("assets/images/png/get_started.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NonSwipablePageView extends StatefulWidget {
  final PageController controller;
  final bool allowSwipe;
  final List<Widget> children;

  const NonSwipablePageView({
    super.key,
    required this.controller,
    required this.allowSwipe,
    required this.children,
  });

  @override
  _NonSwipablePageViewState createState() => _NonSwipablePageViewState();
}

class _NonSwipablePageViewState extends State<NonSwipablePageView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.controller,
      physics: widget.allowSwipe
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        return widget.children[index];
      },
    );
  }
}
