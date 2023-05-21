import 'package:flutter/material.dart';
import 'package:test/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:test/features/home/presentation/views/widgets/featured_books_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        FeaturedBooksListView(),
      ],
    );
  }
}
