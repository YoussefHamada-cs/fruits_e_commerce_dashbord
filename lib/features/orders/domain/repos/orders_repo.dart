import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
 Future<Either<Failure,List<OrderEntity>>> getOrders();
}
