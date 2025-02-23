import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/Home/Data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Data/repos/home_repo_implementation.dart';
import 'package:bookly_app/Features/Home/Presentation/View/book_details_view.dart';
import 'package:bookly_app/Features/Home/Presentation/View/home_view.dart';
import 'package:bookly_app/Features/Home/Presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/Features/Search/Presentation/View/search_view.dart';
import 'package:bookly_app/Features/Splash/Presentation/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRouter.kHomeView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: HomeView(),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}
