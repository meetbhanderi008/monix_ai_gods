import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monix_ai_gods/core/colors/colors.dart';
import 'package:monix_ai_gods/customs/custom_app_text.dart';
import 'package:monix_ai_gods/customs/custom_scaffold.dart';
import 'package:monix_ai_gods/screens/all_categories_screen/all_categories_screen.dart';
import 'package:monix_ai_gods/screens/categories_screen/categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int typeSelected = 1;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      height: 106.h,
      backgroundColor: AppColors.primaryColor,
      showbottomNavigationBar: true,
      leading: Image.asset("assets/images/png/leading_icon.png", width: 18.5.w),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 22.h),
            _buildCategories(),
            SizedBox(height: 38.h),
            _buildAllImages(),
            SizedBox(height: 22.h),
          ],
        ),
      ),
      onIndexChanged: (int) {},
    );
  }

  Widget titleWidget(String titleText, String endText,
      [void Function()? endTextOnTap]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppText(
          text: titleText,
          fontSize: 22.sp,
          color: AppColors.whiteColor,
        ),
        GestureDetector(
          onTap: endTextOnTap,
          child: CustomAppText(
            text: endText,
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return Column(
      children: [
        titleWidget(
          "Categories",
          "View all",
          () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllCategoriesScreen(),
                ));
          },
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 112.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => _buildCategoriesCard(
                "assets/images/png/square_image.png", "Hanuman"),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesCard(String images, String text) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoriesScreen(title: "Hanuman"),
              ));
        },
        child: Column(
          children: [
            Container(
              height: 71.h,
              width: 71.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.greyColor.withOpacity(0.1),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(images, fit: BoxFit.contain),
            ),
            SizedBox(height: 13.h),
            CustomAppText(
              text: text,
              fontSize: 15.sp,
              color: AppColors.darkGreyColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllImages() {
    return Column(
      children: [
        titleWidget("All Images", ""),
        SizedBox(height: 16.h),
        _buildAllImagesButtons(),
        SizedBox(height: 24.h),
        _buildAllImagesCard(),
      ],
    );
  }

  Widget _buildAllImagesButtons() {
    return SizedBox(
      height: 48.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  typeSelected = 1;
                });
              },
              child: Image.asset(
                "assets/images/png/${typeSelected == 1 ? "square_filled" : "square_unfilled"}.png",
              ),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  typeSelected = 2;
                });
              },
              child: Image.asset(
                "assets/images/png/${typeSelected == 2 ? "portrait_filled" : "portrait_unfilled"}.png",
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAllImagesCard() {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 15.h,
        runSpacing: 15.h,
        children: List.generate(
          10,
          (index) => typeSelected == 1
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CategoriesScreen(title: "Hanuman"),
                        ));
                  },
                  child: Container(
                    height: 160.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/png/square_image.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CategoriesScreen(title: "Hanuman"),
                        ));
                  },
                  child: Container(
                    height: 269.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/png/rectangle_image.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
