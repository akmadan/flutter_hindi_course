import 'dart:convert';

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

Future<void> addPost() async {
  try {
    var client = http.Client();
    final response = await client.post(
        Uri.parse(
          "https://jsonplaceholder.typicode.com/posts",
        ),
        body: jsonEncode({
          "title": 'foo',
          "body": 'bar',
          "userId": 1,
        }),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.statusCode);
      print('SUCCESS');
    } else {}
  } catch (e) {
    print(e);
  }
}

Future<void> putPost(int id) async {
  try {
    var client = http.Client();
    final response = await client.put(
        Uri.parse(
          "https://jsonplaceholder.typicode.com/posts/$id",
        ),
        body: jsonEncode({
          "id": 1,
          "title": 'loo',
          "body": 'bargraph',
          "userId": 12,
        }),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.statusCode);
      print('SUCCESS');
    } else {}
  } catch (e) {
    print(e);
  }
}

Future<void> patchPost(int id) async {
  try {
    var client = http.Client();
    final response = await client.patch(
        Uri.parse(
          "https://jsonplaceholder.typicode.com/posts/$id",
        ),
        body: jsonEncode({
          "body": 'bargraph',
        }),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.statusCode);
      print('SUCCESS');
    } else {}
  } catch (e) {
    print(e);
  }
}

Future<void> deletePost(int id) async {
  try {
    var client = http.Client();
    final response = await client.delete(
      Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$id",
      ),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.statusCode);
      print('DELETED');
    } else {}
  } catch (e) {
    print(e);
  }
}
