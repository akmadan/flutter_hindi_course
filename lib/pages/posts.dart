import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hindi_course/services/api/fetch_posts.dart';
import 'package:flutter_hindi_course/services/models/post_model.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<PostResponse> posts = [];

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  getPosts() async {
    final postTemp = await fetchPosts();
    setState(() {
      posts = postTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(itemCount: posts.length, 

        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,
               

              ), 
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(posts[index].body)
              ],
            ),
          );
        }),
        ),
      ),
    );
  }
}
