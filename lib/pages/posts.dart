import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hindi_course/services/api/fetch_posts.dart';
import 'package:flutter_hindi_course/services/mappers/post_network_to_ui_mapper.dart';
import 'package:flutter_hindi_course/services/models/post_model.dart';
import 'package:flutter_hindi_course/widgets/post_tile.dart';

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await deletePost(1);
        },
      ),
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: ((context, index) {
            return PostTileWidget(uiModel: PostMapper.map(posts[index]));
          }),
        ),
      ),
    );
  }
}


// NetworkModel

// UiModel 




// Server --> Data --> Client --> NetworkModel  
// --> DataUiModel --> Ui