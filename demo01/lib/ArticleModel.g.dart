// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticleModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return ArticleModel()
    ..id = json['id'] as num
    ..title = json['title'] as String
    ..create_time = json['create_time'] as String
    ..article_icon = json['article_icon'] as String
    ..article_content = json['article_content'] as String
    ..is_Delete = json['is_Delete'] as bool
    ..tag = json['tag'] as String
    ..tag_name = json['tag_name'] as String
    ..hot = json['is_Hot'] as bool;
}

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'create_time': instance.create_time,
      'article_icon': instance.article_icon,
      'article_content': instance.article_content,
      'is_Delete': instance.is_Delete,
      'tag': instance.tag,
      'tag_name': instance.tag_name,
      'is_Hot': instance.hot
    };
