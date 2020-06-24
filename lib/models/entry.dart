import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'link.dart';
import 'tag.dart';
import 'visual.dart';
import 'content.dart';
import 'origin.dart';

part 'entry.g.dart';

@JsonSerializable()
class Entry {
  final String id;
  final String title;
  final Content content;
  final Content summary;
  final String author;
  final int crawled;
  final int published;
  final int updated;
  final List<Link> alternate;
  final Origin origin;
  final List<String> keywords;
  final Visual visual;
  final bool unread;
  final List<Tag> tags;
  final List<Category> categories;
  final int engagement;
  final int actionTimestamp;
  final List<Link> enclosure;
  final String fingerprint;
  final String originId;
  final String sid;
  final List<Visual> thumbnail;

  Entry({
    this.id,
    this.title,
    this.content,
    this.summary,
    this.author,
    this.crawled,
    this.published,
    this.updated,
    this.alternate,
    this.origin,
    this.keywords,
    this.visual,
    this.unread,
    this.tags,
    this.categories,
    this.engagement,
    this.actionTimestamp,
    this.enclosure,
    this.fingerprint,
    this.originId,
    this.sid,
    this.thumbnail,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}
