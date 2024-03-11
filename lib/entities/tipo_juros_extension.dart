import 'package:calculadora_juros/entities/tipo_juros_enum.dart';

class TipoJurosExtension {
  String get(TipoJurosEnum tipoJuros) {
    switch (tipoJuros) {
      case TipoJurosEnum.jurosSimples:
        return "jurosSimples";
      case TipoJurosEnum.jurosCompostos:
        return "jurosCompostos";
    }
  }
}
