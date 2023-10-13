import 'package:flutter/material.dart';
import 'package:test/features/home/presentation/views/widgets/custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
              imageUrl: "https://media.istockphoto.com/id/1335247217/vector/loading-icon-vector-illustration.jpg?s=1024x1024&w=is&k=20&c=tU0BqxdEQBVsSKnwiVIhHOvDx8J7YGAH2jiA92TDTok=",
            ),
          );
        },
      ),
    );
  }
}
