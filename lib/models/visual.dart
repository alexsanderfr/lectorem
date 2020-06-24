import 'package:json_annotation/json_annotation.dart';

part 'visual.g.dart';

@JsonSerializable()
class Visual {
  final int id;
  final String url;
  final int width;
  final int height;
  final String contentType;

  Visual({this.id, this.url, this.width, this.height, this.contentType});


  factory Visual.fromJson(Map<String, dynamic> json) => _$VisualFromJson(json);

  Map<String, dynamic> toJson() => _$VisualToJson(this);


}