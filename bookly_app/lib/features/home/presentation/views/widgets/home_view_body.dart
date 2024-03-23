import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test/core/utils/styles.dart';
import 'package:test/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:test/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:test/features/home/presentation/views/widgets/featured_books_listview.dart';

import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import 'best_seller_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshData(context),
      child: const CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Newest Books', style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: BestSellerListView(),
          ),
        ),
      ]),
    );
  }

  Future<void> _refreshData(BuildContext context) async {
    await Future.wait([
      BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(),
      BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(),
    ]);
  }
}
