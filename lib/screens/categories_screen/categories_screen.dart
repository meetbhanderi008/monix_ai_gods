import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monix_ai_gods/core/colors/colors.dart';
import 'package:monix_ai_gods/customs/custom_app_text.dart';
import 'package:monix_ai_gods/customs/custom_scaffold.dart';
import 'package:monix_ai_gods/screens/view_categories_screen/view_categories_screen.dart';

class CategoriesScreen extends StatefulWidget {
  final String title;
  const CategoriesScreen({super.key, required this.title});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showbottomNavigationBar: false,
      showTitleSpaceBetween: false,
      bodyPadding: EdgeInsets.only(top: 22.h),
      title: CustomAppText(
        text: widget.title,
        fontSize: 21.sp,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            _buildTabs(),
            SizedBox(height: 18.h),
            Expanded(
              child: _buildTabView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      height: 38.h,
      decoration: BoxDecoration(
        color: AppColors.secondryColor,
        borderRadius: BorderRadius.circular(67.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 63.w),
      child: TabBar(
        dividerHeight: 0.01,
        indicatorPadding: const EdgeInsets.all(2),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicator: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(67.r),
          border: Border.all(
              color: AppColors.blackColor.withOpacity(0.4), width: 0.5),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(text: '1:1 Images'),
          Tab(text: '9:16 Images'),
        ],
      ),
    );
  }

  Widget _buildTabView() {
    return TabBarView(children: [
      _buildSquareImages(),
      _buildRectangleImage(),
    ]);
  }

  Widget _buildSquareImages() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 19.h),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 19.h,
            children: List.generate(
              10,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewCategoriesScreen(
                          title: widget.title,
                          image: "assets/images/png/square_image.png",
                          showSquareImage: true,
                        ),
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRectangleImage() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 19.h),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 19.h,
            children: List.generate(
              10,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewCategoriesScreen(
                          title: widget.title,
                          image: "assets/images/png/rectangle_image.png",
                          showSquareImage: false,
                        ),
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
        ),
      ),
    );
  }
}
