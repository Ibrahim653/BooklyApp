import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test/core/errors/failures.dart';
import 'package:test/core/utils/api_service.dart';
import 'package:test/features/home/data/models/book_model/book_model.dart';
import 'package:test/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      String searchWord) async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=$searchWord',
      );
      if (data.containsKey(searchWord)) {
        List<BookModel> books = data['items']
            .map<BookModel>((item) => BookModel.fromJson(item))
            .toList();
        return right(books);
      } else {
        return left(ServerFailure('Items not found in data'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
