// ignore_for_file: constant_identifier_names

enum LoginServiceEndPoints { LOGIN }

extension LoginServiceExtension on LoginServiceEndPoints {
  String get rawValue {
    switch (this) {
      case LoginServiceEndPoints.LOGIN:
        return '/user/loginByEmail';
    }
  }
}