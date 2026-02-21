-- Criar tabela para relatórios de exames da Lina
-- Rodar no Supabase Dashboard > SQL Editor

CREATE TABLE IF NOT EXISTS exam_reports (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  content TEXT NOT NULL,
  patient_name TEXT DEFAULT 'RN de Franciele'
);

-- Permitir acesso anônimo para leitura e escrita
ALTER TABLE exam_reports ENABLE ROW LEVEL SECURITY;

-- Políticas de acesso
CREATE POLICY "Allow anonymous read" ON exam_reports 
  FOR SELECT USING (true);

CREATE POLICY "Allow anonymous insert" ON exam_reports 
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow anonymous delete" ON exam_reports 
  FOR DELETE USING (true);

-- Comentário
COMMENT ON TABLE exam_reports IS 'Relatórios de IA dos exames da Lina (RN de Franciele)';
