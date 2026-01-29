class OrderItem {
  int? productId;
  int? quantity;
  double? price;
  double? spicy;
  List<int>? toppings;
  List<int>? sideOptions;

  OrderItem(
      {this.productId,
      this.quantity,
      this.spicy,
      this.toppings,
      this.sideOptions,
      this.price
      });

  OrderItem.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    spicy = json['spicy'];
    toppings = json['toppings'].cast<int>();
    sideOptions = json['side_options'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['spicy'] = this.spicy;
    data['toppings'] = this.toppings;
    data['side_options'] = this.sideOptions;
    return data;
  }
}