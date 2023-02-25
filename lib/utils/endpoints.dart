class APIEndPoints {
  static const String baseURL = 'https://127.0.0.1:800/';
  static final _AuthEndPoints _authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String signUp = 'users/';
  final String signIn = 'users/';
}
