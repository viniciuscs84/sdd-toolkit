# SDD Toolkit

Um toolkit reutilizável de agentes, blueprints, skills, templates, arquivos de contexto, configuração e scripts para **Specification-Driven Development (SDD)** em engenharia de software assistida por IA.

O objetivo deste projeto é ajudar humanos e agentes de IA a trabalharem juntos sem pular diretamente de uma ideia para o código. O toolkit define um fluxo estruturado em que requisitos são esclarecidos, ambientes são configurados, specs são escritas, waves e tasks são planejadas, a execução é coordenada e quality gates são verificados.

English version: [`README.md`](README.md)

## Início rápido

Escolha o script de configuração de acordo com a plataforma de IA/desenvolvimento que você deseja usar.

### Linux, macOS, Git Bash ou WSL

```bash
bash scripts/setup-claude.sh /caminho/para/seu-projeto
bash scripts/setup-opencode.sh /caminho/para/seu-projeto
bash scripts/setup-github-copilot.sh /caminho/para/seu-projeto
bash scripts/setup-codex.sh /caminho/para/seu-projeto
```

### Windows PowerShell

```powershell
.\scripts\setup-claude.ps1 C:\Caminho\Para\SeuProjeto
.\scripts\setup-opencode.ps1 C:\Caminho\Para\SeuProjeto
.\scripts\setup-github-copilot.ps1 C:\Caminho\Para\SeuProjeto
.\scripts\setup-codex.ps1 C:\Caminho\Para\SeuProjeto
```

Se o PowerShell bloquear a execução de scripts, execute em um terminal confiável:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

ou rode um script assim:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\setup-claude.ps1 C:\Caminho\Para\SeuProjeto
```

Se nenhum caminho de destino for informado, os scripts usam o diretório atual.

## O que cada script cria

```text
Claude           -> .claude/ + CLAUDE.md
OpenCode         -> .opencode/ + AGENTS.md + opencode.json
GitHub Copilot   -> .github/sdd-toolkit/ + .github/copilot-instructions.md
Codex            -> .codex/sdd-toolkit/ + CODEX.md
```

Cada script copia:

```text
agents/
agent-blueprints/
skills/
context/
docs/templates/
config/
```

Após a configuração, revise `config/model-routing.example.yml` e adapte aos modelos disponíveis na sua plataforma ou assinatura.

## Fluxo recomendado de adoção

1. Execute o script de configuração da sua plataforma.
2. Comece pelo Product Owner.
3. Deixe o Product Owner fazer as perguntas de configuração do projeto.
4. Deixe o Product Owner chamar o Env Configr para ambiente, plataforma de IA, roteamento de modelos e regras de comunicação.
5. Preencha ou aprove os arquivos de contexto necessários.
6. Configure o roteamento de modelos se sua plataforma suportar seleção de modelo por agente.
7. Deixe o Product Owner chamar o Spec Writer depois que um requisito for aprovado.
8. Deixe o Tech Lead planejar as specs aprovadas em waves e tasks.
9. Deixe o Agent Recruiter criar agentes específicos do projeto quando a stack exigir.
10. Deixe o Skill Builder criar ou recomendar skills para esses agentes.
11. Deixe o Orchestrator coordenar a execução.
12. Revise os quality gates antes de aceitar o trabalho.

## Por que este projeto existe

Ferramentas de codificação com IA são poderosas, mas se tornam arriscadas quando usadas sem escopo, contexto e validação claros.

Este toolkit ajuda a evitar problemas comuns:

- codificar antes de o requisito estar claro
- planejar trabalho fora da spec aprovada
- inventar detalhes técnicos silenciosamente
- perder rastreabilidade entre requisito, spec, wave, task e implementação
- pular testes, revisão, aceite ou verificações de segurança
- misturar decisões de produto com detalhes de implementação
- tratar a saída da IA como automaticamente correta
- usar modelos caros em tarefas simples sem uma política intencional de roteamento
- forçar um único idioma ou estilo de comunicação para humanos e agentes

## Ideia central

O humano continua sendo a autoridade final.

Os agentes ajudam a fazer perguntas, configurar o ambiente, documentar contexto, escrever specs, planejar execução, recrutar agentes específicos da stack, criar skills, coordenar tarefas e validar qualidade.

O fluxo principal é:

```text
ideia / issue / solicitação
-> Product Owner esclarece com o humano
-> Env Configr configura ambiente, plataforma de IA, roteamento de modelos e regras de comunicação
-> requisito é aprovado
-> Spec Writer escreve a especificação
-> Tech Lead planeja waves e tasks
-> Agent Recruiter cria agentes específicos quando necessário
-> Skill Builder cria ou recomenda skills necessárias
-> Orchestrator coordena a execução
-> agentes de quality gate validam review, tests, acceptance e security
-> Context Maintainer e Docs Maintainer atualizam registros
```

## Estrutura do repositório

```text
agents/               definições de agentes ativos
agent-blueprints/     templates para criar agentes específicos do projeto
skills/               skills reutilizáveis para tarefas SDD
context/              workflow e arquivos de contexto reutilizáveis
docs/templates/       templates para specs, waves e tasks
config/               configuração opcional do projeto/plataforma, incluindo roteamento de modelos
scripts/              scripts de configuração para plataformas suportadas
SECURITY.md           orientações de segurança e uso responsável
```

## Roteamento de modelos

Agentes podem usar modelos diferentes conforme complexidade, risco e custo da tarefa.

O toolkit não fixa nomes de modelos porque a disponibilidade depende da plataforma, provedor, assinatura, limites de custo e requisitos de compliance de cada usuário.

Use este arquivo como ponto de partida:

```text
config/model-routing.example.yml
```

Ele define perfis lógicos como:

- `economical`: tarefas simples, repetitivas e de baixo risco
- `fast`: roteamento e classificação simples
- `standard`: trabalho comum equilibrado
- `reasoning`: planejamento, arquitetura e raciocínio complexo
- `high_assurance`: segurança, aceite, revisão final e decisões de alto risco

O arquivo também inclui sugestões de associação agente-perfil, regras de comunicação e regras de escalonamento.

Copie ou adapte no projeto alvo e substitua os placeholders pelos modelos disponíveis na assinatura do cliente.

Os agentes devem perguntar ao humano, em vez de adivinhar, quando:

- os nomes dos modelos forem desconhecidos
- o modelo escolhido não estiver disponível
- a tarefa for sensível a custo
- o risco sugerir escalonamento, mas nenhum modelo high_assurance estiver configurado

## Regras de comunicação

- A comunicação entre agentes usa inglês por padrão.
- Agentes especializados se comunicando com modelos devem usar a skill `caveman` por padrão para reduzir tokens mantendo precisão técnica.
- A interação com humanos deve se adaptar ao idioma do humano.
- Artefatos voltados ao humano devem seguir o idioma esperado pelo humano ou pelo contexto do projeto.
- Não force inglês em artefatos voltados ao humano, a menos que o projeto exija isso explicitamente.
- Não use compressão caveman com humanos, a menos que o humano peça explicitamente.

## Agentes disponíveis para humanos

Quatro agentes foram desenhados para interagir diretamente com humanos.

### Product Owner

`agents/product-owner.md`

Responsável pela configuração do projeto, esclarecimento de produto e fluxo de aprovação de requisitos.

O Product Owner:

- faz ao humano as perguntas necessárias para configurar o projeto
- identifica definições faltantes
- esclarece objetivos de produto, usuários, escopo e direção de aceite
- chama o Env Configr quando a configuração de ambiente ou plataforma de IA for necessária
- chama subagentes para registrar configurações aprovadas
- avisa o humano quando o projeto está pronto para planejamento de execução
- nunca infere detalhes técnicos faltantes

### Env Configr

`agents/env-configr.md`

Responsável pela configuração do ambiente de desenvolvimento e do ambiente de agentes de IA.

O Env Configr:

- configura a plataforma de IA e o ambiente de desenvolvimento com o humano
- ajuda a escolher o script de setup ou layout de plataforma correto
- configura roteamento de modelos e regras de comunicação
- passa instruções de ambiente/plataforma para o Agent Recruiter e o Skill Builder
- garante que a comunicação entre agentes use inglês por padrão
- garante que a comunicação agente/modelo especializada use a skill `caveman` por padrão
- garante que interação humana e artefatos sigam o idioma do humano
- nunca adivinha nomes de modelos, recursos de assinatura, capacidades da plataforma ou credenciais

### Tech Lead

`agents/tech-lead.md`

Responsável pelo planejamento técnico.

O Tech Lead:

- planeja specs aprovadas em waves e tasks
- valida dependências entre tasks
- garante que o planejamento fique dentro da spec aprovada
- só inicia planejamento depois que stack, agentes e skills estão definidos
- mantém sistemas de gestão de tarefas consistentes quando existe integração
- chama o Orchestrator para executar tasks planejadas

### Orchestrator

`agents/orchestrator.md`

Responsável pela coordenação da execução.

O Orchestrator:

- recebe tasks planejadas pelo Tech Lead
- pode receber tasks avulsas explicitamente aprovadas por humano
- identifica agentes capazes
- chama agentes ativos ou recrutados
- coordena a ordem de execução
- garante consistência documental
- garante quality gates
- não implementa código diretamente

## Subagentes

Subagentes são papéis focados chamados pelos agentes disponíveis para humanos ou por outros especialistas.

Subagentes atuais:

- `context-maintainer.md`: mantém o contexto do projeto voltado aos agentes
- `spec-writer.md`: escreve especificações SDD formais
- `agent-recruiter.md`: cria/configura agentes específicos a partir de blueprints
- `skill-builder.md`: cria, adapta ou recomenda skills
- `architecture-specialist.md`: revisa fronteiras, dependências e manutenibilidade
- `ux-specialist.md`: revisa fluxos de usuário e comportamento de interface
- `review-specialist.md`: realiza revisão técnica
- `testing-specialist.md`: define e valida estratégia de testes
- `acceptance-specialist.md`: valida critérios de aceite e prontidão de produto
- `cybersecurity-specialist.md`: revisa impacto de segurança e risco residual
- `docs-maintainer.md`: mantém documentação voltada a humanos

## Agent blueprints

Blueprints não são agentes ativos por padrão. Eles são templates usados pelo Agent Recruiter para criar agentes específicos de uma stack ou ferramenta.

Blueprints disponíveis:

- `stack-specialist.md`
- `frontend-specialist.md`
- `backend-specialist.md`
- `api-specialist.md`
- `data-specialist.md`
- `devops-specialist.md`
- `repository-specialist.md`
- `project-management-specialist.md`

## Skills

Skills são instruções ou procedimentos reutilizáveis que agentes podem usar em trabalhos recorrentes.

O Skill Builder é responsável por criar, adaptar ou recomendar skills exigidas por agentes recrutados.

Ele pode usar documentação oficial, pesquisa pública na internet, skills locais existentes e, opcionalmente, a API da skills.sh quando o usuário fornecer seu próprio token.

O Skill Builder não deve armazenar, imprimir, commitar ou expor tokens do usuário.

A skill `caveman` é usada por padrão para comunicação entre agentes e comunicação especializada com modelos quando comunicação compacta for útil.

## Pasta context

A pasta `context/` armazena contexto operacional voltado aos agentes.

```text
context/workflow.md           workflow humano x agentes
context/product.md            visão do produto, objetivos, usuários e proposta de valor
context/business-rules.md     regras de negócio aprovadas
context/architecture.md       decisões de arquitetura e fronteiras
context/stack.md              tecnologias, ferramentas e comandos
context/decisions.md          log de decisões
context/glossary.md           termos do domínio
context/constraints.md        restrições de produto, técnicas, legais, operacionais e de segurança
context/current-state.md      estado atual conhecido do projeto
```

O Product Owner é dono das decisões de contexto de produto.

O Context Maintainer mantém a pasta de contexto correta, concisa e consistente.

## Templates

Os templates ficam em `docs/templates/`.

Eles são usados para preservar rastreabilidade:

```text
docs/templates/spec-template.md
docs/templates/wave-template.md
docs/templates/task-template.md
```

## Quality gates

Toda task deve reportar quatro gates:

- `review`
- `tests`
- `acceptance`
- `security`

Estados permitidos:

- `passed`
- `failed`
- `not-applicable`, com justificativa
- `waived`, com justificativa

Uma task não deve ser considerada completa enquanto qualquer gate estiver ausente ou falhando.

## Reuso manual

Você também pode copiar apenas as pastas necessárias:

```bash
cp -r agents /caminho/para/seu-projeto/
cp -r agent-blueprints /caminho/para/seu-projeto/
cp -r skills /caminho/para/seu-projeto/
cp -r context /caminho/para/seu-projeto/
cp -r docs/templates /caminho/para/seu-projeto/docs/
cp -r config /caminho/para/seu-projeto/
```

Depois personalize:

1. `agents/agent-catalog.md`
2. `context/workflow.md`
3. `context/stack.md`
4. `context/current-state.md`
5. `config/model-routing.example.yml`
6. `skills/`
7. agentes recrutados criados a partir de `agent-blueprints/`

## Princípios de design

- Começar por especificações antes do código.
- Product Owner, Env Configr, Tech Lead e Orchestrator ficam disponíveis para humanos.
- Não inferir detalhes técnicos faltantes.
- Não adivinhar nomes de modelos, recursos de assinatura ou capacidades da plataforma.
- Não planejar trabalho fora da especificação aprovada.
- Definir ambiente, plataforma, stack, agentes e skills antes do planejamento de implementação.
- Rotear agentes para modelos intencionalmente conforme complexidade, risco e custo.
- Usar inglês para comunicação entre agentes por padrão.
- Adaptar interação humana e artefatos voltados ao humano ao idioma do humano.
- Usar `caveman` para comunicação compacta entre agentes/modelos especializados por padrão.
- Manter waves e tasks rastreáveis às specs.
- Manter dependências entre tasks consistentes e explícitas.
- Usar categorias de task e quality gates explícitos.
- Tratar segurança como preocupação padrão de revisão.
- Sempre reportar o que foi validado e o que não foi.

## Segurança e responsabilidade

Não publique segredos, tokens, nomes de clientes, URLs privadas ou regras proprietárias de projeto ao adaptar este toolkit.

Não instale skills de terceiros ou agentes gerados em um projeto de produção sem revisão humana.

Não use tasks avulsas do Orchestrator para burlar o Product Owner ou o Tech Lead.

Não faça commit de tokens de provedores ou credenciais privadas de modelos em arquivos de roteamento.

Consulte `SECURITY.md` antes de compartilhar uma versão customizada.

## Autor

Criado e mantido por **Vinícius Santos**.

- GitHub: https://github.com/viniciuscs84
- LinkedIn: https://www.linkedin.com/in/viniciuscs/

## Licença

MIT, salvo alteração pelo proprietário do repositório.
