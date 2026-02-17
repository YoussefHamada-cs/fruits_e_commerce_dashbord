import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';
import 'package:fruits_hub_dashbord/core/services/data_base_service.dart';
import 'package:fruits_hub_dashbord/core/utils/end_points.dart';
import 'package:fruits_hub_dashbord/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/repos/orders_repo.dart';
  
class OrdersRepoImpl implements OrdersRepo{

   final DataBaseService dataBaseService;
 
  OrdersRepoImpl({required this
     .dataBaseService});
 
 @override
  Stream<Either<Failure,List<OrderEntity>>> getOrders()async* {
   try {
    await for (var data in dataBaseService.streamData(path: EndPoints.orders)) {
      List<OrderEntity> orders = (data as List).map<OrderEntity>((e) => OrderModel.fromjson(e).toEntity()).toList();
      yield Right(orders);
    }
   } catch (e) {
    yield Left(ServerFailure(e.toString()));
   }
  }
 
}