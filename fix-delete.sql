-- Corrigir permissões de DELETE para todas as tabelas

-- Clientes - remover todas as políticas antigas e criar novas
DROP POLICY IF EXISTS "允许匿名删除" ON clientes;
DROP POLICY IF EXISTS "permite_delete_cliente" ON clientes;
ALTER TABLE clientes DISABLE ROW LEVEL SECURITY;
ALTER TABLE clientes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "delete_any_cliente" ON clientes FOR DELETE USING (true);
CREATE POLICY "insert_any_cliente" ON clientes FOR INSERT WITH CHECK (true);
CREATE POLICY "update_any_cliente" ON clientes FOR UPDATE USING (true);
CREATE POLICY "select_any_cliente" ON clientes FOR SELECT USING (true);

-- Ordens
DROP POLICY IF EXISTS "允许匿名删除" ON ordens;
ALTER TABLE ordens DISABLE ROW LEVEL SECURITY;
ALTER TABLE ordens ENABLE ROW LEVEL SECURITY;

CREATE POLICY "delete_any_ordem" ON ordens FOR DELETE USING (true);
CREATE POLICY "insert_any_ordem" ON ordens FOR INSERT WITH CHECK (true);
CREATE POLICY "update_any_ordem" ON ordens FOR UPDATE USING (true);
CREATE POLICY "select_any_ordem" ON ordens FOR SELECT USING (true);

-- Despesas
DROP POLICY IF EXISTS "允许匿名删除" ON despesas;
ALTER TABLE despesas DISABLE ROW LEVEL SECURITY;
ALTER TABLE despesas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "delete_any_despesa" ON despesas FOR DELETE USING (true);
CREATE POLICY "insert_any_despesa" ON despesas FOR INSERT WITH CHECK (true);
CREATE POLICY "update_any_despesa" ON despesas FOR UPDATE USING (true);
CREATE POLICY "select_any_despesa" ON despesas FOR SELECT USING (true);

-- Vendas Celular
DROP POLICY IF EXISTS "permite_delete" ON vendas_celular;
ALTER TABLE vendas_celular DISABLE ROW LEVEL SECURITY;
ALTER TABLE vendas_celular ENABLE ROW LEVEL SECURITY;

CREATE POLICY "delete_any_venda" ON vendas_celular FOR DELETE USING (true);
CREATE POLICY "insert_any_venda" ON vendas_celular FOR INSERT WITH CHECK (true);
CREATE POLICY "update_any_venda" ON vendas_celular FOR UPDATE USING (true);
CREATE POLICY "select_any_venda" ON vendas_celular FOR SELECT USING (true);