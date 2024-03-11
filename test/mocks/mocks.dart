import 'package:calculadora_juros/controllers/juros_controller.dart';
import 'package:calculadora_juros/entities/juros_input.dart';
import 'package:calculadora_juros/states/juros_state.dart';
import 'package:mockito/mockito.dart';

// ignore: must_be_immutable
class JurosStateMock extends Mock implements JurosState {}

class JurosControllerMock extends Mock implements JurosController {}

class JurosInputMock extends Mock implements JurosInput {}
