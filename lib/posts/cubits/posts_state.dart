import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teach_on_mars_test/data/enum/post_status.dart';
import 'package:teach_on_mars_test/data/models/post/post_model.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  factory PostsState({
    @Default(PostsStatus.initial) PostsStatus status,
    @Default([]) List<PostModel> posts,
  }) = _PostsState;
}
