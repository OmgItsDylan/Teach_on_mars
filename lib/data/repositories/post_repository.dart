import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:teach_on_mars_test/data/models/post/post_model.dart';
import 'package:uuid/uuid.dart';

class PostsRepository {
  PostsRepository();

  late Box<PostModel> box;

  final List<PostModel> _posts = [];

  Future<void> initHive() async {
    box = await Hive.openBox<PostModel>('posts');
    // await clearCache();
  }

  Future<List<PostModel>> fetchPosts() async {
    await getNewPostsFromApi();

    return _posts;
  }

  Future<void> getCachedPosts() async {
    final tmp = box.values.toList();

    if (tmp.isNotEmpty) {
      for (final post in tmp) {
        _posts.add(post);
      }
    }
  }

  Future<List<PostModel>> getInitialPostsFromApi() async {
    try {
      await initHive();
      await getCachedPosts();
      if (_posts.isEmpty) {
        await getNewPostsFromApi();
      }
      if (_posts.isEmpty) {
        throw Exception('Failed to load posts');
      }
      return _posts;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getNewPostsFromApi() async {
    try {
      final response = await http.get(Uri.parse('https://interview-dev.teachonmars.com/interview-api.php'));
      if (response.statusCode == 200) {
        final postsJson = jsonDecode(response.body) as List<dynamic>;

        final tmp = postsJson.map((postJson) {
          final res = PostModel.fromJson(postJson as Map<String, dynamic>);

          return res.copyWith(
            id: res.id! + const Uuid().v4(),
          );
        }).toList();
        unawaited(box.addAll(tmp));
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
