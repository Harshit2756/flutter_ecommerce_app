import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';

class HRatingProgressIndicator extends StatelessWidget {
  const HRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 15,
          child: SizedBox(
            width: HDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: HColors.grey,
              borderRadius: BorderRadius.circular(10),
              valueColor: const AlwaysStoppedAnimation<Color>(HColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
