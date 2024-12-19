class DTOMedicamento {
  dynamic id;
  final String? nome;
  final int? quantidade;
  final DateTime? validade;
  final String? fornecedor;

  DTOMedicamento(
      {this.id,
      required this.nome,
      required this.quantidade,
      required this.validade,
      required this.fornecedor});
}
