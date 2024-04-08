import 'package:flutter/material.dart';

import 'progress_indicator_and_rating.dart';

class HOverallProductRatings extends StatelessWidget {
  const HOverallProductRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.5', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              HRatingProgressIndicator(text: '5', value: 0.5),
              HRatingProgressIndicator(text: '4', value: 0.3),
              HRatingProgressIndicator(text: '3', value: 0.1),
              HRatingProgressIndicator(text: '2', value: 0.05),
              HRatingProgressIndicator(text: '1', value: 0.05),
            ],
          ),
        )
      ],
    );
  }
}
