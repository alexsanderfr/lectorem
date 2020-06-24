import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content {
  final int id;
  final String content;
  final String direction;

  Content({this.id, this.content, this.direction});


  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
