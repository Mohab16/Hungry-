class HomeProductsModel {
  int? code;
  String? message;
  List<Data>? data;

  HomeProductsModel({this.code, this.message, this.data});

  HomeProductsModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? description;
  String? image;
  String? rating;
  String? price;

  Data(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.rating,
      this.price});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['price'] = this.price;
    return data;
  }
}