import 'package:flutter/material.dart';

import 'curved_edges.dart';

class HCurvedEdgeWidget extends StatelessWidget {
  const HCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: HCustomeCurvedEdges(), child: child);
  }
}
