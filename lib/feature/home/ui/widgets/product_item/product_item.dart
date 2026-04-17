import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/widgets/custom_network_image.dart';
import 'package:book_store/feature/home/cubit/cubit/home_cubit.dart';
import 'package:book_store/feature/home/data/models/best_seller_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final Product? product;
  final Color? backGroundColor;
  const ProductItem({super.key, this.product, this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: backGroundColor ?? AppColors.productBackGroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12.r),
            child: CustomNetworkImage(
              imageUrl: product?.image ?? "",
              hight: 190.h,
              width: 150.w,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            product?.name ?? "No Name",
            style: TextStyle(fontSize: 18.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  product?.price ?? "",
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              BlocListener<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is AddToCartLoadingState) {
                    showDialog(
                      context: context,
                      builder: (context) => CircularProgressIndicator(),
                    );
                  } else if (state is AddToCartSuccessState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Added To Cart Successfully")),
                    );
                  }
                },
                child: InkWell(
                  onTap: () {
                    context.read<HomeCubit>().addToCart(product?.id ?? 0);
                  },
                  child: Container(
                    height: 40.h,
                    width: 60.w,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Buy",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
