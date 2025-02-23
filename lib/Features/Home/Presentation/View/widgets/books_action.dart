import 'package:bookly_app/Core/Widgets/custom_btn.dart';
import 'package:bookly_app/Core/utils/launcher.dart';
import 'package:bookly_app/Features/Home/Data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomBtn(
              text: "Free",
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomBtn(
              onPressed: () async {
                launchCustomUrl(context, book.volumeInfo!.previewLink!);
              },
              text: getText(book),
              backgroundColor: Color(0xffef8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo!.previewLink == null) {
      return "Not Available";
    } else {
      return "Preview";
    }
  }
}
