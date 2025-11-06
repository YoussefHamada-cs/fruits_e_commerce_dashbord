import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomButton(
            text: 'Add data',
            onPressed: () {
              // Handle button press
            },
          ),
        ),
      ],
    );
  }
}
