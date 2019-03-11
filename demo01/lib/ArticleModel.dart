import 'package:json_annotation/json_annotation.dart';

part 'ArticleModel.g.dart';

@JsonSerializable()

class ArticleModel {

  ArticleModel();

  num id;
  String title;
  String create_time;
  String article_icon;
  String article_content;
  bool is_Delete;
  String tag;
  String tag_name;
  @JsonKey(name: 'is_Hot')
  bool hot;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
}