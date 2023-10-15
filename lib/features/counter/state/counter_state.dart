import 'package:tefriciye/features/counter/content/prayer/prayer.dart';

class CounterState {
  final int count;

  /// The count before the user pressed delete.
  final int preDeleteCount;

  final PrayerViewType viewType;

  const CounterState({
    required this.count,
    required this.preDeleteCount,
    required this.viewType,
  });

  CounterState copyWith({
    int? count,
    int? preDeleteCount,
    PrayerViewType? viewType,
  }) {
    return CounterState(
      count: count ?? this.count,
      preDeleteCount: preDeleteCount ?? this.preDeleteCount,
      viewType: viewType ?? this.viewType,
    );
  }
}
