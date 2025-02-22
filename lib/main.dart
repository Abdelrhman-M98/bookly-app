import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/Home/Data/repos/home_repo_implementation.dart';
import 'package:bookly_app/Features/Home/Presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/Features/Home/Presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt<HomeRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff100B20),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
