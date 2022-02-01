import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'article.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
@CopyWith()
class Article {
  @HiveField(0)
  String name;

  @HiveField(1)
  String gender;

  @HiveField(2)
  @JsonKey(name: 'image_url')
  String imageUrl;

  @HiveField(3)
  String title;

  @HiveField(4)
  String sentence;

  @HiveField(5)
  @JsonKey(name: 'is_favorite')
  bool isFavorite;

  Article({
    required this.name,
    required this.gender,
    required this.imageUrl,
    required this.title,
    required this.sentence,
    required this.isFavorite,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}