import 'licenses/smooth_rectangle_border_license.dart';

abstract class Licenses {
  static init() {
    SmoothRectangleBorderLicense.addToRegistry();
  }
}
