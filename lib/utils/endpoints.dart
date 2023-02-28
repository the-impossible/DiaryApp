class APIEndPoints {
  static const String baseURL = 'http://192.168.43.193:8000/';
  static final AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String signUp = 'users/register/';
  final String signIn = 'auth/login/';
  final String profile = 'users/user/';
}
