import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test/features/search/data/repos/search_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/book_model/book_model.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);


  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(String word) async {
    try {
      var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=$word',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure('oOps,please try again'));
    }
  }
}
