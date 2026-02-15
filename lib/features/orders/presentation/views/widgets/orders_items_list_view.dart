
import 'package:flutter/widgets.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashbord/features/orders/presentation/views/widgets/Order_Item.dart';


class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orderEntities});

  final List<OrderEntity> orderEntities;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderEntities.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(orderEntity: orderEntities[index]);
      },
    );
  }
}
