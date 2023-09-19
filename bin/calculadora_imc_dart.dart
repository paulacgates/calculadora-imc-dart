import 'dart:io';

import 'package:calculadora_imc_dart/classes/pessoa.dart';
import 'package:calculadora_imc_dart/functions/functions.dart';

void main() {
  print("Bem vindo à Calculadora de IMC!");

  bool continuar = true;

  while (continuar) {
    try {
      String nome = obtemNome();
      double altura = obtemAltura();
      double peso = obtemPeso();

      Pessoa pessoa = Pessoa(nome, altura, peso);
      double imc = pessoa.calculaIMC();
      String categoriaIMC = determinaCategoriaIMC(imc);
      exibeInformacoesPessoa(pessoa, imc, categoriaIMC);
    } catch (e) {
      print("Ocorreu um erro: $e");
    }

    print(
        "Deseja calcular novamente? (S para sim, qualquer outra tecla para sair)");
    String resposta = stdin.readLineSync()?.toUpperCase() ?? '';

    if (resposta != 'S') {
      continuar = false;
    }
  }
}
