import 'package:flutter/material.dart';
import 'package:untitled1/features/posts/presentation/pages/post-details.dart';

import '../../domain/entities/post.dart';

class ListPostsWidget extends StatelessWidget {
  final List <Post>posts ;
  const ListPostsWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        padding: EdgeInsets.all(20),
        itemBuilder: (context, i) {
          return ListTile(
            leading:Text(posts[i].id.toString()),
            title:Text(posts[i].title),
            subtitle:Text(posts[i].body),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>PostDetails(post: posts[i])));
            },
          );
        },

        separatorBuilder: (context, i) {
          return Divider();
        }, itemCount: posts.length);
  }
}
