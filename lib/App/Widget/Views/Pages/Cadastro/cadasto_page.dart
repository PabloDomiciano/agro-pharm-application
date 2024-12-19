import 'package:agropharm_application/App/Aplicacao/medicamento_ap.dart';
import 'package:agropharm_application/App/Dominio/Dto/medicamento_dto.dart';
import 'package:flutter/material.dart';

class CadastroMedicamentoPage extends StatefulWidget {
  const CadastroMedicamentoPage({Key? key}) : super(key: key);

  @override
  _CadastroMedicamentoPageState createState() =>
      _CadastroMedicamentoPageState();
}

class _CadastroMedicamentoPageState extends State<CadastroMedicamentoPage> {
  final _cadastroKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _nomeController = TextEditingController();
    final _quantidadeController = TextEditingController();
    final _validadeController = TextEditingController();
    final _fornecedorController = TextEditingController();

    Future<void> criarMedicamento() async {
      if (_cadastroKey.currentState!.validate()) {
        final nome = _nomeController.text;
        final quantidade = _quantidadeController.text;
        final validade = _validadeController.text;
        final fornecedor = _fornecedorController.text;

        DTOMedicamento dto = DTOMedicamento(
          nome: nome,
          quantidade: int.parse(quantidade),
          validade: DateTime.parse(validade),
          fornecedor: fornecedor,
        );

        APPMedicamento appMedicamento = APPMedicamento();
        await appMedicamento.salvar(dto);

        _nomeController.clear();
        _quantidadeController.clear();
        _validadeController.clear();
        _fornecedorController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Medicamento salvo com sucesso')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Medicamentos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C6E49),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _cadastroKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Insira os dados do medicamento:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Campo Nome
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do Medicamento',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O nome é obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Campo Quantidade
                TextFormField(
                  controller: _quantidadeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A quantidade é obrigatória';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Campo Validade
                TextFormField(
                  controller: _validadeController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Data de Validade (dd/mm/aaaa)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A data de validade é obrigatória';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Campo Fornecedor
                TextFormField(
                  controller: _fornecedorController,
                  decoration: const InputDecoration(
                    labelText: 'Fornecedor',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Botão de Cadastrar
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_cadastroKey.currentState!.validate()) {
                          await criarMedicamento();
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 18),
                      ),
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
