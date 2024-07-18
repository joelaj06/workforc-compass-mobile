class AuthEndpoints {
  static const String signin = 'users/login';
  static const String signOut = 'users/auth/logout';
  static String user(String userId) => 'users/$userId';
  static const String signup = 'users/auth/signup';
}
