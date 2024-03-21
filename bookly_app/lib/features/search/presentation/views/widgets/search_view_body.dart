import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:test/features/search/presentation/views/widgets/search_result_listview.dart';

import '../../../../../core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
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
