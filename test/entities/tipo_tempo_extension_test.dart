import 'package:calculadora_juros/entities/tipo_tempo_enum.dart';
import 'package:calculadora_juros/entities/tipo_tempo_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TipoJurosExtension:', () {
    test('deve converter TipoTempo.anual para a String "anual"', () {
      final extension = TipoTempoExtension();
      final result = extension.get(TipoTempoEnum.anual);
      expect(result, 'anual');
    });

    test('deve converter TipoTempo.mensal para a String "mensal"', () {
      final extension = TipoTempoExtension();
      final result = extension.get(TipoTempoEnum.mensal);
      expect(result, 'mensal');
    });
  });
}
