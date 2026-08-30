# Risultati degli eval di attivazione

Misurato il 30 agosto 2026, con `skill-creator` su Claude Code 2.1.251,
modello `claude-opus-5`. Set: `evals/trigger-eval.json`, 20 richieste
realistiche (10 che devono attivare la skill, 10 che non devono ma le
assomigliano), ogni richiesta eseguita 3 volte.

## Esito

| Descrizione provata | Falsi positivi | Attivazioni corrette |
|---|---|---|
| Originale | 0 / 10 | **0 / 10** |
| Riscritta dall'ottimizzatore (iter. 2) | 0 / 10 | **0 / 10** |
| Riscritta dall'ottimizzatore (iter. 3) | 0 / 10 | **0 / 10** |
| Riformulata come "cosa produce" | 0 / 10 | **0 / 10** |

Su 12 casi di train e 8 di test, con holdout al 40%: 6/12 e 4/8 in tutte e tre
le iterazioni del loop, cioè esattamente i soli casi negativi. Nessun caso
positivo ha superato la soglia; i pochi che si sono mossi si sono fermati a
1 attivazione su 3.

## Cosa vuol dire

La skill **non si attiva da sola**, e non è un problema di come è scritta la
descrizione: quattro formulazioni diverse, incluse due generate
automaticamente dall'ottimizzatore proprio per correggere i fallimenti, danno
lo stesso zero.

Il motivo è nel meccanismo: Claude consulta una skill quando ritiene di non
poter svolgere il compito da solo. "Spiegami come attivare lo SPID" o "aiuta
mia madre con WhatsApp" gli sembrano cose che sa già fare — e infatti le sa
fare, solo che le fa *a modo suo*. Una skill che non aggiunge una capacità ma
cambia il **modo** non produce nessun segnale di "qui mi serve aiuto". Le
skill che si attivano bene sono quelle legate a un compito con un artefatto:
un .docx, un PDF, un grafico.

Il rovescio della medaglia è l'unico dato positivo, ed è solido: **zero falsi
positivi su dieci casi vicini** — "spiegami passo passo Dijkstra", "scrivimi
una guida utente", "riscrivi questo paragrafo più semplice", "come fermo uno
script in background". Non si attiva a sproposito.

## Conseguenza pratica

Il contenuto della skill resta valido: quando è in contesto, funziona. Cambia
**come farcela arrivare**, e sono due strade, entrambe affidabili:

1. **Invocarla per nome** quando serve — in Claude Code `/guida-gentile`,
   altrove "usa la skill guida-gentile". Attivazione esplicita, sempre.
2. **Renderla sempre attiva** incollando `sempre-attiva.md` in `CLAUDE.md`,
   nelle istruzioni di un Progetto su claude.ai, o come Stile personalizzato.
   È il posto giusto per le istruzioni di comportamento, e non dipende da
   nessun triggering.

Per una skill di comportamento la strada 2 è quella da preferire. Le skill
sono fatte per i compiti; il modo di parlare va nelle istruzioni permanenti.

## Rieseguire la misura

```bash
cd <cartella di skill-creator>
python3 -m scripts.run_eval \
  --eval-set <path>/guida-gentile/evals/trigger-eval.json \
  --skill-path <path>/guida-gentile \
  --model claude-opus-5 --runs-per-query 3 --verbose
```
