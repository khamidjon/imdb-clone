import 'package:imdb_clone/domain/entities/token_data.dart';
import 'package:imdb_clone/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  @override
  TokenData getToken() {
    /// Generated from https://www.themoviedb.org/settings/api
    /// Just using personal token in this video
    const accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmODQwM2E1MmE0YzJlZWQ5ZWUxMzE5MTM4ZjMxMGFiZCIsInN1YiI6IjY0YmE5MjNhMzAwOWFhMDBmZmJmYjkwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oTjPKnldgZHcj5RX01sOp1496D886CRv2Llpd2ze6VA';
    const refreshToken = '';
    return const TokenData(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
