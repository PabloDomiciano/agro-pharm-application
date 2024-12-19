import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AgroPharm - Gerenciamento de Medicamentos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2C6E49), // Verde escuro
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF0F4EF), // Fundo leve
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Bem-vindo ao Sistema de Medicamentos!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C6E49),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(12),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _buildCard(
                    icon: Icons.add,
                    label: 'Cadastrar Medicamentos',
                    color: const Color(0xFF4E9F3D),
                    onTap: () {
                      Navigator.of(context).pushNamed('/cadastroMedicamento');
                    },
                  ),
                  _buildCard(
                    icon: Icons.list,
                    label: 'Visualizar Estoque',
                    color: const Color(0xFF79B473),
                    onTap: () {
                      Navigator.of(context).pushNamed('/visualizarEstoque');
                    },
                  ),
                  _buildCard(
                    icon: Icons.history,
                    label: 'Histórico de Entradas',
                    color: const Color(0xFF2C6E49),
                    onTap: () {
                      Navigator.of(context).pushNamed('/historicoEntradas');
                    },
                  ),
                  _buildCard(
                    icon: Icons.notifications,
                    label: 'Notificações',
                    color: const Color(0xFF588157),
                    onTap: () {
                      Navigator.of(context).pushNamed('/notificacoes');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap, // Aqui você pode definir o comportamento futuro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
