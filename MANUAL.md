# 📘 Tech Cell CRM — Manual do Sistema

> *Sistema completo para gestão de assistência técnica de celulares*

---

## 📋 Índice

1. [Visão Geral](#1-visão-geral)
2. [Dashboard](#2-dashboard)
3. [Clientes](#3-clientes)
4. [Ordens de Serviço](#4-ordens-de-serviço)
5. [Termo de Serviço](#5-termo-de-serviço)
6. [Relatórios](#6-relatórios)
7. [Financeiro](#7-financeiro)
8. [Alertas e Notificações](#8-alertas-e-notificações)
9. [WhatsApp](#9-whatsapp)
10. [Backup e Configurações](#10-backup-e-configurações)
11. [Atalhos e Boas Práticas](#11-atalhos-e-boas-práticas)
12. [Perguntas Frequentes](#12-perguntas-frequentes)

---

## 1. VISÃO GERAL

### 1.1 O que é o Tech Cell CRM?

Sistema web 100% offline (funciona sem internet após primeiro carregamento) para gerenciar ordens de serviço, clientes, financeiro e relatórios de uma assistência técnica de celulares.

### 1.2 Tecnologias

- HTML5 + CSS3 + JavaScript puro
- Armazenamento local (localStorage)
- Google Fonts (DM Sans)
- Zero dependências externas

### 1.3 Acessando

Abra o arquivo `crm.html` em qualquer navegador moderno (Chrome, Edge, Firefox, Opera). Não requer instalação, servidor ou internet.

### 1.4 Estrutura de Navegação

```
┌─────────────────────────────────────┐
│  📱 Tech Cell CRM                    │
│                                     │
│  ┌─────────────────────────────────┐│
│  │ ■ Dashboard                     ││
│  │ ■ Clientes                      ││
│  │ ■ Ordens de Serviço  (🔔)       ││
│  │ ■ Relatórios                    ││
│  │ ■ Financeiro                    ││
│  │ ⚙ Configurações                 ││
│  └─────────────────────────────────┘│
│                                     │
│  [ÁREA DE CONTEÚDO PRINCIPAL]       │
│                                     │
└─────────────────────────────────────┘
```

### 1.5 Cores do Sistema

| Cor | Uso | Hex |
|-----|-----|-----|
| Verde lima | Ações primárias, destaque principal | `#c8ff00` |
| Azul neon | Status "Em Andamento", destaques secundários | `#0096ff` |
| Vermelho | Cancelado, alertas críticos, perigo | `#ff4444` |
| Laranja | Aguardando, avisos | `#ff9500` |
| Verde | Concluído, sucesso | `#00d974` |

---

## 2. DASHBOARD

### 2.1 Cards de Estatísticas

O Dashboard exibe 5 cards com métricas em tempo real:

| Card | Descrição |
|------|-----------|
| **Total OS** | Todas as ordens de serviço cadastradas |
| **OS Abertas** | Em andamento + aguardando aprovação + aguardando peça |
| **OS Fechadas** | Concluídas + entregues |
| **Aguardando Peça** | OS paradas por falta de peça + canceladas |
| **Receita do Mês** | Soma de todas OS concluídas no mês corrente |

### 2.2 Últimas Ordens

Tabela com as 5 OS mais recentes (ordenadas por data de entrada).

### 2.3 Alertas

Painel que mostra automaticamente:

- ⚠️ OS **atrasadas** (previsão de entrega vencida)
- ⏰ OS **prontas há mais de 7 dias** sem retirada
- 🔧 OS **aguardando peça há mais de 5 dias**

> O badge azul 🔔 no menu "Ordens de Serviço" mostra a quantidade total de alertas.

---

## 3. CLIENTES

### 3.1 Cadastro

Campos disponíveis:

| Campo | Obrigatório | Máscara |
|-------|-------------|---------|
| Nome Completo | ✅ | — |
| CPF | ✅ | Automática (000.000.000-00) |
| Telefone | ✅ | Automática ((00) 00000-0000) |
| E-mail | ❌ | — |
| Endereço | ❌ | — |

### 3.2 Busca

Digite no campo de busca para filtrar por **nome**, **CPF** ou **telefone** em tempo real.

### 3.3 Ações por Cliente

| Botão | Função |
|-------|--------|
| ✏️ Editar | Abre o formulário preenchido para edição |
| 📋 Histórico | Mostra todas as OS do cliente |
| 🗑 Excluir | Remove o cliente (avisa se houver OS vinculadas) |

### 3.4 Histórico

Ao clicar em "Histórico", você vê:

- Número da OS (azul)
- Status colorido
- Dispositivo (marca + modelo)
- Tipo de serviço
- Valor
- Data de entrada

---

## 4. ORDENS DE SERVIÇO

### 4.1 Criando uma OS

Clique em **"+ Nova OS"** e preencha:

#### Seção 1: Cliente
- Digite o nome do cliente — o **autocomplete** sugere clientes cadastrados
- Selecione o cliente correto na lista

#### Seção 2: Dispositivo
| Campo | Descrição |
|-------|-----------|
| Marca | Ex: Apple, Samsung, Xiaomi |
| Modelo | Ex: iPhone 14 Pro, Galaxy S23 |
| IMEI | Código único do aparelho (opcional) |

#### Seção 3: Serviço
| Campo | Opções |
|-------|--------|
| Tipo | Troca de Tela, Bateria, Conector, Software, Câmera, Áudio/Microfone, Outros |
| Status | Aguardando Aprovação, Em Andamento, Aguardando Peça, Concluído, Entregue, Cancelado |

#### Seção 4: Teste de Funcionamento

**Estado da Bateria:** Bom / Regular / Ruim / Viciado

**Checklist de Funcionamento** (clique para marcar/desmarcar):
- Tela │ Touch │ Wi-Fi │ Bluetooth │ Câmeras │ Áudio │ Botões │ Face ID │ Carregamento │ Sensores

**Acessórios Inclusos:** Campo livre para anotar capa, película, fone, etc.

#### Seção 5: Valores
| Campo | Descrição |
|-------|-----------|
| Valor Orçado | Valor estimado do serviço |
| Valor Final | Valor efetivamente cobrado |
| Pagamento | Dinheiro, PIX, Cartão, Crédito, Débito |

#### Seção 6: Garantia
- **Data de Garantia:** Pré-preenchida com +90 dias da data atual
- **Observações:** Campo livre para anotações da garantia

#### Seção 7: Datas
| Campo | Observação |
|-------|------------|
| Data de Entrada | Pré-preenchida com hoje |
| Previsão de Entrega | Estimativa para o cliente |
| Data de Saída | Preencher quando entregar |

#### Seção 8: Responsável
- **Técnico Responsável:** Nome do técnico que executará o serviço

#### Seção 9: Observações
- Campo de texto livre para anotações internas

### 4.2 Numeração Automática

As OS são numeradas automaticamente: **OS-0001**, **OS-0002**, **OS-0003**...

### 4.3 Busca e Filtros

- **Busca textual:** Por número da OS, nome do cliente ou dispositivo
- **Filtro por Status:** Selecione um status para filtrar a lista

### 4.4 Ações na Lista

| Botão | Função |
|-------|--------|
| ✏️ Editar | Abre a OS para edição |
| 📄 Termo | Gera o termo de serviço imprimível |
| 💬 WhatsApp | Abre o WhatsApp com resumo da OS |
| 🗑 Excluir | Remove a OS (com confirmação) |

### 4.5 Coluna Garantia

Mostra na tabela:

| Situação | Indicador |
|----------|-----------|
| Garantia válida | ✅ "Válida (X dias)" em verde |
| Garantia expirada | ❌ "Expirada" em vermelho |
| Sem garantia | ➖ "—" |

---

## 5. TERMO DE SERVIÇO

### 5.1 Gerando o Termo

Clique em **"Termo"** na lista de OS para gerar automaticamente.

### 5.2 Conteúdo do Termo

O termo contém **4 blocos obrigatórios**:

#### Bloco 1 — Identificação
- Dados da assistência (Tech Cell CRM)
- Dados do cliente (nome, CPF, telefone)
- Dados do dispositivo (marca, modelo, IMEI)
- Número da OS, datas, defeito relatado
- Itens testados e acessórios inclusos
- **Valores:** Orçado + Final + Forma de pagamento

#### Bloco 2 — Autorização
> "Eu, [cliente], portador do CPF [CPF], autorizo a realização do serviço descrito nesta ordem..."

#### Bloco 3 — Condições (6 cláusulas)
1. Troca de tela e funções secundárias
2. Oxidação e danos por líquido
3. Garantia de 90 dias
4. Orçamento vinculante
5. Taxa de desmontagem
6. Descarte após 90 dias (Art. 1.263 CC)

#### Bloco 4 — Assinaturas
- Linha para assinatura do cliente
- Linha para assinatura do técnico
- Data e local

### 5.3 Impressão

- Botão **"🖨️ Imprimir Termo"** — abre a impressão do navegador mostrando apenas o termo
- Botão **"Fechar"** — volta ao sistema

> O termo é renderizado em fundo branco para impressão economizar tinta.

---

## 6. RELATÓRIOS

### 6.1 Aba Resumo

Cards com métricas gerais:

| Métrica | Descrição |
|---------|-----------|
| Total OS | Todas as ordens |
| Concluídas | Total de serviços finalizados |
| Em Andamento | Serviços em execução |
| Faturamento Total | Soma de todas OS concluídas |
| Ticket Médio | Média de valor por OS concluída |

### 6.2 Aba Por Técnico

Tabela com desempenho individual dos técnicos:

- Nome do técnico
- OS concluídas
- OS em andamento
- Faturamento gerado

### 6.3 Aba Por Serviço

Tabela com análise dos tipos de serviço:

- Tipo (Troca de Tela, Bateria, etc.)
- Quantidade realizada
- Faturamento total
- Percentual sobre o total

---

## 7. FINANCEIRO

### 7.1 Aba Receitas

Lista todas as OS com status **Concluído** ou **Entregue**.

**Filtros disponíveis:**
- 📅 Por mês
- 📅 Por ano

**Total:** Soma de todas as receitas do período filtrado.

### 7.2 Aba Despesas

Registre despesas operacionais:

| Campo | Descrição |
|-------|-----------|
| Data | Data da despesa |
| Categoria | Aluguel, Energia, Água, Internet, Peças, Ferramentas, Marketing, Salários, Impostos, Outros |
| Valor | Valor da despesa |
| Descrição | Detalhamento |

Ações:
- **"+ Nova Despesa"** — adicionar despesa
- **"Excluir"** — remover despesa

### 7.3 Aba Resultado

**Cards comparativos:**

| Card | Descrição |
|------|-----------|
| 💰 Receitas | Total de receitas do período |
| 💸 Despesas | Total de despesas do período |
| 📈 Lucro Líquido | Receitas - Despesas (verde/azul se positivo, vermelho se negativo) |
| 📊 Margem | Percentual de lucro sobre receita |

---

## 8. ALERTAS E NOTIFICAÇÕES

O sistema **verifica automaticamente a cada 60 segundos**:

| Alerta | Condição | Ícone |
|--------|----------|-------|
| OS Atrasada | Previsão de entrega vencida | 🔴 Vermelho |
| OS Pronta | Concluída há +7 dias sem retirada | 🟡 Laranja |
| Aguardando Peça | Parada há +5 dias | 🔵 Azul |

O badge 🔔 no menu "Ordens de Serviço" mostra o total de alertas.

---

## 9. WHATSAPP

### 9.1 Envio Direto da Lista

Clique no botão **"WhatsApp"** na lista de OS para abrir automaticamente:

- O WhatsApp Web/App com a mensagem pré-preenchida
- Dados enviados: número OS, dispositivo, serviço, status, valor, previsão

### 9.2 Envio Manual (Configurações)

1. Vá em **Configurações** > **Enviar para WhatsApp**
2. Digite o número da OS (ex: OS-0001)
3. Visualize o preview
4. Clique em **"Enviar"**

> Requer número de telefone válido no cadastro do cliente.

---

## 10. BACKUP E CONFIGURAÇÕES

### 10.1 Exportar Backup

Clique em **"Exportar Backup"** para baixar um arquivo `.json` com:

- Todos os clientes
- Todas as ordens de serviço
- Todas as despesas
- Contador de numeração OS

### 10.2 Importar Backup

1. Clique em **"Importar Backup"**
2. Selecione o arquivo `.json` exportado anteriormente
3. Os dados são restaurados automaticamente

> ⚠️ A importação **substitui** todos os dados atuais pelos do arquivo.

### 10.3 Dados Técnicos

| Item | Detalhe |
|------|---------|
| Armazenamento | localStorage do navegador |
| Capacidade | ~5-10 MB (suficiente para milhares de registros) |
| Persistência | Os dados permanecem mesmo fechando o navegador |
| Limpeza | Limpar dados do navegador remove os registros |

---

## 11. ATALHOS E BOAS PRÁTICAS

### 11.1 Fluxo Recomendado

```
1. Cadastre o cliente → 2. Crie a OS → 3. Atualize o status
→ 4. Gere o termo → 5. Imprima/assine → 6. Finalize e entregue
→ 7. Registre despesas → 8. Acompanhe relatórios
```

### 11.2 Boas Práticas

✅ **Sempre cadastre o cliente antes** de criar a OS (autocomplete funciona melhor)

✅ **Marque os itens testados** no checklist para se proteger juridicamente

✅ **Anote acessórios inclusos** para evitar desentendimentos na entrega

✅ **Exporte backup semanalmente** para não perder dados

✅ **Atualize o status** conforme o serviço avança

✅ **Preencha a data de saída** ao entregar o dispositivo (afeta garantia)

### 11.3 Dicas

- A **data de garantia** é pré-preenchida com +90 dias — ajuste se necessário
- O **autocomplete de clientes** funciona com 2+ caracteres
- Use o **filtro de status** para encontrar OS rapidamente
- O **termo de serviço** é documento juridicamente válido
- O badge azul no menu indica alertas — não ignore!

---

## 12. PERGUNTAS FREQUENTES

### O sistema funciona sem internet?
Sim. Após o primeiro carregamento (para carregar a fonte), o sistema funciona 100% offline.

### Onde os dados ficam armazenados?
No navegador (localStorage). Para transferir dados entre computadores, use Exportar/Importar Backup.

### Posso usar em qualquer navegador?
Sim, desde que seja moderno (Chrome 80+, Edge 80+, Firefox 75+, Opera 67+).

### Como faço para imprimir o termo?
Clique em "Termo" na OS, depois em "🖨️ Imprimir Termo" — imprime apenas o termo.

###Como mudar a cor do tema?
Edite as variáveis CSS no arquivo: `--accent` (verde lima), `--blue` (azul neon), etc.

### Quantas OS posso cadastrar?
Não há limite. O localStorage suporta ~5-10 MB — suficiente para milhares de registros.

### Posso recuperar dados excluídos?
Não, a menos que tenha um backup exportado anteriormente.

### Como enviar OS por WhatsApp?
Clique no botão "WhatsApp" na lista de OS. O link `wa.me` será aberto com a mensagem.

### O termo tem validade jurídica?
Sim. O termo segue as diretrizes do Código Civil Brasileiro e do CDC (Código de Defesa do Consumidor).

---

> **Tech Cell CRM v2.0** — Documentação gerada em Maio 2026
