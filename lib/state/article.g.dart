// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ArticleCWProxy {
  Article createdAt(String createdAt);

  Article gender(String gender);

  Article isFavorite(bool isFavorite);

  Article name(String name);

  Article sentence(String sentence);

  Article title(String title);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Article(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Article(...).copyWith(id: 12, name: "My name")
  /// ````
  Article call({
    String? createdAt,
    String? gender,
    bool? isFavorite,
    String? name,
    String? sentence,
    String? title,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfArticle.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfArticle.copyWith.fieldName(...)`
class _$ArticleCWProxyImpl implements _$ArticleCWProxy {
  final Article _value;

  const _$ArticleCWProxyImpl(this._value);

  @override
  Article createdAt(String createdAt) => this(createdAt: createdAt);

  @override
  Article gender(String gender) => this(gender: gender);

  @override
  Article isFavorite(bool isFavorite) => this(isFavorite: isFavorite);

  @override
  Article name(String name) => this(name: name);

  @override
  Article sentence(String sentence) => this(sentence: sentence);

  @override
  Article title(String title) => this(title: title);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Article(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Article(...).copyWith(id: 12, name: "My name")
  /// ````
  Article call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? isFavorite = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? sentence = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
  }) {
    return Article(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String,
      gender: gender == const $CopyWithPlaceholder()
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as String,
      isFavorite: isFavorite == const $CopyWithPlaceholder()
          ? _value.isFavorite
          // ignore: cast_nullable_to_non_nullable
          : isFavorite as bool,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      sentence: sentence == const $CopyWithPlaceholder()
          ? _value.sentence
          // ignore: cast_nullable_to_non_nullable
          : sentence as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
    );
  }
}

extension $ArticleCopyWith on Article {
  /// Returns a callable class that can be used as follows: `instanceOfclass Article.name.copyWith(...)` or like so:`instanceOfclass Article.name.copyWith.fieldName(...)`.
  _$ArticleCWProxy get copyWith => _$ArticleCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 0;

  @override
  Article read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Article(
      name: fields[0] as String,
      gender: fields[1] as String,
      title: fields[2] as String,
      sentence: fields[3] as String,
      isFavorite: fields[4] as bool,
      createdAt: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.sentence)
      ..writeByte(4)
      ..write(obj.isFavorite)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      name: json['name'] as String,
      gender: json['gender'] as String,
      title: json['title'] as String,
      sentence: json['sentence'] as String,
      isFavorite: json['is_favorite'] as bool,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'title': instance.title,
      'sentence': instance.sentence,
      'is_favorite': instance.isFavorite,
      'created_at': instance.createdAt,
    };
