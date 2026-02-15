import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashbord/features/orders/presentation/views/widgets/orders_list_view_bloc_builder.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterSection(),
        Expanded(
          child: OrdersListViewBlocBuilder(),
        ),
      ],
    );
  }
}
