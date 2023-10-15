import 'package:flutter/material.dart';
import 'package:tefriciye/exts/build_context_exts.dart';
import 'package:tefriciye/exts/material_exts.dart';

import 'card.dart';

const _kReading =
    'Allâhümme salli salâten kâmileten ve sellim selâmen tâmmen alâ seyyidinâ '
    'Muhammedinillezi tenhallü bihil’ükadü, ve tenfericü bihil’kürabü, ve '
    'tükdâ bihil’havâicü, ve tünâlü bihir’regâibü, ve hüsnül’havâtimi, ve '
    'yüsteskal’ğamâmü bivechihil’ kerimi, ve alâ âlihi ve sahbihî fi külli '
    'lemhatin ve nefesin biaded-i külli mâ’lûmin lek.';

class Reading extends StatelessWidget {
  const Reading({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final cardColor = colors.surfaceTone1;
    return PrayerCard(
      color: cardColor,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(_kReading),
      ),
    );
  }
}
