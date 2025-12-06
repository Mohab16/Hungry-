import 'dart:io';


class SignupRequestBodyModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  File? image;

  SignupRequestBodyModel(
      {this.name, this.email, this.phone, this.password, this.image});

  SignupRequestBodyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['image'] = this.image;
    return data;
  }
}