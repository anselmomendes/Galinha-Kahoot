// Condicional para exibição do temporizador padrão ou o selecionado
import 'package:flutter/cupertino.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

Widget selectionText(Duration resultingDuration) {
  Duration v = Duration(minutes: 7200);

  if (resultingDuration.compareTo(v) == 0) {
    return Text(
        "Por padrão, a turma será desativada em ${resultingDuration.inDays} dias.");
  }
  return Text("Turma será desativada em ${resultingDuration.inMinutes} min.");
}

String selectiontextDetail(int duration) {
  if (duration == 7200) {
    return '5 dias';
  }
  return '$duration minutos';
}
