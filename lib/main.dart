import 'package:agropharm_application/App/Widget/Views/Pages/Cadastro/cadasto_page.dart';
import 'package:agropharm_application/App/Widget/Views/Pages/Estoque/visualizar_estoque_page.dart';
import 'package:agropharm_application/App/Widget/Views/Pages/Historico/historico_page.dart';
import 'package:agropharm_application/App/Widget/Views/Pages/Home/home_page.dart';
import 'package:agropharm_application/App/Widget/Views/Pages/Login/login_page.dart';
import 'package:agropharm_application/App/Widget/Views/Pages/Notificacao/notificacao_page.dart';
import 'package:flutter/material.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const AgroPharmApp());
}

class AgroPharmApp extends StatelessWidget {
  const AgroPharmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'AgroPharm',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,

        // Definindo a tela de login como rota inicial
        initialRoute: '/login',

        routes: {
          '/': (context) => LoginPage(), // Rota padrão
          '/login': (context) => LoginPage(), // Tela de login
          '/homePage': (context) => const HomePage(), // Tela inicial após login
          '/cadastroMedicamento': (context) => const CadastroMedicamentoPage(),
          '/visualizarEstoque': (context) => const VisualizarEstoquePage(),
          '/historicoEntradas': (context) => const HistoricoEntradasPage(),
          '/notificacoes': (context) => const NotificacoesPage(),
        },
      );
}
