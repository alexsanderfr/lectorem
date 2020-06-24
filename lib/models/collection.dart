import 'package:json_annotation/json_annotation.dart';

import 'feed.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  final String id;
  final int created;
  final String label;
  final String description;
  final String cover;
  final List<Feed> feeds;

  Collection({this.id, this.created, this.label, this.description, this.cover, this.feeds});

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}