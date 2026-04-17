import 'package:bloc/bloc.dart';
import 'package:book_store/feature/home/data/models/best_seller_model.dart';
import 'package:book_store/feature/serch/data/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  search(String text) async {
    emit(SearchLoadingState());
    final response = await SearchRepo.search(text: text);
    if (response != null) {
      emit(SearchSuccessState(response.data?.products ?? []));
    } else {
      emit(SearchErrorState());
    }
  }
}
