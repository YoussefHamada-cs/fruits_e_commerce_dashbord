
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/repos/orders_repo.dart';


part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;
  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());
  Future<void> fetchOrders() async {
    emit(OrdersLoading());
    final result = await ordersRepo.getOrders();
    result.fold(
      (failure) {
        emit(OrdersFailure(message: failure.message??'An unexpected error occurred'));
      },
      (orders) {
        emit(OrdersSuccess(orders: orders));
      },
    );
  }
}
