import 'package:flutter/material.dart';
import 'package:test/features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:test/features/search/presentation/views/widgets/custom_search_text_field.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/best_seller_listview_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 20), //will remove it
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: CustomSearchTextField(),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text('Results', style: Styles.textStyle18),
        ),
        SizedBox(height: 16),
        Expanded(child: SearchResultListView())
      ],
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
      itemCount: 10,
    );
    ;
  }
}
