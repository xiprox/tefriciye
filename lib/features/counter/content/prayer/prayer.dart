import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'arabic.dart';
import 'reading.dart';

enum PrayerViewType {
  arabic,
  reading,
}

class Prayer extends ConsumerWidget {
  final PrayerViewType viewType;

  const Prayer({
    super.key,
    required this.viewType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn.flipped,
      child:
          viewType == PrayerViewType.arabic ? const Arabic() : const Reading(),
    );
  }
}
