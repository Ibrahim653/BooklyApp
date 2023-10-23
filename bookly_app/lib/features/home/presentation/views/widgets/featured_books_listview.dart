import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widgets/custom_error_widget.dart';
import 'package:test/core/widgets/custom_loading_indicator.dart';
import 'package:test/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:test/features/home/presentation/views/widgets/custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: (() {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    }),
                    child: CustomBookImage(
                      imageUrl: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiZV0WxURh4QRU50JJMkKrbIC2Enn77UUqOwKbRb8R-wopOA7Tm2M1jFuVthM3TDyvsWY&usqp=CAU',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
