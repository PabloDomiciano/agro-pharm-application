import 'package:agropharm_application/App/Dominio/Dto/usuario_dto.dart';

abstract class IDAOUsuario {
  Future<DTOUsuario> salvar(DTOUsuario dto);
  Future<DTOUsuario> consultarPorEmail(String email);
}
