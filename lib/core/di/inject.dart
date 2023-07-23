import 'package:get_it/get_it.dart';

T inject<T extends Object>() {
  return GetIt.I.get<T>();
}
