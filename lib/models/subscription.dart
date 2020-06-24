import 'category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

@JsonSerializable(explicitToJson: true)
class Subscription {
  final String id;
  final String title;
  final List<Category> categories;
  final String sortid;
  final int added;
  final int updated;
  final String website;
  final String visualUrl;

  Subscription(
      {this.id,
      this.title,
      this.categories,
      this.sortid,
      this.added,
      this.updated,
      this.website,
      this.visualUrl});

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
