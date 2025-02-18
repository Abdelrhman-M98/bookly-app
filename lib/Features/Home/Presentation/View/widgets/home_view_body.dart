// ignore_for_file: deprecated_member_use

import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/feature_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SizedBox(
              height: 40,
            ),
            FeatureBooksListView(),
            SizedBox(
              height: 50,
            ),
            Text(
              "Best Sellers",
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 30,
            ),
            BestSellerListViewItem(),
          ],
        ),
      ),
    );
  }
}
