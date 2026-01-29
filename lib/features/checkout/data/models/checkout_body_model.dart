import 'package:hungry/features/cart/data/models/order_item_model.dart';

class CheckOutBodyModel {
  List<OrderItem>? items;

  CheckOutBodyModel({required this.items});

  CheckOutBodyModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <OrderItem>[];
      json['items'].forEach((v) {
        items!.add(new OrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Items {
//   int? productId;
//   int? quantity;
//   double? spicy;
//   List<int>? toppings;
//   List<int>? sideOptions;

//   Items(
//       {this.productId,
//       this.quantity,
//       this.spicy,
//       this.toppings,
//       this.sideOptions});

//   Items.fromJson(Map<String, dynamic> json) {
//     productId = json['product_id'];
//     quantity = json['quantity'];
//     spicy = json['spicy'];
//     toppings = json['toppings'].cast<int>();
//     sideOptions = json['side_options'].cast<int>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['product_id'] = this.productId;
//     data['quantity'] = this.quantity;
//     data['spicy'] = this.spicy;
//     data['toppings'] = this.toppings;
//     data['side_options'] = this.sideOptions;
//     return data;
//   }
// }