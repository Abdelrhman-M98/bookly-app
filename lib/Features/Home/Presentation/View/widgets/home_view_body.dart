import 'package:bookly_app/Core/utils/assets.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/Home/Presentation/View/widgets/custom_llist_view_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
          CustomListViewItem(),
        ],
      ),
    );
  }
}
