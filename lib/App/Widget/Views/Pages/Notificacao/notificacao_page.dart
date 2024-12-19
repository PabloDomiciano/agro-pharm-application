import 'package:flutter/material.dart';

class NotificacoesPage extends StatelessWidget {
  const NotificacoesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notificações',
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
            _buildNotificacaoItem('Medicamento A quase vencendo', '2024-12-01'),
            _buildNotificacaoItem(
                'Medicamento B em estoque baixo', '2024-12-02'),
            _buildNotificacaoItem(
                'Medicamento C adicionado ao estoque', '2024-12-03'),
            _buildNotificacaoItem(
                'Medicamento D próximo da data de validade', '2024-12-04'),
            _buildNotificacaoItem('Medicamento E vencido', '2024-12-05'),
          ],
        ),
      ),
    );
  }

  // Widget para um item de notificação
  Widget _buildNotificacaoItem(String mensagem, String data) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.notifications,
          color: Color(0xFF4E9F3D), // Ícone verde
          size: 36,
        ),
        title: Text(
          mensagem,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C6E49),
          ),
        ),
        subtitle: Text(
          'Data: $data',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
