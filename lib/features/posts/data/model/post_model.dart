import 'package:untitled1/core/database/endpoints.dart';

import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({super.id, required super.title, required super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json[ApiKeys.id], title: json[ApiKeys.title], body: json[ApiKeys.body]);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}