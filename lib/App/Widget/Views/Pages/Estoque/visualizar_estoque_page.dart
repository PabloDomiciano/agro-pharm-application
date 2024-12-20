import 'package:agropharm_application/App/Aplicacao/medicamento_ap.dart';
import 'package:agropharm_application/App/Aplicacao/usuario_ap.dart';
import 'package:agropharm_application/App/Banco/Sqlite/Dao/medicamento_dao.dart';
import 'package:agropharm_application/App/Dominio/Dto/medicamento_dto.dart';
import 'package:flutter/material.dart';

class VisualizarEstoquePage extends StatelessWidget {
  final appMedicamento = APPMedicamento();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estoque de Medicamentos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C6E49),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF0F4EF),
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<List<DTOMedicamento>>(
          future:
              appMedicamento.consultar(), // Chama a consulta ao banco de dados
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child:
                      CircularProgressIndicator()); // Exibe um carregamento enquanto os dados estão sendo buscados
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                      'Erro: ${snapshot.error}')); // Exibe um erro caso algo dê errado
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
                      'Nenhum medicamento encontrado')); // Exibe mensagem caso não tenha dados
            } else {
              final listaMedicamentos = snapshot.data!;
              return ListView.builder(
                itemCount: listaMedicamentos.length,
                itemBuilder: (context, index) {
                  final medicamento = listaMedicamentos[index];
                  return _buildEstoqueItem(
                      dto: medicamento); // Exibe o item da lista
                },
              );
            }
          },
        ),
      ),
    );
  }

  // Widget para um item de estoque com botões de Editar e Excluir
  Widget _buildEstoqueItem({required DTOMedicamento dto}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.medication,
          color: Color(0xFF4E9F3D),
          size: 36,
        ),
        title: Text(
          dto.nome,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C6E49),
          ),
        ),
        subtitle: Text(
          'Quantidade: ${dto.quantidade} \nData de validade: ${dto.validade}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.orange),
              onPressed: () {
                // Ação de editar - Redirecionar para tela de edição (em breve)
                print('Editar:');
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
               // appMedicamento.excluir(int.parse(dto.id));
              },
            ),
          ],
        ),
      ),
    );
  }
}
