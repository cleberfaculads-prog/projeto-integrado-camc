# Projeto Integrado – CAMC (Cadeia Alimentar do Mel e Chia)

Trabalho do **Projeto Integrado – Síntese** do curso de **Análise e Desenvolvimento de Sistemas** da Universidade Anhanguera, polo Osasco/SP (2026).

**Aluno:** Cleber Luiz de Torres
**Tutor:** Prof. Vinicius Mendes

---

## Sobre o projeto

A CAMC é uma startup familiar da zona rural que produz mel, sementes de chia e a Barra Energética Mel e Chia. Quando li o cenário, a impressão que tive foi de uma empresa em que cada parte funciona sozinha: o volume de mel fica em planilhas, a aplicação de fertilizantes é anotada em papel, o atendimento é feito por WhatsApp, e-mail e telefone sem um histórico único do cliente, e o laboratório do mel e a fábrica da barra ficam em lugares diferentes.

Neste projeto eu propus uma solução de tecnologia para juntar essas informações num lugar só, do registro da colheita até a avaliação do consumidor. O trabalho foi dividido em cinco passos, cada um ligado a uma disciplina do semestre.

## O que tem em cada passo

| Passo | Disciplina | Ferramentas | O que eu entreguei |
|---|---|---|---|
| 1 | Projeto de Software | Excel e Trello | Backlog de um CRM em Kanban: 44 cartões de requisitos em 11 etapas, com história de usuário e critérios de aceite |
| 2 | Segurança e Auditoria de Sistema | Pesquisa e LGPD | Níveis de acesso, política de backup 3-2-1 e método de auditoria da colheita ao feedback |
| 3 | Redes de Computadores | Cisco Packet Tracer | Rede em estrela com 7 VLANs, enlace de rádio entre as duas unidades e testes de ping e tracert |
| 4 | Interface e Usabilidade | Figma | Wireframe da tela de avaliação da barra, em 4 telas de celular, com avaliação em até 3 cliques |
| 5 | Arquitetura de Computadores | VS Code, MySQL Server e Visual Paradigm | Especificação do servidor com RAID 6, script SQL com 7 tabelas e MER do banco |

## Como esse trabalho ajuda num projeto de empresa

Comecei achando que seriam cinco trabalhos separados, mas no meio do caminho percebi que eles formam uma coisa só. A rede define onde o servidor fica, o servidor guarda o banco, o banco é o que o CRM usa e a segurança precisa olhar para tudo isso junto.

Na prática, o que eu fiz corresponde à fase de planejamento de um projeto de TI real, aquela que vem antes de qualquer linha de código:

- **O backlog no Trello** diz ao time de desenvolvimento o que precisa ser construído e quando cada tarefa está pronta. Também é por ele que um gestor acompanha o andamento e estima prazo e custo.
- **O plano de segurança** protege a empresa de perder dados, de acessos indevidos ao financeiro e de problemas com a LGPD.
- **A simulação da rede** permite testar a infraestrutura antes de comprar equipamento, o que diminui gasto e retrabalho.
- **O wireframe** valida a experiência do cliente antes de programar. Mudar um desenho no Figma custa muito menos do que mudar um aplicativo pronto.
- **O servidor com RAID 6 e o banco no MySQL** são a base onde todas as informações vão ficar, e o servidor continua funcionando mesmo se dois discos falharem.

Com esse material, a CAMC teria um documento de projeto pronto para orçar, contratar e começar o desenvolvimento.

## Limites e próximos passos

Reconheço que tudo isso ainda é um projeto. O CRM ficou no backlog e não foi programado, os triggers de auditoria ficaram como proposta, a ligação entre as unidades depende de um único rádio e o banco cobre só a parte de vendas.

Se eu continuasse, os próximos passos seriam criar no banco as tabelas de colheita, lotes e avaliações, colocar a auditoria para funcionar e começar o desenvolvimento do CRM pela etapa de Cadastro de Clientes, que já está em "Pronto para Desenvolver" no Trello.

## Estrutura do repositório

```
├── 01 - PROJETO INTEGRADO SÍNTESE - ADS (.pdf e .docx)  → trabalho final completo
├── Passo_1 a Passo_5 (.docx)                           → cada passo separado
├── Prints do Trello/                                   → Passo 1: quadro Kanban do CRM
├── Cisco Packet Tracer/                                → Passo 3: rede da CAMC
├── Prints Passo 4 – Interface e Usabilidade/           → Passo 4: prints do Figma e PDF do wireframe
└── Prints MYSQL/                                       → Passo 5: script SQL do banco (CAMC_banco_Cleber_Torres.sql),
                                                           prints do MySQL (01 a 08) e MER (09 e 10)
```

## O que eu aprendi

Aprendi bastante errando. No Trello, comecei com um quadro que não era o que o enunciado pedia e tive que refazer. No Packet Tracer, apanhei do aviso de VLAN nativa até entender que as duas pontas do mesmo cabo precisavam estar na mesma VLAN. No Figma, no primeiro dia não passei da capa. E o MySQL só instalou depois que descobri que faltava o Visual C++. Nada disso estava no enunciado, mas foi resolvendo cada problema que eu aprendi a usar as ferramentas de verdade.


## Agradecimentos

Quero agradecer aos professores Carlos e Kassya pelo apoio e pelas orientações durante o semestre. Muito do que coloquei em prática neste projeto veio do que aprendi nas aulas deles.
