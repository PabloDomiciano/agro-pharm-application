import 'package:agropharm_application/App/Banco/Sqlite/Dao/usuario_dao.dart';
import 'package:agropharm_application/App/Dominio/Dto/usuario_dto.dart';
import 'package:agropharm_application/App/Dominio/Interface/usuario_idao.dart';
import 'package:agropharm_application/App/Dominio/usuario.dart';

class APPUsuario {
  late IDAOUsuario dao;
  late Usuario dominio;

  APPUsuario() {
    dao = DAOUsuario();
    dominio = Usuario(dao: dao);
  }

  Future<DTOUsuario> salvar(DTOUsuario dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOUsuario> consultarPorEmail(String email) async {
    return await dominio.consultarPorEmail(email);
  }
}
