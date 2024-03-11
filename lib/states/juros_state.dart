import 'package:calculadora_juros/entities/calculo.dart';
import 'package:calculadora_juros/entities/resultado_calculo.dart';
import 'package:calculadora_juros/entities/tipo_juros_enum.dart';
import 'package:calculadora_juros/entities/tipo_tempo_enum.dart';
import 'package:equatable/equatable.dart';

enum JurosStatus {
  initial,
  loading,
  success,
  failure,
}

class JurosState extends Equatable {
  final JurosStatus jurosStatus;
  final TipoJurosEnum? tipoJuros;
  final TipoTempoEnum? tipoTempo;
  final String? errorMessage;
  final ResultadoCalculo? resultadoCalculo;
  final List<Calculo>? historicoCalculos;

  JurosState({
    required this.jurosStatus,
    this.tipoJuros,
    this.tipoTempo,
    this.errorMessage,
    this.resultadoCalculo,
    this.historicoCalculos,
  });

  const JurosState._({
    required this.jurosStatus,
    this.tipoJuros,
    this.tipoTempo,
    this.errorMessage,
    this.resultadoCalculo,
    this.historicoCalculos,
  });

  JurosState.initial() : this._(jurosStatus: JurosStatus.initial);

  @override
  List<Object?> get props => [
        jurosStatus,
        tipoJuros,
        tipoTempo,
        errorMessage,
        resultadoCalculo,
        historicoCalculos,
      ];

  JurosState copyWith({
    JurosStatus? jurosStatus,
    TipoJurosEnum? tipoJuros,
    TipoTempoEnum? tipoTempo,
    String? errorMessage,
    ResultadoCalculo? resultadoCalculo,
    List<Calculo>? historicoCalculos,
  }) {
    return JurosState._(
      jurosStatus: jurosStatus ?? this.jurosStatus,
      tipoJuros: tipoJuros ?? this.tipoJuros,
      tipoTempo: tipoTempo ?? this.tipoTempo,
      errorMessage: errorMessage ?? this.errorMessage,
      resultadoCalculo: resultadoCalculo ?? this.resultadoCalculo,
      historicoCalculos: historicoCalculos ?? this.historicoCalculos,
    );
  }
}
