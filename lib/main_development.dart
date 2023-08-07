import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teach_on_mars_test/app/app.dart';
import 'package:teach_on_mars_test/bootstrap.dart';
import 'package:teach_on_mars_test/data/models/picture/picture_model.dart';
import 'package:teach_on_mars_test/data/models/post/post_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter<PostModel>(PostModelAdapter())
    ..registerAdapter<PictureModel>(PictureModelAdapter());
  await bootstrap(() => const App());
}
