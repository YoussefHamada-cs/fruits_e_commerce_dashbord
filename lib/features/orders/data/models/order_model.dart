
import 'package:fruits_hub_dashbord/core/enums/order_enums.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/entities/order_entity.dart';
import 'order_product_model.dart';
import 'shipping_address_model.dart';
class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String? status;
  final String paymentMethod;
  final String orderId;
  OrderModel(
      {required this.totalPrice,
      required this.uId,
      required this.orderId,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod,
      required this.status});
 factory OrderModel.fromjson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      uId: json['uId'],
      shippingAddressModel:
          ShippingAddressModel.fromjson(json['shippingAddressModel']),
      orderProducts: (json['orderProducts'] as List)
          .map((e) => OrderProductModel.fromJson(e))
          .toList(),
        status: json['status'],
      paymentMethod: json['paymentMethod'],
    );
  }
 
  toJson() => {
        'orderId': orderId,
        'totalPrice': totalPrice,
        'uId': uId,
        'status': 'pending',
        'date': DateTime.now().toString(),
        'shippingAddressModel': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };
     
  toEntity() => OrderEntity(
        orderId: orderId,
        totalPrice: totalPrice,
        status: fetchEnum(),
        uId: uId,
        shippingAddressModel: shippingAddressModel.toEntity(),
        orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
        paymentMethod: paymentMethod,
      );
      
       OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e){
      var enumStatus = e.name.toString();
      
      return enumStatus == (status ??'pending');
    });
       }
}

// payment method
