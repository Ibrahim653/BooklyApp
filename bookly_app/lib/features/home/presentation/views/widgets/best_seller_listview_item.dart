import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/features/home/data/models/book_model/book_model.dart';
import 'package:test/features/home/presentation/views/widgets/custom_book_item.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookModel);
        
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: (bookModel.volumeInfo?.imageLinks?.thumbnail) ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiZV0WxURh4QRU50JJMkKrbIC2Enn77UUqOwKbRb8R-wopOA7Tm2M1jFuVthM3TDyvsWY&usqp=CAU',
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      (bookModel.volumeInfo?.title) ?? 'No Title',
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGTSectraFine),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    (bookModel.volumeInfo?.authors?[0] ?? ''),
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const BookRating(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
