import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FeaturedListViewItem(),
        MaterialButton(
          onPressed: () {},
          child: const Text('99 EG'),
        ),
      ],
    );
  }
}
