import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'content/controls.dart';
import 'content/prayer/prayer.dart';
import 'content/swap_button.dart';
import 'state/counter_notifier.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counterStateProvider);
    final notifier = ref.read(counterStateProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Prayer(
                  viewType: state.viewType,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SwapButton(onPress: notifier.onSwapViewPress),
          const SizedBox(height: 8),
          Expanded(
            child: Controls(
              count: state.count,
              onIncrementPress: notifier.shouldDisableIncrement()
                  ? null
                  : notifier.onIncrementPress,
              onDecrementPress: notifier.shouldDisableDecrement()
                  ? null
                  : notifier.onDecrementPress,
              onDeletePress: notifier.shouldDisableDelete()
                  ? null
                  : notifier.onDeletePress,
            ),
          ),
        ],
      ),
    );
  }
}
