// ignore_for_file: deprecated_member_use

import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/best_seller_list_view.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/feature_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CustomAppBar(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: FeatureBooksListView(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 50),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Best Sellers",
                style: Styles.textStyle18,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          const SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: BestSellerListView(),
            ),
          ),
        ],
      ),
    );
  }
}
