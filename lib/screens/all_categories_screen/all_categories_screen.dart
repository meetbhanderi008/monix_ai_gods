import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monix_ai_gods/core/colors/colors.dart';
import 'package:monix_ai_gods/customs/custom_app_text.dart';
import 'package:monix_ai_gods/customs/custom_scaffold.dart';
import 'package:monix_ai_gods/screens/categories_screen/categories_screen.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showbottomNavigationBar: false,
      title: CustomAppText(
        text: "All Categories",
        fontSize: 21.sp,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 22.h),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1.w,
              mainAxisSpacing: 19.h,
              childAspectRatio: 0.9,
            ),
            itemCount: 14,
            itemBuilder: (context, index) {
              return _buildAllCategoriesCard(
                "assets/images/png/square_image.png",
                "Hanuman",
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAllCategoriesCard(String images, String text) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesScreen(title: text),
              ));
        },
        child: Column(
          children: [
            Container(
              height: 81.h,
              width: 81.w,
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
              fontSize: 18.sp,
              color: AppColors.darkGreyColor,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
