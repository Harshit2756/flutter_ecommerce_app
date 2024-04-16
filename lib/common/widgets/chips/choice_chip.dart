import 'package:flutter/material.dart';
import 'package:style_hub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:style_hub/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class HChoiceChip extends StatelessWidget {
  const HChoiceChip({
    super.key,
    required this.isSelected,
    required this.text,
    this.onSelected,
  });
  final bool isSelected;
  final String text;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: HColors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: isSelected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: isSelected ? HColors.white : null),
        avatar: isColor
            ? HRoundedContainer(
                height: 50,
                width: 50,
                backgroundColor: HHelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.only(left: 0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: HHelperFunctions.getColor(text),
      ),
    );
  }
}
