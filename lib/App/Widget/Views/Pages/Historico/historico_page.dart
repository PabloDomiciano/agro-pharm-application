import 'package:flutter/material.dart';

class HistoricoEntradasPage extends StatelessWidget {
  const HistoricoEntradasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Histórico de Entradas',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C6E49), // Verde escuro
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF0F4EF), // Fundo claro
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            _buildHistoricoItem('Remédio A', 10, '2024-09-01'),
            _buildHistoricoItem('Remédio B', 20, '2024-09-02'),
            _buildHistoricoItem('Remédio C', 15, '2024-09-03'),
            _buildHistoricoItem('Remédio D', 30, '2024-09-04'),
            _buildHistoricoItem('Remédio E', 25, '2024-09-05'),
          ],
        ),
      ),
    );
  }

  // Widget para um item do histórico
  Widget _buildHistoricoItem(String nome, int quantidade, String data) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.history,
          color: Color(0xFF4E9F3D), // Ícone verde
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
          'Quantidade: $quantidade | Data: $data',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
