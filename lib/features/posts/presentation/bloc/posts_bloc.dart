import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/core/constants/failure_success_message.dart';
import 'package:untitled1/core/errors/failures.dart';
import 'package:untitled1/features/posts/domain/usecases/add_post.dart';
import 'package:untitled1/features/posts/domain/usecases/delete_post.dart';
import 'package:untitled1/features/posts/domain/usecases/get_all_post.dart';
import 'package:untitled1/features/posts/domain/usecases/update_post.dart';

import '../../domain/entities/post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  final GetAllPostsUseCases getAllPostsUseCases;
  final AddPostUseCases addPostUseCases;
  final DeletePostUseCases deletePostUseCases;
  final UpdatePostUseCases updatePostUseCases;


  PostsBloc({required this.getAllPostsUseCases,required this.addPostUseCases,required this.deletePostUseCases, required this.updatePostUseCases}) : super(PostsInitial()) {

    on<PostsEvent>((event, emit) async{
      if(event is GetAllPostsEvent|| event is RefreshAllPostsEvent){
        emit(LoadingPostState());
        final posts = await getAllPostsUseCases();
        posts.fold(
                (failure){
                  emit(ErrorPostsState(message: mapFailureToMessage(failure)));
                },
                (posts){
                  emit(SuccessPostState(posts: posts));
                }
        );
      }

      if(event is AddPostEvent){
        emit(LoadingPostState());
        final successOrFailure = await addPostUseCases(event.post);
        emit( _either(successOrFailure, ADD_POST_SUCCESS_MESSAGE));
      }
      else if(event is DeletePostEvent) {
        emit(LoadingPostState());
      final successOrFailure =await deletePostUseCases(event.postId);
      emit(  _either(successOrFailure, DELETE_POST_SUCCESS_MESSAGE));

    }
      else if(event is UpdatePostEvent){
        emit(LoadingPostState());
        final successOrFailure =await updatePostUseCases(event.post);
       emit(_either(successOrFailure, UPDATE_POST_SUCCESS_MESSAGE));

      }
    }    );
  }
}
String mapFailureToMessage(Failure failure){
  switch(failure.runtimeType){
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default :
      return "UnExpected Error . Please try again later";

  }
}
PostsState _either(Either<Failure,Unit>either,String message){
 return either.fold(
          (failure)=> ErrorPostsState(message: mapFailureToMessage(failure)),
          (_) => AddDeleteUpdatePostSuccess(message:message)
      );

}