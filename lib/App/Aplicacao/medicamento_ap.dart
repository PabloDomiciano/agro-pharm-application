import 'package:agropharm_application/App/Banco/Sqlite/Dao/medicamento_dao.dart';
import 'package:agropharm_application/App/Dominio/Dto/medicamento_dto.dart';
import 'package:agropharm_application/App/Dominio/Interface/medicamento_idao.dart';
import 'package:agropharm_application/App/Dominio/medicamento.dart';

class APPMedicamento {
  late IDAOMedicamento dao;
  late Medicamento dominio;

  APPMedicamento() {
    dao = DAOMedicamento();
    dominio = Medicamento(dao: dao);
  }

  Future<DTOMedicamento> salvar(DTOMedicamento dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOMedicamento> alterar(dynamic id) async {
    return await dominio.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await dominio.alterar(id);
    return true;
  }

  Future<List<DTOMedicamento>> consultar() async {
    return await dominio.consutlar();
  }
}
