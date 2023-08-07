import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teach_on_mars_test/data/enum/post_status.dart';
import 'package:teach_on_mars_test/data/repositories/post_repository.dart';
import 'package:teach_on_mars_test/posts/cubits/post_event.dart';
import 'package:teach_on_mars_test/posts/cubits/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsState()) {
    _repository = PostsRepository();

    on<FetchPosts>(_onFetchPosts);
    on<InitialFetchPosts>(_onInitialFetchPosts);
  }

  bool fetching = false;
  late final PostsRepository _repository;

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    try {
      if (fetching) return;
      fetching = true;
      final posts = await _repository.fetchPosts();
      emit(
        state.copyWith(
          status: PostsStatus.success,
          posts: posts,
        ),
      );

      fetching = false;
    } catch (e) {
      emit(state.copyWith(status: PostsStatus.failure));
      fetching = false;
    }
  }

  Future<void> _onInitialFetchPosts(
    InitialFetchPosts event,
    Emitter<PostsState> emit,
  ) async {
    try {
      final posts = await _repository.getInitialPostsFromApi();
      emit(state.copyWith(status: PostsStatus.success, posts: posts));
    } catch (e) {
      emit(state.copyWith(status: PostsStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _repository.dispose();
    return super.close();
  }
}
