import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: FeatureBooksListView(),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Best Sellers",
              style: Styles.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: FeaturedListViewItem(),
          );
        },
      ),
    );
  }
}
