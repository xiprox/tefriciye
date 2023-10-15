import 'package:flutter/material.dart';
import 'package:tefriciye/exts/build_context_exts.dart';

class SwapButton extends StatelessWidget {
  final VoidCallback onPress;

  const SwapButton({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return IconButton(
      onPressed: onPress,
      icon: const Icon(Icons.swap_horiz_rounded),
      color: colors.secondary,
    );
  }
}
