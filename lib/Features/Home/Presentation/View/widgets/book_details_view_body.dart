import 'package:bookly_app/Features/Home/Presentation/View/widgets/book_details_app_bar.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/books_details_section.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppDetailsCustomAppBar(),
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimilarBooksSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
