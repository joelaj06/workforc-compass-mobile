class _AssetSVGs {
  _AssetSVGs._();
  static String login = 'assets/svgs/login.svg';
  static String logo = 'assets/svgs/logo.svg';
}

enum AssetSVGs { login, logo }

extension X on AssetSVGs {
  String get path {
    switch (this) {
      case AssetSVGs.login:
        return _AssetSVGs.login;
      case AssetSVGs.logo:
        return _AssetSVGs.logo;
    }
  }
}
