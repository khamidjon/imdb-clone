import 'package:imdb_clone/data/local/token_storage.dart';
import 'package:imdb_clone/domain/entities/token_data.dart';
import 'package:imdb_clone/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  const TokenRepositoryImpl(this._storage);

  final TokenStorage _storage;

  @override
  Future<TokenData?> getToken() async {
    return await _storage.getToken();
  }

  @override
  Future<String> getBearerToken() async {
    final token = await _storage.getToken();
    return 'Bearer ${token!.accessToken}';
  }
}
