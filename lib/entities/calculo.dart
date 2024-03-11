import 'package:calculadora_juros/entities/resultado_calculo.dart';

class Calculo {
  final String tipoJuros;
  final double capital;
  final double taxaDeJuros;
  final int tempo;
  final ResultadoCalculo resultado;

  Calculo({
    required this.tipoJuros,
    required this.capital,
    required this.taxaDeJuros,
    required this.tempo,
    required this.resultado,
  });
}
