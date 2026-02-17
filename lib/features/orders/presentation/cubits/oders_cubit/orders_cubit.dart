import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/repos/orders_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;
  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());
  StreamSubscription? _ordersSubscription;
  void fetchOrders() async {
    emit(OrdersLoading());
    _ordersSubscription = ordersRepo.getOrders().listen((result) {
      result.fold(
        (failure) => emit(OrdersFailure(message: failure.message ?? 'failure')),
        (orders) => emit(OrdersSuccess(orders: orders)),
      );
    });
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
