class Pessoa {
  String _nome;
  double _altura;
  double _peso;

  Pessoa(this._nome, this._altura, this._peso);

  double calculaIMC() {
    return _peso / (_altura * _altura);
  }

  void exibirInformacoes() {
    print("Nome: $_nome");
    print("Altura: $_altura");
    print("Peso: $_peso");
    double imc = calculaIMC();
    print("IMC: $imc");
  }

  String get nome => _nome;
  double get altura => _altura;
  double get peso => _peso;
}
