import 'package:flutter/material.dart';

import 'package:test/core/utils/styles.dart';
import 'package:test/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:test/features/home/presentation/views/widgets/featured_books_listview.dart';

import 'best_seller_listview_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(height: 50),
          Text('Best Seller', style: Styles.textStyle18),
          SizedBox(height: 20),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}
