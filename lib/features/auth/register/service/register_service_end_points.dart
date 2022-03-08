// ignore_for_file: constant_identifier_names

enum RegisterServiceEndPoints { REGISTER }

extension RegisterServiceExtension on RegisterServiceEndPoints {
  String get rawValue {
    switch (this) {
      case RegisterServiceEndPoints.REGISTER:
        return '/user';
    }
  }
}