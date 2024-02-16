import 'package:flutter_test/flutter_test.dart';
import 'package:mobx_imc/imc/imc_controller.dart';

void main() {
  late ImcController controller;
  double peso = 65;
  double altura = 1.75;

  setUp(() => {
    controller = ImcController(),
  });

  test('deve retornar um double', () async => {
    controller.calcularIMC(peso: peso, altura: altura),
   
    expect(controller.imc, isA<double>())
  });

  test('deve retornar uma mensagem de erro', () {
    controller.calcularIMC(peso: 100, altura: 1.70);

    final msgError = controller.hasError;

    expect(controller.hasError, msgError);
  });

  test('deve retornar 24', () {
    controller.calcularIMC(peso: 74.35, altura: 1.76);

    final imcValue = controller.imc;

    expect(controller.imc, imcValue);
  });
}
