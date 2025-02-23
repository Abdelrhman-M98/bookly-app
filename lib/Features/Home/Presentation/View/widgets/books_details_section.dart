import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/Home/Data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/book_rating.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/books_action.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: FeaturedItem(
            imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          book.volumeInfo!.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo!.authors?[0] ?? "no author",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo!.averageRating ?? 0,
          ratingCount: book.volumeInfo!.ratingsCount ?? 0,
        ),
        SizedBox(
          height: 37,
        ),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
