import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monix_ai_gods/core/colors/colors.dart';

class CustomScaffold extends StatefulWidget {
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Widget body;
  final Function(int)? onIndexChanged;
  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
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
    this.centerTitle,
    this.actions,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

int selectedIndex = 0;

class _CustomScaffoldState extends State<CustomScaffold> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onIndexChanged!(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
          preferredSize:
              Size(widget.width ?? double.infinity, widget.height ?? 70),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leadingWidth: widget.leadingWidth ?? 0,
                    leading: widget.leading,
                    centerTitle: widget.centerTitle,
                    title: widget.title ??
                        const Text(
                          'AppBar',
                          style: TextStyle(color: Colors.white),
                        ),
                    actions: widget.actions,
                  ),
                  SizedBox(height: 20.h),
                  const Divider(color: AppColors.dividerColor, height: 1)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 37.h,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: AppColors.redColor, blurRadius: 44),
                      ],
                    ),
                    child: Image.asset("assets/images/png/idea.png",
                        height: 37.h, width: 86.w),
                  ),
                ],
              )
            ],
          )),
      body: Container(
        color: AppColors.primaryColor,
        height: double.infinity,
        width: double.infinity,
        child: widget.body,
      ),
      // Stack(
      //   children: [
      //     // Image.asset(
      //     //   "assets/images/png/background_image.png",
      //     //   fit: BoxFit.fill,
      //     //   height: MediaQuery.of(context).size.height,
      //     // ),
      //     widget.body
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
