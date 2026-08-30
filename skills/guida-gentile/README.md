# guida-gentile

Skill comportamentale: rende Claude una guida calma e adatta a chi non è del
mestiere. Legge il livello della persona, ricorda preferenze e correzioni,
accetta interruzioni senza impuntarsi, e si ferma davvero quando glielo dici.

```
guida-gentile/
├── SKILL.md              # il cuore: livelli, stop, interruzioni, tono
├── references/
│   ├── livelli.md        # i 3 livelli, stesso esempio riscritto per ognuno
│   ├── segnali.md        # tabelle: che segnale = che mossa
│   └── memoria.md        # il profilo, e cosa sopravvive su ogni piattaforma
├── evals/
│   └── trigger-eval.json # 20 query: 10 che devono attivarla, 10 che non devono
├── AGENTS.md             # traduzione per Cursor/Copilot (non equivalente)
└── build.sh              # produce guida-gentile.zip
```

## Installazione

**Claude.ai (web e desktop)**
1. `./build.sh` → produce `dist/guida-gentile.zip`
2. Impostazioni → Capabilities → Skills → carica lo zip

**Claude Code — per te, su tutti i progetti**
```bash
cp -r guida-gentile ~/.claude/skills/
```

**Claude Code — solo per un progetto**
```bash
mkdir -p .claude/skills && cp -r guida-gentile .claude/skills/
```

**Agent SDK / API** — punta la cartella delle skill a questa directory, o
includi `SKILL.md` nel system prompt.

**Cursor / Copilot / altro** — copia `AGENTS.md` nella root del progetto.
Leggi l'avvertenza in cima: non fa le stesse cose.

## Cosa funziona dove

| | claude.ai | Claude Code | API/SDK | Cursor/Copilot |
|---|---|---|---|---|
| Attivazione automatica dal contesto | sì | sì | sì | no (sempre attiva) |
| Livelli, stop, interruzioni | sì | sì | sì | sì, in versione ridotta |
| File di riferimento caricati al bisogno | sì | sì | sì | no |
| Memoria dentro la conversazione | sì | sì | sì | sì |
| Memoria tra conversazioni | solo se la memoria dell'account è attiva | sì (file) | no | dipende |

Il nucleo è puro testo e non richiede nessuno strumento: gira ovunque
identico. La memoria tra conversazioni è l'unica cosa che cambia davvero da
piattaforma a piattaforma, e `references/memoria.md` dice cosa fare quando
non c'è.

## Verifica del triggering

`evals/trigger-eval.json` contiene 20 richieste realistiche: 10 in cui la
skill deve partire (una figlia che deve spiegare WhatsApp alla madre, SPID,
2FA per chi non è tecnico) e 10 in cui **non** deve partire pur assomigliando
molto — "spiegami passo passo Dijkstra" per un esame, "scrivimi una guida
utente", "riscrivi questo paragrafo più semplice", "come fermo uno script in
background". I casi negativi sono volutamente vicini: servono a verificare che
la skill non si attivi su tutto.

Per rieseguirli servono Claude Code e la skill `skill-creator`:

```bash
python3 -m scripts.run_eval \
  --eval-set .../guida-gentile/evals/trigger-eval.json \
  --skill-path .../guida-gentile \
  --model claude-opus-5 --runs-per-query 3 --verbose
```

I risultati dell'ultima esecuzione sono in `RISULTATI-EVAL.md`.
