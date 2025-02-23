import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_error_widget.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_loading.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/featured_item.dart';
import 'package:bookly_app/Features/Home/Presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: FeaturedItem(
                      imageUrl:
                          state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(error: state.errorMessage);
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
