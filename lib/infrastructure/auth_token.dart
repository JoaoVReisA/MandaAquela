class AuthToken {
  AuthToken._();

  static final AuthToken instance = AuthToken._();

  String _token = '';
  String get token => _token;
  String setToken(String value) => _token = value;
}
