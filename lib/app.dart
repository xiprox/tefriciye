import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tefriciye/theme/theme.dart';

import 'features/counter/counter_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Tefriciye',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: const CounterPage(),
      ),
    );
  }
}
