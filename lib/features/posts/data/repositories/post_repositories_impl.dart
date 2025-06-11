import 'package:dartz/dartz.dart';
import 'package:untitled1/core/errors/exceptions.dart';
import 'package:untitled1/core/errors/failures.dart';
import 'package:untitled1/core/network/network_info.dart';
import 'package:untitled1/features/posts/data/model/post_model.dart';
import 'package:untitled1/features/posts/domain/entities/post.dart';
import 'package:untitled1/features/posts/domain/repositories/post_repositories.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoriesImpl implements PostRepositories{
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;
  final NetworkInfo networkInfo;

  PostRepositoriesImpl({required this.postRemoteDataSource, required this.postLocalDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{
    if(await networkInfo.isConnected){
      try{
      final remotePosts =  await postRemoteDataSource.getAllPosts();
      postLocalDataSource.cachePosts(remotePosts);
      return Right(remotePosts);
      }
      on ServerException{
        return Left(ServerFailure());
      }

    }
    else {
      try {
         final localPosts=await postLocalDataSource.getCachedPosts();
         return Right(localPosts);
      }
      on EmptyCacheException{
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id)async {
   return await getMessage((){
     return postRemoteDataSource.deletePost(id);
   });
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postModel=PostModel(id: post.id, title: post.title, body: post.body);
    return await getMessage((){
      return postRemoteDataSource. addPost(postModel);
    });
  }
  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async{
    final PostModel postModel=PostModel(id: post.id, title: post.title, body: post.body);
    return await getMessage((){
      return postRemoteDataSource.updatePost(postModel);
    });
  }


Future<Either<Failure, Unit>> getMessage(Future <Unit> Function() deleteOrUpdateOrAdd) async {
  if(await networkInfo.isConnected){
    try{
      await deleteOrUpdateOrAdd();
      return Right(unit);
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }
  else {
    return Left(OfflineFailure());

  }
}}