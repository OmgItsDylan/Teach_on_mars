import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teach_on_mars_test/data/enum/post_status.dart';
import 'package:teach_on_mars_test/data/repositories/post_repository.dart';
import 'package:teach_on_mars_test/posts/cubits/post_event.dart';
import 'package:teach_on_mars_test/posts/cubits/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsState()) {
    _repository = PostsRepository();

    on<FetchPosts>(
      _onFetchPosts,
    );
  }
  late final PostsRepository _repository;

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    try {
      final posts = await _repository.fetchPosts();
      return emit(
        state.copyWith(
          status: PostsStatus.success,
          posts: posts,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PostsStatus.failure));
    }

    // emit(state.copyWith(status: PostsStatus.loading));
    // try {
    //   final posts = await _postsRepository.fetchPosts();
    //   emit(state.copyWith(
    //     status: PostsStatus.success,
    //     posts: posts,
    //     hasReachedMax: false,
    //   ));
    // } catch (_) {
    //   emit(state.copyWith(status: PostsStatus.failure));
    // }
  }
}
