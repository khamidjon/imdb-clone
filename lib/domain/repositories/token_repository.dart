import 'package:imdb_clone/domain/entities/token_data.dart';

abstract class TokenRepository {
  Future<TokenData?> getToken();

  Future<String> getBearerToken();

  // TODO: we will implement later
  // Future<TokenData> refreshToken(TokenData token);
  //
  // Future<void> saveToken(TokenData token);
  //
  // Future<void> deleteToken();
}