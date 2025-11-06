import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.height < 600;
    final bool isTablet = screenSize.width > 600;

    // ضبط الأحجام بناءً على حجم الشاشة
    final double horizontalPadding = isSmallScreen
        ? 10.0
        : isTablet
        ? 20.0
        : 15.0;
    final double verticalPadding = isSmallScreen
        ? 8.0
        : isTablet
        ? 12.0
        : 10.0;
    final double fontSize = isSmallScreen
        ? 14.0
        : isTablet
        ? 18.0
        : 16.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: Text(text, style: TextStyle(fontSize: fontSize)),

          //  SizedBox(width: spacingWidth),
        ),
      ),
    );
  }
}
