import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/features/posts/presentation/bloc/posts_bloc.dart';

import '../../../../core/constants/loading_widget.dart';
import '../../../../core/constants/snackBar_message.dart';
import '../pages/Posts.dart';
import 'delete_dialog_widget.dart';


class DeletePostBtnWidget extends StatelessWidget {
  final int postId;
  const DeletePostBtnWidget({super.key, required this.postId,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.redAccent,
        ),
      ),
      onPressed: () => deleteDialog(context, postId),
      icon: Icon(Icons.delete_outline),
      label: Text("Delete"),
    );
  }

  void deleteDialog(BuildContext context, int postId) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<PostsBloc, PostsState>(
            listener: (context, state) {
              if (state is AddDeleteUpdatePostSuccess) {
                SnackBarMessage().showSuccessSnackBar(message: state.message, context: context);

 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => PostsPage(),), (route) => false);
              } else if (state is ErrorPostsState) {
                Navigator.of(context).pop();
                SnackBarMessage().showErrorSnackBar(message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingPostState) {
                return AlertDialog(
                  title: LoadingWidget(),
                );
              }
              return DeleteDialogWidget(postId: postId);
            },
          );
        });
  }
}