import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/widgets/custom_error_widget.dart';
import 'package:test/core/widgets/custom_loading_indicator.dart';
import 'package:test/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:test/features/home/presentation/views/widgets/custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                    imageUrl:
                        "https://media.istockphoto.com/id/1335247217/vector/loading-icon-vector-illustration.jpg?s=1024x1024&w=is&k=20&c=tU0BqxdEQBVsSKnwiVIhHOvDx8J7YGAH2jiA92TDTok=",
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksErrorState) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
