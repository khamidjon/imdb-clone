import 'package:get_it/get_it.dart';
import 'package:imdb_clone/core/di/di_container.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> initDi() async {
  await getIt.init();
  return getIt.allReady();
}