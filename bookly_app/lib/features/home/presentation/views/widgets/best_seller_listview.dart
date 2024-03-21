import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/widgets/custom_error_widget.dart';
import 'package:test/core/widgets/custom_loading_indicator.dart';
import 'package:test/core/widgets/shimmer.dart';
import 'package:test/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';

import 'best_seller_listview_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
          } else if (state is NewestBooksLoading) {
            return const ShimmerEffect();
          } else {
            return const CustomLoadingIndicator();
          }
      },
    );
  }
}
