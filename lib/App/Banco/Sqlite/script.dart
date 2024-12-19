const criarTabelas = [
  '''
    CREATE TABLE medicamento(
      id INTEGER NOT NULL PRIMARY KEY,
      nome VARCHAR(200) NOT NULL,
      quantidade INTEGER NOT NULL,
      validade DATE,
      fornecedor VARCHAR(200)
    )
  '''
];

const insercoes = [
  '''
    INSERT INTO medicamento (nome, quantidade, validade, fornecedor)
    VALUES ('Paracetamol', 100, '2025-01-01', 'Farmácia Central')
  ''',
  '''
    INSERT INTO medicamento (nome, quantidade, validade, fornecedor)
    VALUES ('Ibuprofeno', 50, '2024-12-01', 'Distribuidora Saúde')
  ''',
  '''
    INSERT INTO medicamento (nome, quantidade, validade, fornecedor)
    VALUES ('Amoxicilina', 200, '2025-06-15', 'Laboratório Farma')
  '''
];
