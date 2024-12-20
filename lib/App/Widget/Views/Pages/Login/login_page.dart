import 'package:agropharm_application/App/Aplicacao/usuario_ap.dart';
import 'package:agropharm_application/App/Widget/Views/Pages/Home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final _loginKey = GlobalKey<FormState>();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailControllador = TextEditingController();
  final _senhaControllador = TextEditingController();

  final aplicao_usuario = APPUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C6E49), // Cor de fundo moderna
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            decoration: BoxDecoration(
              color: Colors.white, // Card branco
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                const Icon(
                  Icons.medical_services_rounded,
                  size: 80,
                  color: Color(0xFF4E9F3D),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Bem-vindo ao AgroPharm",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C6E49),
                  ),
                ),
                const SizedBox(height: 24),

                // Input Email
                TextField(
                  controller: _emailControllador,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Input Password
                TextField(
                  controller: _senhaControllador,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Botão de Login
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final resultado = await aplicao_usuario
                            .consultarPorEmail(_emailControllador.text);

                        if (resultado.email != _emailControllador.text) {
                          throw Exception("e-mail não encontrado");
                        }

                        if (resultado.senha != _senhaControllador.text) {
                          throw Exception("senha não encontrada");
                        }

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${e}'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4E9F3D),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Esqueci a senha
                TextButton(
                  onPressed: () {
                    // Lógica futura de recuperação de senha
                  },
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                      color: Color(0xFF2C6E49),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
