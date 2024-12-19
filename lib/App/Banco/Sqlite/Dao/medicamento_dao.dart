import 'package:agropharm_application/App/Banco/Sqlite/conexao.dart';
import 'package:agropharm_application/App/Dominio/Dto/medicamento_dto.dart';
import 'package:agropharm_application/App/Dominio/Interface/medicamento_idao.dart';
import 'package:sqflite/sqflite.dart';

class DAOMedicamento implements IDAOMedicamento {
  late Database _db;

  final sqlInserir = '''
    INSERT INTO medicamento (nome, quantidade, validade, fornecedor)
    VALUES (?, ?, ?, ?)
  ''';

  final sqlAlterar = '''
    UPDATE medicamento SET nome=?, quantidade=?, validade=?, fornecedor=?
    WHERE id = ?
  ''';

  final sqlConsultarPorId = '''
    SELECT * FROM medicamento WHERE id = ?;
  ''';

  final sqlConsultar = '''
    SELECT * FROM medicamento;
  ''';

  @override
  Future<DTOMedicamento> salvar(DTOMedicamento dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(
        sqlInserir, [dto.nome, dto.quantidade, dto.validade, dto.fornecedor]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOMedicamento> alterar(DTOMedicamento dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.nome, dto.quantidade, dto.validade, dto.fornecedor, dto.id]);
    return dto;
  }

  @override
  Future<DTOMedicamento> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;

    DTOMedicamento medicamento = DTOMedicamento(
      id: resultado['id'] as int,
      nome: resultado['nome'].toString(),
      quantidade: resultado['quantidade'] as int,
      validade: DateTime.parse(resultado['validade'].toString()),
      fornecedor: resultado['fornecedor']?.toString(),
    );

    return medicamento;
  }

  @override
  Future<List<DTOMedicamento>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);

    List<DTOMedicamento> medicamentos = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOMedicamento(
        id: linha['id'] as int,
        nome: linha['nome'].toString(),
        quantidade: linha['quantidade'] as int,
        validade: DateTime.parse(linha['validade'].toString()),
        fornecedor: linha['fornecedor']?.toString(),
      );
    });

    return medicamentos;
  }
}
