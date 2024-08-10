import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    final int? id,
    final String? username,
    final String? avatar,
    final String? fullname,
    final String? phone,
    final String? email,
    final String? address,
    final int? gender,
    final int? birthday,
    final String? crush,
    final String? deviceToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
