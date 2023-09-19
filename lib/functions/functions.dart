import 'dart:io';

import 'package:calculadora_imc_dart/classes/pessoa.dart';
import 'package:calculadora_imc_dart/errors/nome_invalido.dart';


String obtemNome() {
  print("Digite seu nome:");
  String nome = stdin.readLineSync() ?? '';

  if (!validaNome(nome)) {
    throw InformacaoInvalida(
        'Nome inválido. O nome deve conter apenas letras e espaços');
  }

  return nome;
}

double obtemAltura() {
  print("Digite sua altura em metros (ex: 1.75):");
  double altura = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

  if (altura == 0.0) {
    throw InformacaoInvalida('Altura inválida.');
  }

  return altura;
}

double obtemPeso() {
  print("Digite seu peso em quilogramas:");
  double peso = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

  if (peso == 0.0) {
    throw InformacaoInvalida('Peso inválido.');
  }

  return peso;
}

bool validaNome(String nome) {
  final RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
  return regex.hasMatch(nome);
}

String determinaCategoriaIMC(double imc) {
  final categorias = {
    if (imc < 18.5) 'Baixo peso',
    if (imc >= 18.5 && imc < 25) 'Peso normal',
    if (imc >= 25 && imc < 30) 'Sobrepeso',
    if (imc >= 30 && imc < 35) 'Obesidade grau I',
    if (imc >= 35 && imc < 40) 'Obesidade grau II',
    if (imc >= 40) 'Obesidade grau III',
  };

  return categorias.isNotEmpty ? categorias.first : 'Categoria desconhecida';
}

void exibeInformacoesPessoa(Pessoa pessoa, double imc, String categoriaIMC) {
  print("Nome: ${pessoa.nome}");
  print("Altura: ${pessoa.altura} m");
  print("Peso: ${pessoa.peso} kg");
  print("IMC: $imc");
  print("Categoria IMC: $categoriaIMC");
}
