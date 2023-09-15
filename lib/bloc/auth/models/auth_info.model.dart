class AuthInfo {
  final String accessToken;
  final String refreshToken;

  AuthInfo({required this.accessToken, required this.refreshToken});

  factory AuthInfo.fromJson(Map<String, dynamic> map) => AuthInfo(
        accessToken: map['accessToken'],
        refreshToken: map['refreshToken'],
      );
}
