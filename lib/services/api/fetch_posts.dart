import 'package:flutter_hindi_course/services/models/post_model.dart';
import 'package:http/http.dart' as http;

Future<List<PostResponse>> fetchPosts() async {
  var client = http.Client();
  final response =
      await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  if (response.statusCode == 200) {
    List<PostResponse> posts = postResponseFromJson(response.body);
    print(posts);
    print(posts[0].toJson());
    return posts;
  } else {
    return [];
  }
}
