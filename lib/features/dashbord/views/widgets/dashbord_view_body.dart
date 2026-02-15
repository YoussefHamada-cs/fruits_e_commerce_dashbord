import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/router/app_routes.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

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
              context.pushNamed(AppRoutes.addData);
            },
          ),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: CustomButton(
            text: 'View Orders',
            onPressed: () {
              context.pushNamed(AppRoutes.viewOrders);
            },
          ),
        ),
      ],
    );
  }
}
