part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SliderLodingState extends HomeState {}

final class SliderSuccessState extends HomeState {
  final List<Sliders>? sliders;
  SliderSuccessState(this.sliders);
}

final class SliderErrorState extends HomeState {}

final class BestSellerErrorState extends HomeState {}

final class BestSellerSuccessState extends HomeState {
  final List<Product>? products;

  BestSellerSuccessState(this.products);
}

final class BestSellerLoadingState extends HomeState {}

final class AddToCartLoadingState extends HomeState {}

final class AddToCartSuccessState extends HomeState {}

final class AddToCartErrorState extends HomeState {}
