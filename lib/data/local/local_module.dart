import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocalModule {
  @singleton
  @factoryMethod
  Future<FlutterSecureStorage> createSecureStorage() async {
    return const FlutterSecureStorage();
  }
}
