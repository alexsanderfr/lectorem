import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccessToken {
  final String accessToken;
  final String plan;
  final String refreshToken;
  final int expiresIn;
  final String tokenType;
  final String provider;
  final String id;

  AccessToken({this.accessToken, this.plan, this.refreshToken, this.expiresIn,
      this.tokenType, this.provider, this.id});

  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
