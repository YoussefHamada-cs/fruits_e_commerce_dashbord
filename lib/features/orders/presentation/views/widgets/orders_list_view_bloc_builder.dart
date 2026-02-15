
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/helper/get_order_dummy_data.dart';
import 'package:fruits_hub_dashbord/features/orders/presentation/cubits/oders_cubit/orders_cubit.dart';
import 'package:fruits_hub_dashbord/features/orders/presentation/views/widgets/orders_items_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersListViewBlocBuilder extends StatefulWidget {
  const OrdersListViewBlocBuilder({
    super.key,
  });

  @override
  State<OrdersListViewBlocBuilder> createState() => _OrdersListViewBlocBuilderState();
}

class _OrdersListViewBlocBuilderState extends State<OrdersListViewBlocBuilder> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrdersCubit>(context).fetchOrders();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
          if (state is OrdersSuccess) {
          return OrdersItemsListView(orderEntities: state.orders);
        }else if (state is OrdersFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else  {
          return Skeletonizer(child: OrdersItemsListView(orderEntities: [getDummyOrder(),getDummyOrder()]),);
        }
       
      },
    );
  }
}
