import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teach_on_mars_test/l10n/l10n.dart';
import 'package:teach_on_mars_test/posts/cubits/post_bloc.dart';
import 'package:teach_on_mars_test/posts/cubits/post_event.dart';
import 'package:teach_on_mars_test/posts/view/posts_list.dart';
import 'package:teach_on_mars_test/theme/app_textstyle.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.postsAppBarTitle, style: AppTextStyle.appBarTextStyle),
      ),
      // drawer: ,
      body: BlocProvider(
        create: (_) => PostsBloc()..add(FetchPosts()),
        child: const PostsList(),
      ),
    );
  }
}
