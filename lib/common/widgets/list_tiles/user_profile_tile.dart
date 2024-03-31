import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/h_circular_image.dart';

class HUserProfileTile extends StatelessWidget {
  const HUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const HCircularImage(
        image: HImages.user,
        padding: 0,
        width: 50,
        height: 50,
      ),
      title: Text(
        'John Doe',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: HColors.white),
      ),
      subtitle: Text(
        'supporrt@harshit.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: HColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.edit, color: HColors.white),
      ),
    );
  }
}
