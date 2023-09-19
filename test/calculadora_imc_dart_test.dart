

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'package:calculadora_imc_dart/classes/pessoa.dart';
import 'package:calculadora_imc_dart/functions/functions.dart';

void main() {
  group('Calculadora IMC', () {
    test('Teste de cálculo de IMC', () {
      final pessoa = Pessoa('John Doe', 1.75, 70.0);
      final imc = pessoa.calculaIMC();

      expect(imc, closeTo(22.86, 0.01));
    });

    test('Teste de validação de nome', () {
      final nomeValido = 'John Doe';
      final nomeInvalido = '1234';

      expect(validaNome(nomeValido), isTrue);
      expect(validaNome(nomeInvalido), isFalse);
    });
    test('Teste de determinação de categoria do IMC', () {
      expect(determinaCategoriaIMC(17.0), 'Baixo peso');
      expect(determinaCategoriaIMC(20.0), 'Peso normal');
      expect(determinaCategoriaIMC(27.5), 'Sobrepeso');
      expect(determinaCategoriaIMC(32.0), 'Obesidade grau I');
      expect(determinaCategoriaIMC(38.0), 'Obesidade grau II');
      expect(determinaCategoriaIMC(42.0), 'Obesidade grau III');
    });
  });
}
