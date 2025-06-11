import 'package:dartz/dartz.dart';
import 'package:untitled1/features/posts/domain/entities/post.dart';
import 'package:untitled1/features/posts/domain/repositories/post_repositories.dart';

import '../../../../core/errors/failures.dart';

class UpdatePostUseCases{
  final PostRepositories postRepositories;

  UpdatePostUseCases({required this.postRepositories});

  Future <Either<Failure,Unit>> call(Post post) async{
    return await postRepositories.updatePost(post);
  }
}