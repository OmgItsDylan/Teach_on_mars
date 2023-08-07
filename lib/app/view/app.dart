import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teach_on_mars_test/app/cubits/theme_mode_cubit.dart';
import 'package:teach_on_mars_test/l10n/l10n.dart';
import 'package:teach_on_mars_test/posts/view/posts_page.dart';
import 'package:teach_on_mars_test/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeModeCubit(),
      child: SafeArea(
        child: BlocBuilder<ThemeModeCubit, ThemeMode>(
          builder: (ctx, ThemeMode obj) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyThemeData.lightTheme,
            darkTheme: MyThemeData.darkTheme,
            themeMode: obj,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const PostsPage(),
          ),
          buildWhen: (previous, current) => previous != current,
        ),
      ),
    );
  }
}
