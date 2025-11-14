import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/utils/app_colors.dart';

class IsOrganciCheckBox extends StatelessWidget {
  const IsOrganciCheckBox({
    super.key,
    required this.onChanged,
    required this.isOrganic,
  });
  final bool isOrganic;
  final ValueChanged<bool?> onChanged;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          'is Product Organic?',
          style: textTheme.bodyMedium!.copyWith(color: AppColors.textSecondary),
        ),

        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: isOrganic,
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
