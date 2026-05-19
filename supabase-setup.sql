-- Tabelas para o Tech Cell CRM

-- Tabela de configurações (contador e dados do prestador)
CREATE TABLE IF NOT EXISTS config (
  id INTEGER PRIMARY KEY DEFAULT 1,
  contador INTEGER DEFAULT 1,
  prestador JSONB DEFAULT '{}'::jsonb
);

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
  id BIGINT PRIMARY KEY,
  nome TEXT NOT NULL,
  cpf TEXT NOT NULL,
  telefone TEXT NOT NULL,
  email TEXT,
  endereco TEXT
);

-- Tabela de ordens de serviço
CREATE TABLE IF NOT EXISTS ordens (
  id BIGINT PRIMARY KEY,
  numero TEXT NOT NULL,
  clienteId BIGINT REFERENCES clientes(id),
  marca TEXT,
  modelo TEXT,
  imei TEXT,
  tipo TEXT,
  status TEXT DEFAULT 'aguardando_aprovacao',
  defeito TEXT,
  bateria TEXT,
  testados TEXT,
  acessorios TEXT,
  orcado TEXT,
  valor TEXT,
  pagamento TEXT,
  dataGarantia TEXT,
  obsGarantia TEXT,
  dataEntrada TEXT,
  previsao TEXT,
  dataSaida TEXT,
  tecnico TEXT,
  observacoes TEXT
);

-- Tabela de despesas
CREATE TABLE IF NOT EXISTS despesas (
  id BIGINT PRIMARY KEY,
  data TEXT NOT NULL,
  categoria TEXT NOT NULL,
  valor TEXT NOT NULL,
  descricao TEXT NOT NULL
);

-- Tabela de vendas de celular
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

-- Habilitar acesso anônimo (anon key)
ALTER TABLE clientes ENABLE ROW LEVEL SECURITY;
ALTER TABLE ordens ENABLE ROW LEVEL SECURITY;
ALTER TABLE despesas ENABLE ROW LEVEL SECURITY;
ALTER TABLE config ENABLE ROW LEVEL SECURITY;
ALTER TABLE vendas_celular ENABLE ROW LEVEL SECURITY;

-- Políticas para anon
CREATE POLICY "允许匿名读取" ON clientes FOR SELECT USING (true);
CREATE POLICY "允许匿名插入" ON clientes FOR INSERT WITH CHECK (true);
CREATE POLICY "允许匿名更新" ON clientes FOR UPDATE USING (true);
CREATE POLICY "允许匿名删除" ON clientes FOR DELETE USING (true);

CREATE POLICY "允许匿名读取" ON ordens FOR SELECT USING (true);
CREATE POLICY "允许匿名插入" ON ordens FOR INSERT WITH CHECK (true);
CREATE POLICY "允许匿名更新" ON ordens FOR UPDATE USING (true);
CREATE POLICY "允许匿名删除" ON ordens FOR DELETE USING (true);

CREATE POLICY "允许匿名读取" ON despesas FOR SELECT USING (true);
CREATE POLICY "允许匿名插入" ON despesas FOR INSERT WITH CHECK (true);
CREATE POLICY "允许匿名更新" ON despesas FOR UPDATE USING (true);
CREATE POLICY "允许匿名删除" ON despesas FOR DELETE USING (true);

CREATE POLICY "允许匿名读取" ON config FOR SELECT USING (true);
CREATE POLICY "允许匿名插入" ON config FOR INSERT WITH CHECK (true);
CREATE POLICY "允许匿名更新" ON config FOR UPDATE USING (true);

CREATE POLICY "允许匿名读取" ON vendas_celular FOR SELECT USING (true);
CREATE POLICY "允许匿名插入" ON vendas_celular FOR INSERT WITH CHECK (true);
CREATE POLICY "允许匿名更新" ON vendas_celular FOR UPDATE USING (true);
CREATE POLICY "允许匿名删除" ON vendas_celular FOR DELETE USING (true);

-- Inicializar config
INSERT INTO config (id, contador) VALUES (1, 1) ON CONFLICT (id) DO NOTHING;