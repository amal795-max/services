import 'package:dartz/dartz.dart';
import 'package:untitled1/features/posts/domain/repositories/post_repositories.dart';

import '../../../../core/errors/failures.dart';

class DeletePostUseCases {
  final PostRepositories postRepositories;
  DeletePostUseCases({required this.postRepositories});

  Future <Either<Failure,Unit>> call(int postId) async{
    return await postRepositories.deletePost(postId);
  }
}