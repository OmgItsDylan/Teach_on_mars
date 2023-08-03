import 'package:flutter/material.dart';
import 'package:teach_on_mars_test/l10n/l10n.dart';
import 'package:teach_on_mars_test/posts/view/posts_page.dart';
import 'package:teach_on_mars_test/theme/app_color.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: AppColor.appBarColor, elevation: 0),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const PostsPage(),
    );
  }
}
