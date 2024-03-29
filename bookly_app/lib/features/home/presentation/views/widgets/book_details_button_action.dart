import 'package:flutter/material.dart';
import 'package:test/features/home/data/models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              textColor: Colors.black,
              onPressed: () {},
              title: 'Free',
              backgroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              textColor: Colors.white,
              onPressed: () async {
                Uri url = Uri.parse(bookModel.volumeInfo?.previewLink ?? '');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              title: 'preview',
              fontSize: 16,
              backgroundColor: const Color(0xFFEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
