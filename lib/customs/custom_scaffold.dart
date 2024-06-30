import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monix_ai_gods/core/colors/colors.dart';
import 'package:monix_ai_gods/customs/custom_app_text.dart';

class CustomScaffold extends StatefulWidget {
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Widget body;
  final Function(int)? onIndexChanged;
  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final Widget? trailing;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool? showbottomNavigationBar;
  final bool? showTitleSpaceBetween;
  final bool? extendBodyBehindAppBar;
  final bool? extendBody;
  final bool? showBottomBorder;
  final EdgeInsetsGeometry? bodyPadding;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const CustomScaffold({
    super.key,
    this.backgroundColor,
    this.width,
    this.height,
    required this.body,
    this.onIndexChanged,
    this.leading,
    this.leadingWidth,
    this.title,
    this.trailing,
    this.centerTitle,
    this.actions,
    this.showbottomNavigationBar,
    this.showTitleSpaceBetween,
    this.bodyPadding,
    this.extendBodyBehindAppBar,
    this.extendBody,
    this.showBottomBorder,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (widget.onIndexChanged != null) {
      widget.onIndexChanged!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar ?? false,
      extendBody: widget.extendBody ?? false,
      appBar: PreferredSize(
          preferredSize:
              Size(widget.width ?? double.infinity, widget.height ?? 100.h),
          child: Container(
            height: widget.height ?? 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: widget.showBottomBorder == true
                        ? AppColors.dividerColor
                        : Colors.transparent,
                    width: 1.w),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.leading ??
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Image.asset(
                                "assets/images/icon/back_icon.png",
                                width: 21.w,
                                height: 15.27),
                          )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.title ?? const CustomAppText(text: "AppBar"),
                      if (widget.showTitleSpaceBetween == false)
                        SizedBox(width: 80.w)
                    ],
                  ),
                  widget.trailing ??
                      Container(
                        height: 37.h,
                        margin: EdgeInsets.only(right: 20.w),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.redColor, blurRadius: 44.r),
                          ],
                        ),
                        child: Center(
                          child: Image.asset("assets/images/png/idea.png",
                              height: 37.h, width: 86.w),
                        ),
                      )
                ],
              ),
            ),
          )),
      body: Container(
        color: AppColors.primaryColor,
        padding: widget.bodyPadding ?? EdgeInsets.symmetric(horizontal: 20.w),
        child: widget.body,
      ),
      bottomNavigationBar: widget.showbottomNavigationBar == true
          ? Container(
              height: 98.h,
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                border: const Border(
                  top: BorderSide(color: AppColors.borderColor),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -15.h),
                    color: AppColors.whiteColor.withOpacity(0.25),
                    blurRadius: 48.r,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(0, "assets/images/icon/home_filled.png",
                      "assets/images/icon/home_unfilled.png", "Home"),
                  _buildNavItem(1, "assets/images/icon/search_filled.png",
                      "assets/images/icon/search_unfilled.png", "Search"),
                  _buildNavItem(2, "assets/images/icon/monixai_filled.png",
                      "assets/images/icon/monixai_unfilled.png", "Monix AI"),
                  _buildNavItem(3, "assets/images/icon/saved_filled.png",
                      "assets/images/icon/saved_unfilled.png", "Saved"),
                ],
              ),
            )
          : const SizedBox.shrink(),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
    );
  }

  Widget _buildNavItem(int index, String selectedAssetPath,
      String unSelectedAssetPath, String label) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        height: 60.h,
        width: 65.w,
        decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    offset: Offset.zero,
                    color: AppColors.redColor.withOpacity(0.3),
                    blurRadius: 23.r,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              isSelected ? selectedAssetPath : unSelectedAssetPath,
              height: 23.h,
              width: 23.w,
              color: isSelected ? AppColors.redColor : null,
            ),
            SizedBox(height: 11.h),
            CustomAppText(
              text: label,
              fontSize: 13.sp,
              color: isSelected ? AppColors.redColor : AppColors.greyColor,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
