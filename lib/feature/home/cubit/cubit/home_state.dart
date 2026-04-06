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
