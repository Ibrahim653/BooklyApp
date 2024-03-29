import 'package:dartz/dartz.dart';
import 'package:test/core/errors/failures.dart';
import 'package:test/features/home/data/models/book_model/book_model.dart';

abstract class SearchRepo{
  Future <Either<Failure,List<BookModel>>>fetchSearchedBooks(String searchWord);  
}