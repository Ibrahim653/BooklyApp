import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test/features/home/data/models/book_model/book_model.dart';
import 'package:test/features/home/data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitialState());

  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks() async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category: 'Computer');
    result.fold((failure) {
      emit(SimilarBooksErrorState(errMessage: failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccessState(books));
    });
  }
}
