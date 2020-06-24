import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  final String id;
  final String feedId;
  final int subscribers;
  final String title;
  final String description;
  final String language;
  final double velocity;
  final String website;
  final List<String> topics;
  final String state;

  Feed(
      {this.id,
      this.feedId,
      this.subscribers,
      this.title,
      this.description,
      this.language,
      this.velocity,
      this.website,
      this.topics,
      this.state});

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
