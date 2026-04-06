import 'dart:math';

import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/feature/home/cubit/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is SliderLodingState) {
          return CircularProgressIndicator();
        } else if (state is SliderSuccessState) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  height: 150.0,
                  autoPlay: true,
                  viewportFraction: 1,
                ),
                items: state.sliders?.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(12.r),
                        child: Image.network(i.image ?? "", fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: state.sliders?.length ?? 0,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 8,
                  dotWidth: 13,
                ),
              ),
            ],
          );
        } else {
          return Text("error");
        }
      },
    );
  }
}
