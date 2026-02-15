import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/services/get_it_sevice.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashbord/features/orders/presentation/cubits/oders_cubit/orders_cubit.dart';
import 'package:fruits_hub_dashbord/features/orders/presentation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Orders'),

      body: BlocProvider(
        create: (context) => OrdersCubit(ordersRepo: getIt.get<OrdersRepo>()),
        child: OrderViewBody(),
      ),
    );
  }
}
