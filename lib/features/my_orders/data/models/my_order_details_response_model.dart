class MyOrderDetailsResponseModel {
  int? code;
  String? message;
  Data? data;

  MyOrderDetailsResponseModel({this.code, this.message, this.data});

  MyOrderDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? status;
  String? totalPrice;
  String? createdAt;
  List<Items>? items;

  Data({this.id, this.status, this.totalPrice, this.createdAt, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? productId;
  String? name;
  String? image;
  int? quantity;
  String? price;
  String? spicy;
  List<Toppings>? toppings;
  List<SideOptions>? sideOptions;

  Items({
    this.productId,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.spicy,
    this.toppings,
    this.sideOptions,
  });

  // Factory constructor for skeleton loading
  factory Items.skeleton() {
    return Items(
      productId: 0,
      name: 'Loading...',
      image: 'https://placehold.co/600x400',
      quantity: 1,
      price: '0.00',
      spicy: 'mild',
      toppings: [],
      sideOptions: [],
    );
  }

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
    spicy = json['spicy'];
    if (json['toppings'] != null) {
      toppings = <Toppings>[];
      json['toppings'].forEach((v) {
        toppings!.add(new Toppings.fromJson(v));
      });
    }
    if (json['side_options'] != null) {
      sideOptions = <SideOptions>[];
      json['side_options'].forEach((v) {
        sideOptions!.add(new SideOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['spicy'] = this.spicy;
    if (this.toppings != null) {
      data['toppings'] = this.toppings!.map((v) => v.toJson()).toList();
    }
    if (this.sideOptions != null) {
      data['side_options'] = this.sideOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Toppings {
  int? id;
  String? name;
  String? image;

  Toppings({this.id, this.name, this.image});

  Toppings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class SideOptions {
  int? id;
  String? name;
  String? image;

  SideOptions({this.id, this.name, this.image});

  SideOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
