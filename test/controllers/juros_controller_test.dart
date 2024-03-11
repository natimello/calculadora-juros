import 'package:calculadora_juros/entities/calculo.dart';
import 'package:calculadora_juros/entities/resultado_calculo.dart';
import 'package:calculadora_juros/entities/tipo_juros_enum.dart';
import 'package:calculadora_juros/entities/tipo_tempo_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_juros/entities/juros_input.dart';
import 'package:calculadora_juros/states/juros_state.dart';
import 'package:calculadora_juros/controllers/juros_controller.dart';

void main() {
  group('JurosController:', () {
    test(
        'calcularJurosSimples deve retornar 240.00 reais de juros e 440.00 de montante',
        () {
      final controller = JurosController(JurosState(
        jurosStatus: JurosStatus.initial,
        tipoTempo: TipoTempoEnum.mensal,
      ));
      final jurosInput =
          JurosInput(capital: 200.00, taxaDeJuros: 15.00, tempo: 8);

      controller.calcularJurosSimples(jurosInput);

      expect(controller.state.resultadoCalculo!.resultadoJuros, equals(240.00));
      expect(
          controller.state.resultadoCalculo!.resultadoMontante, equals(440.00));
    });

    test(
        'calcularJurosSimples deve retornar status de falha e mensagem de erro quando um valor inválido for inserido',
        () {
      final controller = JurosController(JurosState(
          jurosStatus: JurosStatus.initial, tipoTempo: TipoTempoEnum.anual));
      final jurosInput = JurosInput(capital: 200.00, taxaDeJuros: 0, tempo: 8);

      controller.calcularJurosSimples(jurosInput);

      expect(controller.state.jurosStatus, equals(JurosStatus.failure));
      expect(
          controller.state.errorMessage, equals('Não foi possível calcular.'));
    });

    test(
        'calcularJurosCompostos deve retornar 244.32 reais de juros e 1.794.32 reais de montante',
        () {
      final controller = JurosController(JurosState(
          jurosStatus: JurosStatus.initial, tipoTempo: TipoTempoEnum.anual));
      final jurosInput =
          JurosInput(capital: 1550.00, taxaDeJuros: 5.00, tempo: 3);

      controller.calcularJurosCompostos(jurosInput);

      final jurosEsperado =
          controller.state.resultadoCalculo!.resultadoJuros!.toStringAsFixed(2);
      final montanteEsperado = controller
          .state.resultadoCalculo!.resultadoMontante!
          .toStringAsFixed(2);

      expect(double.parse(jurosEsperado), equals(244.32));
      expect(double.parse(montanteEsperado), equals(1794.32));
    });

    test(
        'calcularJurosCompostos deve retornar status de falha e mensagem de erro quando um valor inválido for inserido',
        () {
      final controller = JurosController(JurosState(
          jurosStatus: JurosStatus.initial, tipoTempo: TipoTempoEnum.mensal));
      final jurosInput =
          JurosInput(capital: -200.00, taxaDeJuros: 5.00, tempo: 8);

      controller.calcularJurosCompostos(jurosInput);

      expect(controller.state.jurosStatus, equals(JurosStatus.failure));
      expect(
          controller.state.errorMessage, equals('Não foi possível calcular.'));
    });

    test('adicionarCalculo deve adicionar calculo à lista', () {
      final controller =
          JurosController(JurosState(jurosStatus: JurosStatus.initial));

      controller.adicionarCalculo(Calculo(
          tipoJuros: TipoJurosEnum.jurosSimples.toString(),
          capital: 2500.00,
          taxaDeJuros: 5.00,
          tempo: 6,
          resultado: ResultadoCalculo(3400.00, 7890.00)));

      expect(controller.state.historicoCalculos!.length, 1);
    });

    test('atualizarTipoJuros deve atualizar o estado de tipoJuros', () {
      final controller = JurosController(JurosState(
          jurosStatus: JurosStatus.initial,
          tipoJuros: TipoJurosEnum.jurosSimples));

      controller.atualizarTipoJuros(TipoJurosEnum.jurosCompostos);

      expect(controller.state.tipoJuros, equals(TipoJurosEnum.jurosCompostos));
    });

    test('atualizarTipoTempo deve atualizar o estado de tipoTempo', () {
      final controller = JurosController(JurosState(
          jurosStatus: JurosStatus.initial, tipoTempo: TipoTempoEnum.anual));

      controller.atualizarTipoTempo(TipoTempoEnum.mensal);

      expect(controller.state.tipoTempo, equals(TipoTempoEnum.mensal));
    });
  });
}
