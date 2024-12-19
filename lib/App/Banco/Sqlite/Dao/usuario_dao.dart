import 'package:agropharm_application/App/Banco/Sqlite/conexao.dart';
import 'package:agropharm_application/App/Dominio/Dto/usuario_dto.dart';
import 'package:agropharm_application/App/Dominio/Interface/usuario_idao.dart';
import 'package:sqflite/sqflite.dart';

class DAOUsuario implements IDAOUsuario {
  late Database _db;

  final sqlInserirUsuario = '''
    INSERT INTO usuario (email, senha)
    VALUES (?, ?)
  ''';

  final sqlConsultarPorEmail = '''
    SELECT * FROM usuario WHERE email = ?;
  ''';

  @override
  Future<DTOUsuario> consultarPorEmail(String email) async {
    _db = await Conexao.iniciar();
    final resultado = (await _db.rawQuery(sqlConsultarPorEmail, [email])).first;

    DTOUsuario usuario = DTOUsuario(
      id: resultado['id'] as int,
      email: resultado['email'].toString(),
      senha: resultado['senha'].toString(),
    );

    return usuario;
  }

  @override
  Future<DTOUsuario> salvar(DTOUsuario dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserirUsuario, [dto.email, dto.senha]);
    dto.id = id;
    return dto;
  }
}
