import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login_user.freezed.dart';
part 'login_user.g.dart';

@freezed
class LoginUser with _$LoginUser {
  const factory LoginUser(
    String email,
  ) = _LoginUser;

  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);
}
