import 'package:agropharm_application/App/Dominio/Dto/medicamento_dto.dart';
import 'package:agropharm_application/App/Dominio/Interface/medicamento_idao.dart';

class Medicamento {
  dynamic _id;
  String? _nome;
  int? _quantidade;
  DateTime? _validade;
  String? _fornecedor;
  IDAOMedicamento dao;

  Medicamento({required this.dao});

  validar({required DTOMedicamento dto}) {
    nome = dto.nome;
    quantidade = dto.quantidade;
    validade = dto.validade;
    fornecedor = dto.fornecedor;
  }

  Future<DTOMedicamento> salvar(DTOMedicamento dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOMedicamento> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(_id);
  }

  Future<bool> excluir(dynamic id) async {
    this.id = id;
    return true;
  }

  Future<List<DTOMedicamento>> consutlar() async {
    return await dao.consultar();
  }

  String? get nome => _nome;
  int? get quantidade => _quantidade;
  DateTime? get validade => _validade;
  String? get fornecedor => _fornecedor;

  set id(int? id) {
    if (id == null) throw Exception('ID não pode ser nulo');
    if (id < 0) throw Exception('ID não pode ser negativo');
    _id = id;
  }

  set nome(String? nome) {
    if (nome == null) throw Exception('Nome não pode ser nulo.');
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio.');
    _nome = nome;
  }

  set quantidade(int? quantidade) {
    if (quantidade == null) throw Exception('Nome não pode ser nulo.');
    _quantidade = quantidade;
  }

  set validade(DateTime? validade) {
    if (validade == null) throw Exception('Nome não pode ser nulo.');
    _validade = validade;
  }

  set fornecedor(String? fornecedor) {
    if (fornecedor == null) throw Exception('Nome não pode ser nulo.');
    if (fornecedor.isEmpty) throw Exception('Nome não pode ser vazio.');
    _fornecedor = fornecedor;
  }
}
