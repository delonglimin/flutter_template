// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ArticleModel {
  String? content;
  String? description;
  String? imgUrl;
  String? id;
  String? createTime;
  ArticleModel({
    this.content,
    this.description,
    this.imgUrl,
    this.id,
    this.createTime,
  });
  

  ArticleModel copyWith({
    String? content,
    String? description,
    String? imgUrl,
    String? id,
    String? createTime,
  }) {
    return ArticleModel(
      content: content ?? this.content,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      id: id ?? this.id,
      createTime: createTime ?? this.createTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'description': description,
      'imgUrl': imgUrl,
      'id': id,
      'createTime': createTime,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      content: map['content'] != null ? map['content'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      imgUrl: map['imgUrl'] != null ? map['imgUrl'] as String : null,
      id: map['id'] != null ? map['id'].toString() : null,
      createTime: map['createTime'] != null ? map['createTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) => ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
