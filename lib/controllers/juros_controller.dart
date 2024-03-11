import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:calculadora_juros/entities/calculo.dart';
import 'package:calculadora_juros/entities/juros_input.dart';
import 'package:calculadora_juros/entities/resultado_calculo.dart';
import 'package:calculadora_juros/entities/tipo_juros_enum.dart';
import 'package:calculadora_juros/entities/tipo_tempo_enum.dart';
import 'package:calculadora_juros/states/juros_state.dart';

class JurosController extends Cubit<JurosState> {
  JurosController(super.initialState);

  List<Calculo> historicoCalculos = [];

  void calcularJurosSimples(JurosInput jurosInput) {
    if (jurosInput.capital > 0 &&
        jurosInput.taxaDeJuros > 0 &&
        jurosInput.tempo > 0) {
      double taxa = (state.tipoTempo == TipoTempoEnum.mensal)
          ? jurosInput.taxaDeJuros / 100 / 12
          : jurosInput.taxaDeJuros / 100;
      double tempo = (state.tipoTempo == TipoTempoEnum.anual)
          ? jurosInput.tempo.toDouble()
          : jurosInput.tempo * 12;
      double juros = jurosInput.capital * taxa * tempo;
      double montante = juros + jurosInput.capital;
      ResultadoCalculo resultado = ResultadoCalculo(juros, montante);

      adicionarCalculo(Calculo(
          tipoJuros: TipoJurosEnum.jurosSimples.toString(),
          capital: jurosInput.capital,
          taxaDeJuros: jurosInput.taxaDeJuros,
          tempo: jurosInput.tempo,
          resultado: resultado));
      emit(state.copyWith(
          resultadoCalculo: resultado, jurosStatus: JurosStatus.success));
    } else {
      emit(state.copyWith(
          jurosStatus: JurosStatus.failure,
          errorMessage: 'Não foi possível calcular.'));
    }
  }

  void calcularJurosCompostos(JurosInput jurosInput) {
    if (jurosInput.capital > 0 &&
        jurosInput.taxaDeJuros > 0 &&
        jurosInput.tempo > 0) {
      double taxa = (state.tipoTempo == TipoTempoEnum.mensal)
          ? jurosInput.taxaDeJuros / 100 / 12
          : jurosInput.taxaDeJuros / 100;
      double tempo = (state.tipoTempo == TipoTempoEnum.anual)
          ? jurosInput.tempo.toDouble()
          : jurosInput.tempo * 12;
      double montante = jurosInput.capital * pow(1 + taxa, tempo);
      double juros = montante - jurosInput.capital;
      ResultadoCalculo resultado = ResultadoCalculo(juros, montante);

      adicionarCalculo(Calculo(
          tipoJuros: TipoJurosEnum.jurosCompostos.toString(),
          capital: jurosInput.capital,
          taxaDeJuros: jurosInput.taxaDeJuros,
          tempo: jurosInput.tempo,
          resultado: resultado));
      emit(state.copyWith(
          resultadoCalculo: resultado, jurosStatus: JurosStatus.success));
    } else {
      emit(state.copyWith(
          jurosStatus: JurosStatus.failure,
          errorMessage: 'Não foi possível calcular.'));
    }
  }

  void adicionarCalculo(Calculo calculo) {
    historicoCalculos.add(calculo);
    emit(state.copyWith(historicoCalculos: historicoCalculos));
  }

  void atualizarTipoJuros(TipoJurosEnum tipoJuros) {
    emit(state.copyWith(tipoJuros: tipoJuros));
  }

  void atualizarTipoTempo(TipoTempoEnum tipoTempo) {
    emit(state.copyWith(tipoTempo: tipoTempo));
  }
}
