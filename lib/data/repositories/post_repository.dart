import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:teach_on_mars_test/data/models/post/post_model.dart';

class PostsRepository {
  PostsRepository() {
    init();
  }

  late Box<List<Map<String, dynamic>>> box;

  final List<PostModel> _posts = [];

  Future<void> init() async {
    box = await Hive.openBox<List<Map<String, dynamic>>>('posts');
  }

  Future<List<PostModel>> fetchPosts() async {
    await getNewPostsFromApi();

    return _posts;
  }

  Future<void> getCachedPosts() async {
    final tmp = await box.get('posts');

    if (tmp != null && tmp.isNotEmpty) {
      for (final post in tmp) {
        _posts.add(PostModel.fromJson(post));
      }
    }
  }

  Future<void> cachePosts() async {
    await box.put('posts', _posts.map((post) => post.toJson()).toList());
  }

  Future<void> getNewPostsFromApi() async {
    try {
      final response = await http.get(Uri.parse('https://interview-dev.teachonmars.com/interview-api.php'));
      if (response.statusCode == 200) {
        final postsJson = jsonDecode(response.body) as List<dynamic>;

        final tmp = postsJson.map((postJson) {
          return PostModel.fromJson(postJson as Map<String, dynamic>);
        }).toList();
        _posts.addAll(tmp);
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> clearCache() async {
    await box.clear();
  }

  void dispose() {
    box.close();
  }
}
