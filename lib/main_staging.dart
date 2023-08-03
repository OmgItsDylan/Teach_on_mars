import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teach_on_mars_test/app/app.dart';
import 'package:teach_on_mars_test/bootstrap.dart';

Future<void> main() async {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  await bootstrap(() => const App());
}
