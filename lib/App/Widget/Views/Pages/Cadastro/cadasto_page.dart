import 'package:agropharm_application/App/Banco/Sqlite/Dao/medicamento_dao.dart';
import 'package:agropharm_application/App/Dominio/Dto/medicamento_dto.dart';
import 'package:flutter/material.dart';

class CadastroMedicamentoPage extends StatefulWidget {
  const CadastroMedicamentoPage({Key? key}) : super(key: key);

  @override
  _CadastroMedicamentoPageState createState() =>
      _CadastroMedicamentoPageState();
}

class _CadastroMedicamentoPageState extends State<CadastroMedicamentoPage> {
  final _formKey = GlobalKey<FormState>();

  String nome = '';
  int quantidade = 0;
  String validade = '';
  String fornecedor = '';

  @override
  Widget build(BuildContext context) {
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
            key: _formKey,
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
                  decoration: const InputDecoration(
                    labelText: 'Nome do Medicamento',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    nome = text;
                  },
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
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    setState(() {
                      quantidade = int.tryParse(text) ?? 0;
                    });
                  },
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
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Data de Validade (dd/mm/aaaa)',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    validade = text;
                  },
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
                  decoration: const InputDecoration(
                    labelText: 'Fornecedor',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    fornecedor = text;
                  },
                ),
                const SizedBox(height: 20),

                // Botão de Cadastrar
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            // Criação do objeto DTO
                            DTOMedicamento(
                              nome: nome,
                              quantidade: quantidade,
                              validade: DateTime.parse(
                                  validade.split('/').reversed.join('-')),
                              fornecedor: fornecedor,
                            );

                            // Chamada para salvar no banco usando DAO
                            DAOMedicamento dao = DAOMedicamento();
                            await dao.sqlInserir;

                            // Exibir mensagem de sucesso
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Medicamento cadastrado com sucesso!'),
                                backgroundColor: Colors.green,
                              ),
                            );

                            // Limpar o formulário
                            _formKey.currentState!.reset();

                            // Navegar para a tela de estoque
                            Navigator.pushReplacementNamed(context, '/estoque');
                          } catch (e) {
                            // Exibir mensagem de erro
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Erro ao cadastrar medicamento: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
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
