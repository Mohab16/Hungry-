class LoginResponseModel {
  int? code;
  String? message;
  Data? data;

  LoginResponseModel({this.code, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  String? name;
  String? email;
  String? image;

  Data({this.token, this.name, this.email, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}