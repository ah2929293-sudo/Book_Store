import 'package:bloc/bloc.dart';
import 'package:book_store/feature/cart/data/repo/cart_repo.dart';
import 'package:book_store/feature/home/data/models/best_seller_model.dart';
import 'package:book_store/feature/home/data/models/slider_model.dart';
import 'package:book_store/feature/home/data/repo/home_repo.dart';
import 'package:flutter/widgets.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getSlider() async {
    emit(SliderLodingState());
    final response = await HomeRepo.getSlider();
    if (response != null) {
      emit(SliderSuccessState(response.data?.sliders ?? []));
    } else {
      emit(SliderErrorState());
    }
  }

  getBestSeller() async {
    emit(SliderLodingState());
    final response = await HomeRepo.getBestSeller();
    if (response != null) {
      emit(BestSellerSuccessState(response.data?.products ?? []));
    } else {
      emit(BestSellerErrorState());
    }
  }

  addToCart(int productId) async {
    emit(AddToCartLoadingState());
    final response = await CartRepo.addToCart(productId);
    if (response) {
      emit(AddToCartSuccessState());
    } else {
      emit(AddToCartErrorState());
    }
  }
}
