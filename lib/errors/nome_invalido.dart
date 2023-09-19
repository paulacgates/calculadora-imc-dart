class InformacaoInvalida extends Error {
  final String mensagem;

  InformacaoInvalida(this.mensagem);

  @override
  String toString() {
    return 'InformacaoInvalida: $mensagem';
  }
}
