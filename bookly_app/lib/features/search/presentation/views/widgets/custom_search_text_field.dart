import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/features/search/presentation/manager/searched_books_cubit/searched_books_cubit.dart';
import '../../../../../core/utils/icon_broken.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        BlocProvider.of<SearchedBooksCubit>(context)
            .fetchSearchedBooks(searchWord: value);
      },
      onSubmitted: (value) {
        BlocProvider.of<SearchedBooksCubit>(context)
            .fetchSearchedBooks(searchWord: value);
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: const Icon(
          IconBroken.Search,
          size: 22,
        ),
        prefixIcon: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            size: 22,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
