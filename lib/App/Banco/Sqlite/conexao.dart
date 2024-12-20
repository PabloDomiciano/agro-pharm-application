import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _database;

  static Future<Database> iniciar() async {
    if (_database != null) return _database!;

    // Caminho do banco de dados
    final path = join(await getDatabasesPath(), 'pharm.db');

    // Abrindo o banco de dados
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Criação das tabelas
        final tabelas = [
          '''CREATE TABLE medicamento(
            id INTEGER NOT NULL PRIMARY KEY,
            nome VARCHAR(200) NOT NULL,
            quantidade INTEGER NOT NULL,
            validade DATE NOT NULL,
            fornecedor VARCHAR(200)
          );''', // Remover a vírgula extra aqui
          '''CREATE TABLE usuario(
            id INTEGER NOT NULL PRIMARY KEY,
            email VARCHAR(200) NOT NULL,
            senha VARCHAR(200) NOT NULL
          );''', // Remover a vírgula extra aqui
        ];

        for (var tabela in tabelas) {
          await db.execute(tabela);
        }

        // Inserção de registros iniciais
        await db.execute('''
          INSERT INTO medicamento (nome, quantidade, validade, fornecedor)
          VALUES ('Paracetamol', 100, '2025-01-01', 'Farmácia Central');
        ''');

        await db.execute('''
          INSERT INTO medicamento (nome, quantidade, validade, fornecedor)
          VALUES ('Ibuprofeno', 50, '2024-12-01', 'Distribuidora Saúde');
        ''');

        await db.execute('''
          INSERT INTO medicamento (nome, quantidade, validade, fornecedor)
          VALUES ('Amoxicilina', 200, '2025-06-15', 'Laboratório Farma');
        ''');

        await db.execute('''
          INSERT INTO usuario (email, senha) 
          VALUES('teste@gmail.com', '123');
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Lógica de migração caso a versão do banco seja alterada
      },
    );

    return _database!;
  }
}
