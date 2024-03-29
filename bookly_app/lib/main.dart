import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/constants.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/utils/bloc_observer.dart';
import 'package:test/core/utils/service_locator.dart';
import 'package:test/features/home/data/repos/home_repo_impl.dart';
import 'package:test/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:test/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:test/features/search/data/repos/search_repo_impl.dart';
import 'package:test/features/search/presentation/manager/searched_books_cubit/searched_books_cubit.dart';
import 'core/utils/windows_scroll.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBooksCubit>(
          create: (BuildContext context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider<NewestBooksCubit>(
          create: (BuildContext context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
        ),
        BlocProvider<SearchedBooksCubit>(
          create: (BuildContext context) =>
              SearchedBooksCubit(getIt.get<SearchRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
//30/08
//TODO : 1- add shimmer
