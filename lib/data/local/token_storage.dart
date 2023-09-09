import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:imdb_clone/domain/entities/token_data.dart';
import 'package:injectable/injectable.dart';

const _accessTokenKey = 'accessToken';
const _refreshTokenKey = 'refreshToken';

@injectable
class TokenStorage {
  const TokenStorage(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future<void> saveToken(TokenData token) async {
    await _secureStorage.write(
      key: _accessTokenKey,
      value: token.accessToken,
    );
    await _secureStorage.write(
      key: _refreshTokenKey,
      value: token.refreshToken,
    );
  }

  Future<TokenData?> getToken() async {
    final accessToken = await _secureStorage.read(key: _accessTokenKey);
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    // if (accessToken == null || refreshToken == null) {
    //   return null;
    // }
    // using my temporary token for the video
    final tempToken = dotenv.get('TEMP_TOKEN');
    return TokenData(
      accessToken: accessToken ?? tempToken,
      refreshToken: refreshToken ?? '',
    );
  }
}
