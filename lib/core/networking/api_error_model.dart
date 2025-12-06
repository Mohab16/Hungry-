import 'package:hungry/core/networking/api_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(fromJson: _messageFromJson)
  final String message; // خليها List<dynamic>
  final int? code;
  @JsonKey(name: 'data')
  final ErrorData? errorData;

  ApiErrorModel({
    this.errorData,
    required this.message,
    this.code,
  });

  static String _messageFromJson (dynamic json){
    if(json is String){
      return json;
    }else if (json is List){
      return json.join("\n");
    }else{
      return ApiErrors.defaultError;
    }
  }

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

@JsonSerializable()
class ErrorData {
  final dynamic name;
  final dynamic email;
  final dynamic phone;
  final dynamic password;

  ErrorData({
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  factory ErrorData.fromJson(Map<String, dynamic> json) =>
      _$ErrorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}
