-- Criar tabela se não existir
CREATE TABLE IF NOT EXISTS vendas_celular (
  id BIGINT PRIMARY KEY,
  numero TEXT NOT NULL,
  clienteId BIGINT REFERENCES clientes(id),
  marca TEXT,
  modelo TEXT,
  imei TEXT,
  capacidade TEXT,
  cor TEXT,
  estado TEXT,
  descEstado TEXT,
  valor TEXT,
  pagamento TEXT,
  dataVenda TEXT,
  carregador TEXT,
  observacoes TEXT
);

-- Habilitar RLS
ALTER TABLE vendas_celular ENABLE ROW LEVEL SECURITY;

-- Remover políticas existentes se houver
DROP POLICY IF EXISTS "permite_leitura" ON vendas_celular;
DROP POLICY IF EXISTS "permite_insercao" ON vendas_celular;
DROP POLICY IF EXISTS "permite_update" ON vendas_celular;
DROP POLICY IF EXISTS "permite_delete" ON vendas_celular;

-- Criar políticas
CREATE POLICY "permite_leitura" ON vendas_celular FOR SELECT USING (true);
CREATE POLICY "permite_insercao" ON vendas_celular FOR INSERT WITH CHECK (true);
CREATE POLICY "permite_update" ON vendas_celular FOR UPDATE USING (true);
CREATE POLICY "permite_delete" ON vendas_celular FOR DELETE USING (true);