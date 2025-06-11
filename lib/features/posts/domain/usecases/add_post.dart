import 'package:dartz/dartz.dart';
import 'package:untitled1/features/posts/domain/repositories/post_repositories.dart';
import '../../../../core/errors/failures.dart';
import '../entities/post.dart';

class AddPostUseCases{
 final PostRepositories postRepositories;

  AddPostUseCases({required this.postRepositories});

 Future <Either<Failure,Unit>> call( Post post) async{
   return await postRepositories.addPost(post);
 }
}