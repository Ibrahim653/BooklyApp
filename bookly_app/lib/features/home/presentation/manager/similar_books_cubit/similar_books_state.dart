part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();
  @override
  List<Object> get props => [];
}

class SimilarBooksInitialState extends SimilarBooksState {}

class SimilarBooksLoadingState extends SimilarBooksState {}

class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccessState(this.books);
}

class SimilarBooksErrorState extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksErrorState({required this.errMessage});
}
