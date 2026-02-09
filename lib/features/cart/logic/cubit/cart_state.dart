import 'package:hungry/features/cart/data/models/order_item_model.dart';

class CartState {
  final List<OrderItem> items;
  final double spicyLevel;
  final double totalPrice;
  const CartState(this.items, {this.totalPrice = 0, this.spicyLevel = 0.5});
}
