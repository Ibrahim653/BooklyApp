import 'package:flutter/material.dart';
import 'package:test/features/home/data/models/book_model/book_model.dart';
import 'package:test/features/home/presentation/views/widgets/book_details_button_action.dart';
import 'package:test/features/home/presentation/views/widgets/book_rating.dart';
import 'package:test/features/home/presentation/views/widgets/custom_book_item.dart';

import '../../../../../core/utils/styles.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiZV0WxURh4QRU50JJMkKrbIC2Enn77UUqOwKbRb8R-wopOA7Tm2M1jFuVthM3TDyvsWY&usqp=CAU',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          bookModel.volumeInfo?.title ?? '',
          textAlign: TextAlign.center,
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo?.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        const BooksAction(),
      ],
    );
  }
}
