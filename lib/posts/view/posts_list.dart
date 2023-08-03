import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teach_on_mars_test/data/enum/post_status.dart';
import 'package:teach_on_mars_test/l10n/l10n.dart';
import 'package:teach_on_mars_test/posts/cubits/post_bloc.dart';
import 'package:teach_on_mars_test/posts/cubits/post_event.dart';
import 'package:teach_on_mars_test/posts/cubits/posts_state.dart';
import 'package:teach_on_mars_test/posts/view/post_detail_page.dart';
import 'package:teach_on_mars_test/posts/widgets/button/core.dart';
import 'package:teach_on_mars_test/posts/widgets/loader_widge/core.dart';
import 'package:teach_on_mars_test/posts/widgets/post_card/core.dart';
import 'package:teach_on_mars_test/theme/app_color.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ColoredBox(
      color: AppColor.postsListBackgroundColor,
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.status) {
            case PostsStatus.initial:
              return const Center(child: LoaderWidget());
            case PostsStatus.failure:
              if (state.posts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text(
                            l10n.errorFetchMsg,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Button.primary(
                          label: l10n.tryAgain,
                          onPressed: () async => context.read<PostsBloc>().add(
                                FetchPosts(),
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showNotif(context);
                });
                break;
              }
            case PostsStatus.success:
              break;
          }
          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),
            itemBuilder: (_, idx) => PostCard(
              model: state.posts[idx],
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => PostDetailPage(
                      model: state.posts[idx],
                    ),
                  ),
                );
              },
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 30),
            itemCount: state.posts.length,
          );
        },
      ),
    );
  }

  bool get _isEndOfScroll {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    if (_isEndOfScroll) {
      context.read<PostsBloc>().add(FetchPosts());
    }
  }

  void _showNotif(BuildContext context) {
    final l10n = context.l10n;
    FToast().init(context).showToast(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red[200],
              border: Border.all(color: Colors.red),
            ),
            child: Text(
              l10n.errorFetchMsg,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
