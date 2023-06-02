import 'package:flutter/material.dart';
import 'package:test/core/utils/styles.dart';

import '../../../../../core/widgets/custom_button.dart';

class BookDetailsButtonAction extends StatelessWidget {
  const BookDetailsButtonAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            textColor: Colors.black,
            onPressed: () {},
            title: '19.99€',
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            textColor: Colors.white,
            onPressed: () {},
            title: 'Free preview',
            backgroundColor: Color(0xFFEF8262),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
