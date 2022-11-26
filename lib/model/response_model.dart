// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseModel {
  int? code;
  String? message;
  dynamic data;
  ResponseModel({
    this.code,
    this.message,
    required this.data,
  });

  ResponseModel copyWith({
    int? code,
    String? message,
    dynamic data,
  }) {
    return ResponseModel(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      code: map['code'] != null ? map['code'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] as dynamic,
    );
  }

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
