import 'package:bookly_app/Core/utils/assets.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FeaturedItem(
              imageUrl: AssetsUse.test,
            ),
          );
        },
      ),
    );
  }
}
