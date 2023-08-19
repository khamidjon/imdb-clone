import 'package:equatable/equatable.dart';

class TokenData with EquatableMixin {
  const TokenData({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;

  @override
  List<Object> get props => [
        accessToken,
        refreshToken,
      ];
}
