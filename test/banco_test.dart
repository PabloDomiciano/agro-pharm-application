import 'package:agropharm_application/App/Banco/Sqlite/conexao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() {
  late Database db;
  setUpAll(() async {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
    db = await Conexao.iniciar();
  });
  test('test script create table', () async {
    var list = await db.rawQuery('SELECT * FROM medicamento');
    expect(list.length, 3);
  });
}
