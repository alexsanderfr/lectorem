
import 'package:json_annotation/json_annotation.dart';

import 'entry.dart';
import 'link.dart';

part 'stream.g.dart';

@JsonSerializable()

class Stream {
  final String id;
  final int updated;
  final String continuation;
  final String title;
  final String direction;
  final List<Link> alternate;
  final List<Entry> items;
  final List<String> ids;

  Stream({this.id, this.updated, this.continuation, this.title, this.direction,
      this.alternate, this.items, this.ids});

  factory Stream.fromJson(Map<String, dynamic> json) => _$StreamFromJson(json);

  Map<String, dynamic> toJson() => _$StreamToJson(this);
}
