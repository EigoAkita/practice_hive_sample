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
  String title;

  @HiveField(3)
  String sentence;

  @HiveField(4)
  @JsonKey(name: 'is_favorite')
  bool isFavorite;

  @HiveField(5)
  @JsonKey(name: 'created_at')
  String createdAt;

  @HiveField(6)
  int id;

  Article({
    required this.name,
    required this.gender,
    required this.title,
    required this.sentence,
    required this.isFavorite,
    required this.createdAt,
    required this.id,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
