import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HAppBar(title: Text('Reviews & Ratings')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Review List
            // Review Form
          ],
        ),
      ),
    );
  }
}
