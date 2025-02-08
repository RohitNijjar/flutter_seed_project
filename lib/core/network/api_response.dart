import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    T? data,
    required int statusCode,
    String? errorCode,
    String? message,
  }) = _ApiResponse<T>;

  const ApiResponse._();

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return ApiResponse(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      statusCode: json['statusCode'] as int,
      errorCode: json['errorCode'] as String?,
      message: json['message'] as String?,
    );
  }
}
