import 'package:dartz/dartz.dart';
import 'package:untitled1/features/posts/domain/repositories/post_repositories.dart';
import '../../../../core/errors/failures.dart';
import '../entities/post.dart';

class GetAllPostsUseCases{
  final PostRepositories postRepositories;
  GetAllPostsUseCases({required this.postRepositories});
  Future <Either<Failure,List<Post>>> call() async{
    return await postRepositories.getAllPosts();
}

}