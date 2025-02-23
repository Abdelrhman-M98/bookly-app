// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_error_widget.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/featured_item.dart';
import 'package:bookly_app/Features/Home/Presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({super.key});

  @override
  _SimilarBooksListViewState createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  int currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % 4; // Cycle through dots
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: FeaturedItem(
                    imageUrl:
                        state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                            '', // Handle null values safely
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(error: state.errorMessage);
        } else {
          return DotsIndicator(
            dotsCount: 4,
            position: currentIndex.toDouble(),
            decorator: DotsDecorator(
              color: Colors.purple,
              activeColor: Colors.deepPurple,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }
      },
    );
  }
}
