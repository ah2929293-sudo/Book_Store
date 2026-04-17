import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/feature/home/ui/widgets/product_item/product_item.dart';
import 'package:book_store/feature/serch/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "Search Screen",
                onChanged: (v) {
                  context.read<SearchCubit>().search(v);
                },
              ),

              SizedBox(height: 20.h),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoadingState) {
                    return Expanded(
                      child: Skeletonizer(
                        enabled: true,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                  } else if (state is SearchSuccessState) {
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
        ),
      ),
    );
  }
}
