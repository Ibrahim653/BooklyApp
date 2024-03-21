import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/widgets/custom_error_widget.dart';
import 'package:test/core/widgets/shimmer.dart';
import 'package:test/features/home/presentation/views/widgets/best_seller_listview_item.dart';

import '../../../../../core/utils/styles.dart';
import '../../manager/searched_books_cubit/searched_books_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20,left: 20),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchedBooksLoading) {
          return const ShimmerEffect();
        } else {
          return const Center(
            child: Text(
              'search for any book',
              style: Styles.textStyle20,
            ),
          );
        }
      },
    );
  }
}
