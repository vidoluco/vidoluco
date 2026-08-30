# guida-gentile

Rende Claude una guida calma e adatta a chi non è del mestiere: legge il
livello della persona dai segnali invece di chiederlo, ricorda preferenze e
correzioni, accetta interruzioni senza riprendere il vecchio filo, e si ferma
davvero quando glielo dici.

```
guida-gentile/
├── SKILL.md              # il cuore: livelli, stop, interruzioni, tono
├── sempre-attiva.md      # lo stesso testo, da incollare dove è sempre valido
├── references/
│   ├── livelli.md        # i 3 livelli, stesso esempio riscritto per ognuno
│   ├── segnali.md        # tabelle: che segnale = che mossa
│   └── memoria.md        # il profilo, e cosa sopravvive su ogni piattaforma
├── evals/
│   └── trigger-eval.json # 20 query: 10 che devono attivarla, 10 che non devono
├── RISULTATI-EVAL.md     # cosa è stato misurato e cosa è venuto fuori
└── build.sh              # produce dist/guida-gentile.zip
```

## Leggi prima questo

Gli eval dicono una cosa che cambia il modo di installarla: **questa skill non
si attiva da sola.** Zero falsi positivi su dieci casi difficili — non parte
mai a sproposito — ma anche zero attivazioni sui dieci casi in cui dovrebbe,
con quattro descrizioni diverse provate. Il motivo, i numeri e il ragionamento
stanno in `RISULTATI-EVAL.md`.

In breve: Claude consulta una skill quando pensa di non farcela da solo, e
"aiuta mia madre con WhatsApp" gli sembra una cosa che sa già fare. Una skill
che non aggiunge una capacità ma cambia il **modo** non fa scattare niente.

Quindi ci sono due modi di usarla, tutti e due affidabili — e il secondo è
quello giusto per una skill di comportamento.

## Modo 1 — chiamarla per nome

Installala come skill normale e invocala quando serve.

**Claude Code, per te su tutti i progetti**
```bash
cp -r guida-gentile ~/.claude/skills/
```
poi `/guida-gentile` in chat.

**Claude Code, solo su un progetto**
```bash
mkdir -p .claude/skills && cp -r guida-gentile .claude/skills/
```

**claude.ai (web e desktop)**
1. `./build.sh` → produce `dist/guida-gentile.zip`
2. Impostazioni → Capabilities → Skills → carica lo zip
3. scrivi "usa la skill guida-gentile" quando ti serve

## Modo 2 — renderla sempre attiva (consigliato)

Incolla il contenuto di `sempre-attiva.md`:

| Dove | File / campo |
|---|---|
| Claude Code, un progetto | `CLAUDE.md` nella root |
| Claude Code, ovunque | `~/.claude/CLAUDE.md` |
| claude.ai | istruzioni di un **Progetto**, o uno **Stile** personalizzato |
| Cursor / Copilot | salvalo come `AGENTS.md` nella root |
| API / Agent SDK | in coda al system prompt |

Non dipende da nessun triggering, quindi funziona identico ovunque. È anche il
posto concettualmente giusto: le skill servono per i compiti, il modo di
parlare va nelle istruzioni permanenti.

## Cosa funziona dove

| | claude.ai | Claude Code | API/SDK | Cursor/Copilot |
|---|---|---|---|---|
| Chiamata per nome | sì | sì | sì | no |
| Attivazione automatica | **no** (misurato) | **no** (misurato) | no | no |
| Sempre attiva via istruzioni | sì | sì | sì | sì |
| File di riferimento caricati al bisogno | sì | sì | sì | no |
| Memoria dentro la conversazione | sì | sì | sì | sì |
| Memoria tra conversazioni | solo con memoria account attiva | sì (file) | no | dipende |

Il nucleo è puro testo e non richiede nessuno strumento: gira ovunque
identico. La memoria tra conversazioni è l'unica cosa che cambia davvero da
piattaforma a piattaforma, e `references/memoria.md` dice cosa fare quando
non c'è.

## Rifare gli eval

`evals/trigger-eval.json` contiene 20 richieste realistiche: 10 in cui la
skill deve partire (una figlia che deve spiegare WhatsApp alla madre 78enne,
SPID, 2FA per chi non è tecnico, qualcuno bloccato a metà procedura) e 10 in
cui **non** deve partire pur assomigliando molto — "spiegami passo passo
Dijkstra" per un esame, "scrivimi una guida utente", "riscrivi questo
paragrafo più semplice", "come fermo uno script in background". I negativi
sono volutamente vicini: servono a verificare che non si attivi su tutto, ed
è la parte che ha funzionato.

Il comando per rieseguirli è in fondo a `RISULTATI-EVAL.md`.
