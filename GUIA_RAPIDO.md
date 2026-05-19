# 🚀 QUICK START - Tech Cell CRM v2.0

## O Que Mudou?

### ✨ Novas Seções no Menu
- **Estoque** - Gerencia peças em estoque
- **Backup** - Exporta/importa dados e auto-save

### 🔒 Validações Adicionadas
- CPF: Valida formato e rejeita duplicados
- Email: Valida formato @domain.ext
- Mensagens de erro visuais com emojis ❌✅

### 🛡️ Proteção de Dados
- Auto-save automático a cada 5 minutos
- Exporta backup em JSON
- Importa com merge inteligente
- Histórico dos últimos 5 backups

### 📦 Gestor de Estoque
- Adiciona peças (Tela, Bateria, Conector, etc)
- Alerta quando estoque ≤ mínimo
- Rastreia custo unitário

### 🔔 Notificações
- Avisa quando OS está vencendo
- Alerta para OS vencidas

---

## Como Usar

### 1️⃣ NOVO CLIENTE COM VALIDAÇÃO
```
Menu → Clientes → + Novo Cliente
├─ Nome: [qualquer]
├─ CPF: [formato 000.000.000-00] ← Valida algoritmo
├─ Telefone: [formato (00) 0000-0000]
├─ Email: [precisa de @] ← Valida domínio
└─ Salvar ✅
```

**Exemplo válido:** CPF "111.444.777-35"  
**Exemplo inválido:** "000.000.000-00"

---

### 2️⃣ GERENCIAR ESTOQUE
```
Menu → Estoque → + Nova Peça
├─ Nome: "Tela Samsung A51"
├─ Tipo: "Tela"
├─ Quantidade: 5
├─ Quantidade Mínima: 2 ← Gera alerta se < mínimo
├─ Custo Unitário: 120.00
├─ Fornecedor: [opcional]
└─ Salvar ✅
```

**Status:**
- 🟢 **OK** = Quantidade > Mínimo
- 🟠 **Baixo** = Quantidade ≤ Mínimo (alerta animado)

---

### 3️⃣ FAZER BACKUP
```
Menu → Backup

EXPORTAR:
└─ Clique "📥 Exportar Backup"
   → Baixa arquivo: backup_crm_2026-05-12.json
   → Contém tudo: Clientes, Ordens, Peças

IMPORTAR:
└─ Clique "📤 Importar Backup"
   → Selecione arquivo .json
   → Escolha: SUBSTITUIR ou MESCLAR
   → Dados restaurados ✅

AUTO-SAVE:
└─ Toggle "Ativar Auto-Save a cada 5 minutos"
   → Status: "✓ Ativo" (salva automaticamente)
   → Histórico: vê últimos 5 backups
```

---

### 4️⃣ NOTIFICAÇÕES (Automáticas)
```
Ao abrir a página:
└─ Navegador solicita permissão
   → Clicar "Permitir"
   → Sistema avisa quando:
      • 1 dia até vencimento da OS
      • No dia do vencimento (URGENTE)
```

**Notificação de Exemplo:**
```
🚨 OS Vencendo Amanhã!
João Silva - OS-0001
```

---

## ⚡ Atalhos Úteis

| Ação | Caminho |
|------|---------|
| **Novo Cliente** | Menu → Clientes → + Novo |
| **Novo Estoque** | Menu → Estoque → + Nova Peça |
| **Exportar Dados** | Menu → Backup → 📥 Exportar |
| **Restaurar Dados** | Menu → Backup → 📤 Importar |
| **Forçar Backup** | Menu → Backup → 💾 Salvar Agora |
| **Limpar Tudo** | Menu → Backup → 🗑️ Limpar Dados |

---

## 🔐 Dados Seguros

Tudo é salvo **localmente no seu PC**:
```
localStorage.clientes   → Clientes cadastrados
localStorage.ordens     → Ordens de serviço
localStorage.pecas      → Peças em estoque
localStorage.backups    → Histórico de backups
```

**Backup é JSON (abrir no bloco de notas):**
```json
{
  "version": "1.0",
  "exportDate": "2026-05-12T10:30:00Z",
  "checksum": "abc123...",
  "data": {
    "clientes": [...],
    "ordens": [...],
    "pecas": [...]
  }
}
```

---

## ✔️ Checklist de Verificação

- [ ] Consegui adicionar um cliente com CPF válido?
- [ ] Validação rejeitou CPF inválido (com mensagem ❌)?
- [ ] Estoque seção está visível no menu?
- [ ] Consigo adicionar uma peça?
- [ ] Status "Baixo Estoque" aparece com ⚠️?
- [ ] Posso exportar backup (arquivo .json)?
- [ ] Auto-save mostra status "✓ Ativo"?
- [ ] Notificações foram permitidas no navegador?

---

## 🐛 Se Algo Deu Errado

### Email não valida?
→ Precisa ter @ e domínio (ex: user@domain.com)

### CPF inválido mesmo sendo correto?
→ Use CPF real ou teste: "111.444.777-35"

### Notificações não aparecem?
→ Permitir notificações do navegador (popup inicial)

### localStorage cheio?
→ Menu → Backup → 🗑️ Limpar Dados → Fazer backup antes!

### Dados sumiram?
→ Menu → Backup → Restaurar versão anterior

---

## 📊 Exemplo de Workflow Completo

```
1. COMEÇAR
   └─ Abrir crm.html ✓

2. ADICIONAR CLIENTES
   └─ Menu → Clientes → + Novo
   └─ Nome: João da Silva
   └─ CPF: 111.444.777-35 ✓
   └─ Telefone: (11) 99999-9999 ✓
   └─ Email: joao@email.com ✓
   └─ SALVAR ✅

3. ADICIONAR ESTOQUE
   └─ Menu → Estoque → + Nova Peça
   └─ Nome: Tela Samsung A51
   └─ Tipo: Tela
   └─ Qtd: 5, Mín: 2
   └─ Custo: 120.00
   └─ SALVAR ✅

4. FAZER BACKUP
   └─ Menu → Backup
   └─ Clique "📥 Exportar"
   └─ Arquivo salvo: backup_crm_2026-05-12.json
   └─ Status: "✓ Auto-Save ativo" ✅

5. OPERAÇÕES DIÁRIAS
   └─ Adicionar novas OS
   └─ Atualizar status
   └─ Verificar estoque baixo
   └─ Receber notificações automáticas
   └─ Sistema salva tudo automaticamente ✅

6. RECUPERAR (se necessário)
   └─ Menu → Backup → 📤 Importar
   └─ Selecionar arquivo .json
   └─ PRONTO! Dados restaurados ✅
```

---

## 💡 Dicas Profissionais

### 1. Backup Regular
Mesmo com auto-save, exporte um backup mensal:
```
Menu → Backup → 📥 Exportar
(Guarde em pasta segura: D:\Backups\CRM\)
```

### 2. Verificar Estoque Semanalmente
```
Menu → Estoque → Ver peças com status "⚠️ Baixo"
(Fazer pedido com fornecedor)
```

### 3. Manter Histórico de OS
```
Menu → Ordens → Buscar por cliente
(Clicar "Histórico" para ver serviços anteriores)
```

### 4. Acompanhar Financeiro
```
Menu → Financeiro → Filtrar por período
(Selecionar mês/ano para relatório)
```

### 5. Integrar com Smartphone
Usar compartilhamento de tela do PC → celular cliente para:
- Mostrar termo de serviço antes de assinar
- Visualizar histórico de serviços
- Confirmar valores

---

## 📞 Perguntas Frequentes

**P: Como restaurar um backup antigo?**  
R: Menu → Backup → Histórico → Botão "Restaurar" (próx. versão)

**P: Posso ter múltiplos usuários?**  
R: Não (em breve). Por enquanto, um PC = um usuário

**P: Quanto de espaço ocupa?**  
R: ~0.2 KB por cliente. Limite: ~5MB (5.000+ clientes)

**P: Funciona sem internet?**  
R: Sim! 100% offline. Dados no seu PC.

**P: Como migrar para outro PC?**  
R: Menu → Backup → 📥 Exportar → Levar arquivo → 📤 Importar no novo PC

---

## 🎯 Prioridades de Uso

### Mês 1 (Crítico)
- ✅ Adicionar todos os clientes existentes
- ✅ Cadastrar todas as peças em estoque
- ✅ Fazer primeira exportação de backup
- ✅ Testar restauração

### Mês 2 (Importante)
- ✅ Usar notificações para OS vencidas
- ✅ Atualizar estoque regularmente
- ✅ Monitorar serviços mais lucrativos
- ✅ Fazer backup mensal

### Mês 3+ (Otimização)
- ✅ Análise de lucratividade
- ✅ Automatizar lembretes de clientes
- ✅ Integrar com WhatsApp
- ✅ Preparar relatórios

---

## 🎓 Referência Rápida

```
CLIENTES:
├─ Novo → Preencher com validação
├─ Editar → Atualizar dados
├─ Histórico → Ver todas as OS
└─ Excluir → Remover cliente

ORDENS:
├─ Novo → OS automática (OS-0001, OS-0002...)
├─ Termo → Gerar PDF para impressão
├─ Status → Actualizar (Em Andamento, Concluído, etc)
└─ Excluir → Remover serviço

ESTOQUE:
├─ Novo → Peça + quantidade
├─ Editar → Atualizar estoque
├─ Status → ✓ OK ou ⚠️ Baixo
└─ Excluir → Remover peça

FINANCEIRO:
├─ Filtrar → Por mês/ano
├─ Total → Soma de receitas
└─ Exportar → Dado para Excel

BACKUP:
├─ Exportar → .json local
├─ Importar → Restaurar dados
├─ Auto-Save → 5 em 5 min (ON)
└─ Histórico → Últimos 5 backups
```

---

**Versão:** 2.0  
**Data:** 12 de maio de 2026  
**Desenvolvedor:** Arquiteto de Software Full-Stack  
**Status:** ✅ PRODUÇÃO

