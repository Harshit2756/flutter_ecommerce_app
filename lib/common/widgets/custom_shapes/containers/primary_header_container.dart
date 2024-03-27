import 'package:flutter/material.dart';

import 'rounded_container.dart';
import '../curved_edges/curved_edges_widget.dart';
import '../../../../utils/constants/colors.dart';

class HPrimaryHeaderContainer extends StatelessWidget {
  const HPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HCurvedEdgeWidget(
      child: Container(
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
                backgroundColor: HColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: HRoundedContainer(
                height: 400,
                width: 400,
                radius: 400,
                backgroundColor: HColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
