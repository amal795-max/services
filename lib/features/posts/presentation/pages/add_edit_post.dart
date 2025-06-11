
import 'package:untitled1/features/posts/presentation/bloc/posts_bloc.dart';

import '../../../../core/constants/loading_widget.dart';
import '../../../../core/constants/snackBar_message.dart';
import '../widget/form_widget.dart';
import 'Posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;
  const PostAddUpdatePage({super.key, this.post, required this.isUpdatePost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(title: Text(isUpdatePost ? "Edit Post" : "Add Post"));
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(10),
          child:
          BlocConsumer<PostsBloc, PostsState>(
            listener: (context, state) {
              if (state is AddDeleteUpdatePostSuccess) {
                SnackBarMessage().showSuccessSnackBar(message: state.message, context: context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => PostsPage()),
                        (route) => false);
              } else if (state is ErrorPostsState) {
                SnackBarMessage().showErrorSnackBar(message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingPostState) {
                return LoadingWidget();
              }

              return FormWidget(isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
            },
          )),
    );
  }
}
