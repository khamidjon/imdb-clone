// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:imdb_clone/core/dio/dio_module.dart' as _i9;
import 'package:imdb_clone/data/remote/movie_api.dart' as _i6;
import 'package:imdb_clone/data/repositories/movie_repository_impl.dart' as _i8;
import 'package:imdb_clone/data/repositories/token_repository_impl.dart' as _i5;
import 'package:imdb_clone/domain/repositories/movie_repository.dart' as _i7;
import 'package:imdb_clone/domain/repositories/token_repository.dart' as _i4;
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
    gh.singleton<_i3.Dio>(
      dioModule.getUnauthorizedDioClient(),
      instanceName: 'Unauthorized',
    );
    gh.singleton<_i4.TokenRepository>(_i5.TokenRepositoryImpl());
    gh.singleton<_i3.Dio>(
        dioModule.getAuthorizedDioClient(gh<_i4.TokenRepository>()));
    gh.singleton<_i6.MovieApi>(_i6.MovieApi(gh<_i3.Dio>()));
    gh.singleton<_i7.MovieRepository>(
        _i8.MovieRepositoryImpl(gh<_i6.MovieApi>()));
    return this;
  }
}

class _$DioModule extends _i9.DioModule {}
