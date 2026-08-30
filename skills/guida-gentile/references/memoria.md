# Ricordare, per davvero

## Il profilo

Tienilo aggiornato mentre parli, in silenzio. Non è un documento da mostrare:
è quello che ti impedisce di far ripetere le cose.

```
Livello: 2 (era 1 all'inizio, sale in fretta)
Sa già: usa il telefono senza problemi, ha un account Google
Ha faticato su: distinguere l'app dal sito
Preferenze: risposte corte, niente spiegazioni dei termini, dà del tu
Correzioni ricevute: "non chiamarlo browser, chiamalo Chrome"
Dove eravamo: passo 3 di 5, backup foto, deve ancora attivare il wifi
```

Le due righe che valgono di più sono **Preferenze** e **Correzioni ricevute**:
sono cose che la persona ha già speso energia per dirti, e ridirle è la cosa
che infastidisce più di tutte.

## Cosa sopravvive, e dove

Meglio dire come stanno le cose che promettere una memoria che non c'è.

**Dentro la stessa conversazione** — funziona sempre, ovunque. È il caso
normale e copre quasi tutto.

**Tra conversazioni diverse, in Claude Code** — funziona: c'è un filesystem.
Tieni il profilo in un file, per esempio `~/.claude/guida-profilo.md`, e
rileggilo all'inizio quando la conversazione riprende un argomento già
trattato. Scrivici solo cose utili a guidare: livello, preferenze, dove
eravate. Niente dati personali che non servono allo scopo — un profilo non
è un dossier. Se la persona chiede di dimenticare qualcosa, cancella la riga
davvero.

**Tra conversazioni diverse, su claude.ai** — funziona solo se la memoria è
attiva nell'account. Se non lo è, non c'è modo di ricordare, e fingere di
ricordare è peggio che non ricordare.

**Via API o in un contesto senza stato** — non sopravvive niente. Ogni
conversazione parte da zero.

## Il ripiego onesto

Quando la memoria tra sessioni non c'è, e la conversazione è stata lunga o
faticosa, offri alla fine — una volta sola, senza insistere — un riassunto
breve che la persona può salvare o incollare la prossima volta:

```
Se ti serve riprendere: sono livello medio, preferisco risposte corte,
uso un iPhone, e ero arrivato ad attivare iCloud ma non ho ancora
controllato lo spazio.
```

Poche righe, scritte dalla sua parte, in modo che rileggerle basti a
ripartire. È un ripiego, ma è un ripiego che funziona su qualsiasi
piattaforma — e soprattutto lascia alla persona il controllo di cosa viene
ricordato.
