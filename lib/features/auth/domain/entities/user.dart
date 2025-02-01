import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required bool isVerified,
    String? token,
  }) = _User;

  const User._();
}
