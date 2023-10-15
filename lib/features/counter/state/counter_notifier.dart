import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tefriciye/features/counter/content/prayer/prayer.dart';

import 'counter_state.dart';

final counterStateProvider =
    NotifierProvider<CounterStateNotifier, CounterState>(
  () => CounterStateNotifier(),
);

class CounterStateNotifier extends Notifier<CounterState> {
  @override
  CounterState build() {
    return const CounterState(
      count: 0,
      preDeleteCount: 0,
      viewType: PrayerViewType.arabic,
    );
  }

  void onSwapViewPress() {
    state = state.copyWith(
      viewType: state.viewType == PrayerViewType.arabic
          ? PrayerViewType.reading
          : PrayerViewType.arabic,
    );
  }

  bool shouldDisableDelete() => state.count == 0;

  bool shouldDisableIncrement() => false;

  bool shouldDisableDecrement() => state.count == 0;

  void onIncrementPress() {
    state = state.copyWith(count: state.count + 1);
  }

  void onDecrementPress() {
    state = state.copyWith(count: max(0, state.count - 1));
  }

  void onDeletePress() {
    state = state.copyWith(count: 0, preDeleteCount: state.count);
    // TODO: Snackbar to undo delete.
  }

  void onUndoDeletePress() {
    state = state.copyWith(count: state.preDeleteCount, preDeleteCount: 0);
  }
}
