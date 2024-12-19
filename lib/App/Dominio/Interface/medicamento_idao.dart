import 'package:agropharm_application/App/Dominio/Dto/medicamento_dto.dart';

abstract class IDAOMedicamento {
  Future<DTOMedicamento> salvar(DTOMedicamento dto);
  Future<DTOMedicamento> alterar(DTOMedicamento dto);
  Future<DTOMedicamento> consultarPorId(int id);
  Future<List<DTOMedicamento>> consultar();
}
