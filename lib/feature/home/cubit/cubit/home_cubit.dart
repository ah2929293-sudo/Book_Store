import 'package:bloc/bloc.dart';
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
}
