// lib/features/orders/presentation/views/widgets/Order_Item.dart

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/enums/order_enums.dart';
import 'package:fruits_hub_dashbord/features/orders/domain/entities/order_entity.dart';


class OrderItemWidget extends StatelessWidget {
 
  final OrderEntity orderEntity;

  const OrderItemWidget({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==== Total Price + Status (اختياري) ====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price: \$${orderEntity.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
             const Spacer(),
                // Order Status
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: orderEntity.status == OrderStatusEnum.pending
                        ? Colors.orange
                        : orderEntity.status == OrderStatusEnum.accepted
                            ? Colors.green
                            : orderEntity.status == OrderStatusEnum.delivered
                                ? Colors.blue
                                : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    orderEntity.status.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
           
              ],
            ),
            const SizedBox(height: 12),
    
            // ==== User ID ====
            Text(
              'User ID: ${orderEntity.uId}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
    
            // ==== Shipping Address ====
            const Text(
              'Shipping Address:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              orderEntity.shippingAddressModel.toString(),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
    
            // ==== Payment Method ====
            Text(
              'Payment Method: ${orderEntity.paymentMethod}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
    
            // ==== Products Title ====
            const Text(
              'Products:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
    
            // ==== Products List (الجزء اللي كان بيعمل المشكلة) ====
            ListView.builder(
              // الحل النهائي: نضع كل اللي ممكن في SizedBox أو نستخدم shrinkWrap + physics
              shrinkWrap: true, // ضروري
              physics: const NeverScrollableScrollPhysics(), // ضروري
              padding: EdgeInsets.zero,
              itemCount: orderEntity.orderProducts.length,
              itemBuilder: (context, index) {
                final product = orderEntity.orderProducts[index];
    
                return Card(
                  elevation: 2,
    
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported),
                          );
                        },
                      ),
                    ),
                    title: Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'Quantity: ${product.quantity} × \$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.black87),
                    ),
                    trailing: Text(
                      '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
    
            const SizedBox(height: 12),
    
            // ==== هنا ممكن تضيف أزرار Accept / Reject / Deliver ====
            // OrderActionButtons(orderEntity: orderEntity),
          ],
        ),
      ),
    );
  }

  // لو عايز ترجع الـ Status Badge بعدين
  // Color _getStatusColor(OrderStatusEnum status) {
  //   switch (status) {
  //     case OrderStatusEnum.pending:   return Colors.orange;
  //     case OrderStatusEnum.accepted:  return Colors.green;
  //     case OrderStatusEnum.delivered: return Colors.blue;
  //     case OrderStatusEnum.cancelled: return Colors.red;
  //     default:                        return Colors.grey;
  //   }
  // }
}
