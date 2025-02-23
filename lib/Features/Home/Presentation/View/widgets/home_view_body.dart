// ignore_for_file: deprecated_member_use

import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/newest_book_list_view.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/feature_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
                "Newest Books",
                style: Styles.textStyle18,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: NewestListView(),
            ),
          ),
        ],
      ),
    );
  }
}
