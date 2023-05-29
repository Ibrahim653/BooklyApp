import 'package:flutter/material.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_list_view_item.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          const FeaturedListViewItem(),
        ],
      ),
    );
  }
}