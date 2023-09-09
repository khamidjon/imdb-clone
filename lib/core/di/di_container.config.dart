// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:imdb_clone/core/dio/dio_module.dart' as _i11;
import 'package:imdb_clone/data/local/local_module.dart' as _i12;
import 'package:imdb_clone/data/local/token_storage.dart' as _i5;
import 'package:imdb_clone/data/remote/movie_api.dart' as _i8;
import 'package:imdb_clone/data/repositories/movie_repository_impl.dart'
    as _i10;
import 'package:imdb_clone/data/repositories/token_repository_impl.dart' as _i7;
import 'package:imdb_clone/domain/repositories/movie_repository.dart' as _i9;
import 'package:imdb_clone/domain/repositories/token_repository.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final localModule = _$LocalModule();
    gh.singleton<_i3.Dio>(
      dioModule.getUnauthorizedDioClient(),
      instanceName: 'Unauthorized',
    );
    gh.singletonAsync<_i4.FlutterSecureStorage>(
        () => localModule.createSecureStorage());
    gh.factoryAsync<_i5.TokenStorage>(() async =>
        _i5.TokenStorage(await getAsync<_i4.FlutterSecureStorage>()));
    gh.singletonAsync<_i6.TokenRepository>(() async =>
        _i7.TokenRepositoryImpl(await getAsync<_i5.TokenStorage>()));
    gh.singletonAsync<_i3.Dio>(() async => dioModule
        .getAuthorizedDioClient(await getAsync<_i6.TokenRepository>()));
    gh.singletonAsync<_i8.MovieApi>(
        () async => _i8.MovieApi(await getAsync<_i3.Dio>()));
    gh.singletonAsync<_i9.MovieRepository>(
        () async => _i10.MovieRepositoryImpl(await getAsync<_i8.MovieApi>()));
    return this;
  }
}

class _$DioModule extends _i11.DioModule {}

class _$LocalModule extends _i12.LocalModule {}
