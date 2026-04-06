import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/feature/cart/ui/cart_screen.dart';
import 'package:book_store/feature/home/cubit/cubit/home_cubit.dart';
import 'package:book_store/feature/home/ui/home_screen.dart';
import 'package:book_store/feature/profile/ui/profile_screen.dart';
import 'package:book_store/feature/wishlist/ui/wishlist_screen.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit()..getSlider(),
      child: HomeScreen(),
    ),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        selectedItemColor: AppColors.primaryColor,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.images.home,
              colorFilter: ColorFilter.mode(
                activeIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.darkGrayColor,
                BlendMode.srcIn,
              ),
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.images.bookmark,
              colorFilter: ColorFilter.mode(
                activeIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.darkGrayColor,
                BlendMode.srcIn,
              ),
            ),
            label: "bookmark",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.images.category,
              colorFilter: ColorFilter.mode(
                activeIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.darkGrayColor,
                BlendMode.srcIn,
              ),
            ),
            label: "category",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.images.profile,
              colorFilter: ColorFilter.mode(
                activeIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.darkGrayColor,
                BlendMode.srcIn,
              ),
            ),
            label: "profile",
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: screens[activeIndex],
        ),
      ),
    );
  }
}
