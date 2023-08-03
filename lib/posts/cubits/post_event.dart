import 'package:equatable/equatable.dart';
import 'package:teach_on_mars_test/data/models/post/post_model.dart';

sealed class PostsEvent extends Equatable {
  @override
  List<PostModel> get props => [];
}

class FetchPosts extends PostsEvent {}
