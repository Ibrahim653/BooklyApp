import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/icon_broken.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            height: 20,
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: const Icon(
              IconBroken.Search,
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}
