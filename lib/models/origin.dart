import 'package:json_annotation/json_annotation.dart';

part 'origin.g.dart';

@JsonSerializable()

class Origin {
  final int id;
  final String streamId;
  final String title;
  final String htmlUrl;

  Origin({this.id, this.streamId, this.title, this.htmlUrl});

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}