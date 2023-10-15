import 'package:flutter/material.dart';
import 'package:tefriciye/exts/build_context_exts.dart';
import 'package:tefriciye/exts/material_exts.dart';

class Controls extends StatelessWidget {
  final int count;
  final VoidCallback? onIncrementPress;
  final VoidCallback? onDecrementPress;
  final VoidCallback? onDeletePress;

  const Controls({
    super.key,
    required this.count,
    required this.onIncrementPress,
    required this.onDecrementPress,
    required this.onDeletePress,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final iconColor = colors.secondary;

    return Material(
      color: colors.surfaceTone1,
      child: InkWell(
        onTap: onIncrementPress,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onDeletePress,
                  icon: const Icon(Icons.delete_outline_rounded),
                  color: iconColor,
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: onDecrementPress,
                  icon: const Icon(Icons.remove_circle_outline_rounded),
                  color: iconColor,
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: onIncrementPress,
                  icon: const Icon(Icons.add_circle_outline_rounded),
                  color: iconColor,
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 80,
                    color: colors.primary.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}
