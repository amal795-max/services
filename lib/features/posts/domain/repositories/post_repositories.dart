import 'package:dartz/dartz.dart';
import 'package:untitled1/features/posts/domain/entities/post.dart';

import '../../../../core/errors/failures.dart';

abstract class PostRepositories{
   Future <Either<Failure,List<Post>>> getAllPosts();
   Future <Either<Failure,Unit>> deletePost(int id);
   Future <Either<Failure,Unit>> updatePost(Post post);
   Future <Either<Failure,Unit>> addPost(Post post);
}