import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/core/errors/exceptions.dart';
import 'package:untitled1/features/posts/data/model/post_model.dart';

abstract class PostLocalDataSource{
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModel);

}

class PostLocalDataSourceImpl implements PostLocalDataSource{
 final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
  List postModelToJson=postModels.map<Map<String,dynamic>>((postModel)=> postModel.toJson()).toList();
   sharedPreferences.setString('cache posts', json.encode(postModelToJson));
   return Future.value(unit);

  }

  @override
  Future<List<PostModel>> getCachedPosts() {
  final jsonString =sharedPreferences.getString("cache posts");
  if(jsonString!=null){
    List decodeJsonData=json.decode(jsonString);
    List<PostModel> jsonToPostModels=decodeJsonData.map<PostModel>((jsonPostModel)=> PostModel.fromJson(jsonPostModel)).toList();
    return Future.value(jsonToPostModels);
  }else {
    throw EmptyCacheException();
  }

  }

}