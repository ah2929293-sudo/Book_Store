import 'package:book_store/feature/home/cubit/cubit/home_cubit.dart';
import 'package:book_store/feature/home/ui/widgets/home_app_bar.dart';
import 'package:book_store/feature/home/ui/widgets/home_slider.dart';
import 'package:book_store/feature/home/ui/widgets/product_item/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(),
          SizedBox(height: 20.h),
          HomeSlider(),
          SizedBox(height: 20.h),
          Text(
            "Best saller",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current is BestSellerErrorState ||
                current is SliderLodingState ||
                current is BestSellerSuccessState,
            builder: (context, state) {
              if (state is SliderLodingState) {
                return Expanded(
                  child: Skeletonizer(
                    enabled: true,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 11.w,
                        mainAxisSpacing: 11.h,
                        childAspectRatio: .55,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return ProductItem(backGroundColor: Colors.grey);
                      },
                    ),
                  ),
                );
              } else if (state is BestSellerSuccessState) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11.w,
                      mainAxisSpacing: 11.h,
                      childAspectRatio: .55,
                    ),
                    itemCount: state.products?.length,
                    itemBuilder: (context, index) {
                      return ProductItem(product: state.products?[index]);
                    },
                  ),
                );
              } else {
                return Text("Error Message");
              }
            },
          ),
        ],
      ),
    );
  }
}

// 7.11
