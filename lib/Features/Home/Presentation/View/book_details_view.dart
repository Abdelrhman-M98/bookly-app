import 'package:bookly_app/Features/Home/Presentation/View/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BokDetailsView extends StatelessWidget {
  const BokDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(),
      ),
    );
  }
}
