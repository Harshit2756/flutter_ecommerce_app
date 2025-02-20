import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'rounded_container.dart';

class HPrimaryHeaderContainer extends StatelessWidget {
  final Widget child;

  const HPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return HCurvedEdgeWidget(
      child: Container(
        // height: 400,
        color: HColors.primary,
        padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: HRoundedContainer(
                height: 400,
                width: 400,
                radius: 400,
                backgroundColor: HColors.textWhite.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: HRoundedContainer(
                height: 400,
                width: 400,
                radius: 400,
                backgroundColor: HColors.textWhite.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
