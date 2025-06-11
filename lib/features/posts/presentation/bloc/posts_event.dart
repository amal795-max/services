part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetAllPostsEvent extends PostsEvent{}
class RefreshAllPostsEvent extends PostsEvent{}
class AddPostEvent extends PostsEvent{
  final Post post;
  const AddPostEvent({required this.post});

  @override
  // TODO: implement props
  List<Object?> get props => [post];
}
class DeletePostEvent extends PostsEvent{
  final int postId;

  const DeletePostEvent({required this.postId});
  @override
  // TODO: implement props
  List<Object?> get props => [postId];}


class UpdatePostEvent extends PostsEvent{
  final Post post;
  const UpdatePostEvent({required this.post});

  @override
  // TODO: implement props
  List<Object?> get props => [post];
}