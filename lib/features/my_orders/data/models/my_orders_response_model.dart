class MyOrdersResponseModel {
  int? code;
  String? message;
  List<Data>? data;

  MyOrdersResponseModel({this.code, this.message, this.data});

  MyOrdersResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? status;
  String? totalPrice;
  String? createdAt;
  String? productImage;

  Data(
      {this.id,
      this.status,
      this.totalPrice,
      this.createdAt,
      this.productImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    data['product_image'] = this.productImage;
    return data;
  }
}