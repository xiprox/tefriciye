import 'package:flutter/material.dart';
import 'package:tefriciye/widgets/painting/smooth_rectangle_border/smooth_rectangle_border.dart';

class PrayerCard extends StatelessWidget {
  final Color color;
  final Widget child;

  const PrayerCard({
    super.key,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    const shape = SmoothRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );
    return Material(shape: shape, color: color, child: child);
  }
}
