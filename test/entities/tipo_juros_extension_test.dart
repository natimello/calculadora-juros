import 'package:calculadora_juros/entities/tipo_juros_enum.dart';
import 'package:calculadora_juros/entities/tipo_juros_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TipoJurosExtension:', () {
    test(
        'deve converter TipoJurosEnum.jurosSimples para a String "jurosSimples"',
        () {
      final extension = TipoJurosExtension();
      final result = extension.get(TipoJurosEnum.jurosSimples);
      expect(result, 'jurosSimples');
    });

    test(
        'deve converter TipoJurosEnum.jurosCompostos para a String "jurosCompostos"',
        () {
      final extension = TipoJurosExtension();
      final result = extension.get(TipoJurosEnum.jurosCompostos);
      expect(result, 'jurosCompostos');
    });
  });
}
