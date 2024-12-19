import 'package:flutter/material.dart';

class VisualizarEstoquePage extends StatelessWidget {
  const VisualizarEstoquePage({Key? key}) : super(key: key);

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
        child: ListView(
          children: [
            _buildEstoqueItem('Medicamento A', 'Em estoque: 50 unidades', '2024-12-01'),
            _buildEstoqueItem('Medicamento B', 'Em estoque: 30 unidades', '2024-12-02'),
            _buildEstoqueItem('Medicamento C', 'Em estoque: 100 unidades', '2024-12-03'),
            _buildEstoqueItem('Medicamento D', 'Em estoque: 20 unidades', '2024-12-04'),
            _buildEstoqueItem('Medicamento E', 'Em estoque: 10 unidades', '2024-12-05'),
          ],
        ),
      ),
    );
  }

  // Widget para um item de estoque com botões de Editar e Excluir
  Widget _buildEstoqueItem(String nome, String descricao, String data) {
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
          nome,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C6E49),
          ),
        ),
        subtitle: Text(
          '$descricao\nData de cadastro: $data',
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
                print('Editar: $nome');
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Ação de excluir - Excluir item (em breve)
                print('Excluir: $nome');
              },
            ),
          ],
        ),
      ),
    );
  }
}
