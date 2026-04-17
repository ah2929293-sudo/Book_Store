import 'package:book_store/core/routes/routes.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Assets.images.splash.image(width: 100.w),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.searchScreen);
          },
          child: Icon(Icons.search),
        ),
      ],
    );
  }
}
