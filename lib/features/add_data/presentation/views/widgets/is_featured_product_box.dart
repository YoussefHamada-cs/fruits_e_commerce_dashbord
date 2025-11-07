import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/utils/app_colors.dart';

class IsFeaturedProductBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const IsFeaturedProductBox({
    super.key,

    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          'Is featued item',
          style: textTheme.bodyMedium!.copyWith(color: AppColors.textSecondary),
        ),
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: isChecked,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            onChanged: onChanged,
            activeColor: AppColors.green,
            checkColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
