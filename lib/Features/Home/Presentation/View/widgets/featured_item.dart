// ignore_for_file: deprecated_member_use

import 'package:bookly_app/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(0.5),
            image: DecorationImage(
              image: NetworkImage(
                AssetsUse.test,
              ),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
