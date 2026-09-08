<img src="https://raw.githubusercontent.com/vidoluco/vidoluco/main/header.svg" alt="Ludovico Cesaro. Agents that do real work on a Mac. Local first, output on disk." width="100%">

Software engineer working on agentic AI. Multi-agent systems on Google Cloud at work, local-first tooling for macOS here. I use Claude Code, Copilot, Cursor and Antigravity on the same codebases, with one shared set of rules, so most of what I publish comes out of that setup: tools that capture, transcribe or guard data on the machine instead of sending it away.

### Setup

<img src="https://raw.githubusercontent.com/vidoluco/vidoluco/main/herd.svg" alt="Four coding CLIs read one private knowledge base on a Mac and write notes, transcripts and local commits to disk. git push is blocked by a shim." width="100%">

Four CLIs, one Mac, one private knowledge base they all read. Unattended runs (loops, headless sessions, subagents) commit locally and stop there: a `git` and `gh` shim ahead of `PATH` exits 1 on anything that writes to a remote. Push and PR are manual.

### [lightweight-rec](https://github.com/vidoluco/lightweight-rec)

<a href="https://github.com/vidoluco/lightweight-rec"><img src="https://raw.githubusercontent.com/vidoluco/vidoluco/main/rec-flow.svg" alt="Option R, then capture at 1 fps with the mic, Whisper on the machine, an optional pass through the claude CLI for title, tags and summary, and a Markdown note in your vault." width="100%"></a>

Option+R. Screen and microphone recorded at 1 fps, about 110 MB an hour, transcribed with Whisper on the machine and filed as a Markdown note in the vault you already use. The capture never leaves the Mac. The title, tags and summary do, through the `claude` CLI, unless you set `RECORD_CLAUDE=0`.

```
git clone https://github.com/vidoluco/lightweight-rec.git && cd lightweight-rec && ./install.sh
```

### Smaller things

| | | |
|---|---|---|
| [query-sanitizer-mcp](https://github.com/vidoluco/query-sanitizer-mcp) | MCP middleware. A local model redacts sensitive data from a prompt before it reaches an external LLM. | Python |
| [gfn-overlay](https://github.com/vidoluco/gfn-overlay) | macOS overlay that captures the screen and gets gameplay tips from a local vision model (LM Studio). | Python |
| [xbox-llm-controller](https://github.com/vidoluco/xbox-llm-controller) | A local LLM drives an Xbox controller on macOS. | Python |
| [Discord-mirror](https://github.com/vidoluco/Discord-mirror) | Mirrors a Discord channel to another one live, no elevated rights needed. | JavaScript |
| [TradingView-Indicators](https://github.com/vidoluco/TradingView-Indicators) | Pine Script indicators and strategies I actually use. | Pine |
