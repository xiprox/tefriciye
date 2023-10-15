import 'package:flutter/material.dart';

import 'app.dart';
import 'features/licenses/licenses.dart';

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  Licenses.init();
  return runApp(const App());
}
