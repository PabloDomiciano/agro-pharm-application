import 'package:agropharm_application/App/Dominio/Dto/usuario_dto.dart';
import 'package:agropharm_application/App/Dominio/Interface/usuario_idao.dart';

class Usuario {
  dynamic id;
  String? email;
  String? senha;

  IDAOUsuario dao;

  Usuario({required this.dao});

  Future<DTOUsuario> salvar(DTOUsuario dto) async {
    return await dao.salvar(dto);
  }

  Future<DTOUsuario> consultarPorEmail(String email) async {
    return await dao.consultarPorEmail(email);
  }
}
