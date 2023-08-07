import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teach_on_mars_test/app/cubits/theme_mode_cubit.dart';
import 'package:teach_on_mars_test/l10n/l10n.dart';
import 'package:teach_on_mars_test/posts/cubits/post_bloc.dart';
import 'package:teach_on_mars_test/posts/cubits/post_event.dart';
import 'package:teach_on_mars_test/posts/view/posts_list.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  bool darkModeTheme = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.postsAppBarTitle,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text(l10n.drawerHeaderTitle)),
            Switch(
              onChanged: (bool value) {
                setState(() {
                  darkModeTheme = value;
                });
                context.read<ThemeModeCubit>().toggleThemeMode();
              },
              value: darkModeTheme,
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => PostsBloc()..add(InitialFetchPosts()),
        child: const PostsList(),
      ),
    );
  }
}
