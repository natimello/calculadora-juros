import 'package:calculadora_juros/entities/tipo_tempo_enum.dart';

class TipoTempoExtension {
  String get(TipoTempoEnum tipo) {
    switch (tipo) {
      case TipoTempoEnum.mensal:
        return "mensal";
      case TipoTempoEnum.anual:
        return "anual";
    }
  }
}
