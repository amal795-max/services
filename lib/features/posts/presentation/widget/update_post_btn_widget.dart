import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';
import '../pages/add_edit_post.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  final Post post;
  const UpdatePostBtnWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => PostAddUpdatePage(isUpdatePost: true, post: post)));
      },
      icon: Icon(Icons.edit),
      label: Text("Edit"),
    );
  }
}