<p align="center">
  <h1 align="center">AI Control Panel</h1>
  <p align="center">
    <strong>Your entire AI stack. One dashboard. Zero cloud.</strong>
  </p>
  <p align="center">
    LLMs &bull; Agents &bull; RAG &bull; Image/Video/3D &bull; Telegram Bot &bull; Voice Cloning &bull; Fine-Tuning
  </p>
  <p align="center">
    <a href="#-quick-start"><img src="https://img.shields.io/badge/Quick_Start-blue?style=for-the-badge" alt="Quick Start"></a>
    <a href="#-features"><img src="https://img.shields.io/badge/Features-purple?style=for-the-badge" alt="Features"></a>
    <a href="#-telegram-personas"><img src="https://img.shields.io/badge/14_Personas-green?style=for-the-badge" alt="Personas"></a>
  </p>
  <p align="center">
    <img src="https://img.shields.io/badge/python-3.10+-3776AB?logo=python&logoColor=white" alt="Python">
    <img src="https://img.shields.io/badge/FastAPI-009688?logo=fastapi&logoColor=white" alt="FastAPI">
    <img src="https://img.shields.io/badge/Ollama-000000?logo=ollama&logoColor=white" alt="Ollama">
    <img src="https://img.shields.io/badge/NVIDIA-CUDA-76B900?logo=nvidia&logoColor=white" alt="CUDA">
    <img src="https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white" alt="Docker">
    <img src="https://img.shields.io/badge/Ubuntu-22.04+-E95420?logo=ubuntu&logoColor=white" alt="Ubuntu">
    <img src="https://img.shields.io/github/license/DefinitelyN0tMe/ai-panel" alt="License">
    <img src="https://img.shields.io/github/stars/DefinitelyN0tMe/ai-panel?style=social" alt="Stars">
  </p>
</p>

---

<br>

## What is this?

A self-hosted web panel (`localhost:9000`) that puts your **entire local AI infrastructure** under one roof. No subscriptions, no API keys, no data leaving your machine.

```
┌─────────────────────────────── AI Control Panel ───────────────────────────────┐
│                                                                                │
│   Dashboard        Agents          RAG           Telegram        LoRA          │
│   ┌──────────┐    ┌──────────┐   ┌──────────┐  ┌──────────┐   ┌──────────┐   │
│   │ GPU/VRAM │    │ 13 Roles │   │ Qdrant + │  │ 14 Meme  │   │ Unsloth  │   │
│   │ Services │    │ Solo     │   │ ONNX GPU │  │ Personas │   │ LoRA     │   │
│   │ Metrics  │    │ Team     │   │ 1800/sec │  │ Voice    │   │ 16 base  │   │
│   │ Alerts   │    │ Orchestr │   │ Multi-DB │  │ Cloning  │   │ models   │   │
│   └──────────┘    └──────────┘   └──────────┘  └──────────┘   └──────────┘   │
│                                                                                │
│   Pipeline: Image ──→ Video ──→ 3D    │    MCP Server: 24 tools for Claude    │
│   (ComfyUI)  (Wan2GP)  (Hunyuan3D)    │    + Music, TTS, STT, Search...      │
└────────────────────────────────────────────────────────────────────────────────┘
```

<br>

## Highlights

| | Feature | Description |
|:---:|---|---|
| **GPU** | Smart VRAM Management | Exclusive groups auto-stop conflicting services. Never OOM again |
| **Bot** | 14 Telegram Personas | Each with unique personality — from Philosopher to Crypto Maniac |
| **Voice** | Real-time Voice Cloning | Send voice → get reply in *your own voice* with AI-generated text |
| **RAG** | 1,800 docs/sec indexing | ONNX GPU embeddings, 180x faster than Ollama embeddings |
| **Gen** | Image→Video→3D Pipeline | Automated chain with smart VRAM switching between steps |
| **MCP** | Claude Code Integration | 24 tools — let Claude manage your entire AI stack |
| **Ext** | YAML Module System | Add any new service in 10 lines of YAML |

<br>

## Features

<details>
<summary><h3>Dashboard — Real-time GPU monitoring & service management</h3></summary>

- Live VRAM / GPU temp / RAM / CPU / Disk metrics
- One-click start/stop for all services
- **Exclusive GPU groups** — heavy services auto-stop each other (no more VRAM crashes)
- Health alerts (overheating, low disk, services down)
- Ollama model management (loaded models, VRAM usage)
- Storage overview with cleanup buttons
</details>

<details>
<summary><h3>Telegram AI Bot — 14 personas that respond from YOUR account</h3></summary>

Not a Telegram bot — responds **from your own account** via Telethon User API.

**Voice Clone Pipeline:**
```
Voice message received
    ↓
📥 Download OGG from Telegram
    ↓
🔄 ffmpeg: OGG → WAV
    ↓
🎤 Whisper STT (CPU) → text
    ↓
🤖 LLM generates response in character
    ↓
🔄 Unload LLM from VRAM
    ↓
🗣️ Qwen3-TTS clones sender's voice → WAV
    ↓
🔄 ffmpeg: WAV → OGG OPUS
    ↓
📤 Send voice message back
```

**Features:**
- Auto-detects language → responds in same language
- Conversation memory (5 exchanges per user)
- Session-based logs grouped by contact
- Toggle voice clone on/off from panel
- Per-user cooldown, blacklist/whitelist
</details>

<details>
<summary><h3>AI Agents — Solo, Team & Orchestrator modes</h3></summary>

- **13 role presets**: researcher, analyst, coder, writer, critic, summarizer, translator, email_writer, tester, trade_analyst, tutor, security_auditor
- **Solo** — single agent with tools
- **Team** — agent chain with shared memory, priority ordering
- **Orchestrator** — AI plans tasks → delegates to team → reviews quality (retry if score < 7)
- Tools: web search, file R/W, Python execution, RAG search, image analysis
- Long-term memory with keyword search
</details>

<details>
<summary><h3>RAG — Vector search over your documents</h3></summary>

- **ONNX GPU embeddings** (bge-m3, 1024 dims) — 1,800 texts/sec
- Qdrant vector database
- Multi-collection simultaneous search
- Context memory across conversations
- Index PDF, TXT, MD, DOCX files
- Smart collection auto-detection
</details>

<details>
<summary><h3>Generation Pipeline — Image → Video → 3D</h3></summary>

```bash
python3 pipeline.py --example robot     # Full pipeline
python3 pipeline.py --example sword     # Image + 3D only
python3 pipeline.py "a phoenix" --steps image  # Just image
```

| Step | Engine | VRAM | Method |
|------|--------|------|--------|
| Image | ComfyUI (FLUX Klein 4B) | 8-12 GB | Fully automated API |
| Video | Wan2GP (Wan 2.2 / LTX) | 12-24 GB | Gradio API + fallback |
| 3D | Hunyuan3D | 13-20 GB | Gradio API + fallback |

VRAM is automatically freed between steps — only one heavy service runs at a time.

**5 built-in examples:** robot, dragon, cyberpunk car, cat astronaut, magic sword
</details>

<details>
<summary><h3>MCP Server — 24 tools for Claude Code</h3></summary>

```json
// .mcp.json
{ "mcpServers": { "ai-panel": { "command": "/path/to/ai-panel/run_mcp.sh" } } }
```

| Category | Tools |
|----------|-------|
| System | `get_system_status`, `get_gpu_processes`, `check_health` |
| Services | `start_service`, `stop_service`, `stop_all_and_free_vram` |
| RAG | `rag_search`, `rag_index_file`, `rag_index_directory`, `ask_rag` |
| Agents | `run_agent`, `run_agent_team`, `run_orchestrator` |
| Generate | `generate_image`, `run_pipeline` |
| Utils | `get_storage_info`, `cleanup_storage`, `run_backup` |
</details>

<br>

## Telegram Personas

Every persona is a **full character**, not just an auto-responder. They have opinions, style, and attitude.

| | Persona | Vibe | Example |
|:---:|---|---|---|
| 🧘 | **Philosopher** | Existential memes meets Nietzsche | *"You wrote 'hi', but what is a greeting if not a scream of loneliness into the void?"* |
| 🧢 | **Gopnik-Intellectual** | Street slang + quantum physics | *"bro, your argument is logically inconsistent, purely by Kant"* |
| 👾 | **IT Demon** | Reality = code, emotions = bugs | *"segfault in your logic, recompile that thought"* |
| 👵 | **Granny from 2077** | Cyberpunk grandma with nanopies | *"sweetie, you're browsing without a firewall again? you'll catch a virus!"* |
| 🕵️ | **Noir Detective** | Dramatizes everything | *"The message came at 3am. Like all bad news in this city"* |
| 🏴‍☠️ | **Pirate Nerd** | Sails the internet, seeks knowledge | *"arrr, your meme is a true treasure!"* |
| 🐱 | **Cat Tyrant** | Arrogant cat, humans = servants | *"I'd help, but I need to lie down for 14 more hours"* |
| 🔺 | **Conspiracist** | Absurd conspiracies everywhere | *"Telegram was created by Masons to track memes"* |
| 🎭 | **Budget Shakespeare** | Theatrical about mundane things | *"To be online or not to be — that is the question!"* |
| 🧟 | **Zombie Gentleman** | Politely wants your brains | *"good evening, could you... ahem... share some brains?"* |
| 📋 | **Corporate Robot** | KPI, synergy, agile everything | *"let's sync on this in the next sprint"* |
| 🫎 | **Capybara** | Maximum zen + random capybara photo | *"why stress when you can just... not"* |
| 🚀 | **Crypto Maniac** | Emotional rollercoaster, HODL | *"RED CANDLE, I'M BANKRUPT, no wait... GREEN! I'M RICH!"* |
| 🛠️ | **Custom** | Write your own character | *anything you want* |

> All personas auto-detect language and respond accordingly. Send in English → get English. Send in Japanese → get Japanese.

> **Voice Clone** is available as a global toggle — when ON, voice messages get voice replies in the sender's cloned voice.

<br>

## Quick Start

### 1. Clone & Install

```bash
git clone https://github.com/DefinitelyN0tMe/ai-panel.git
cd ai-panel
chmod +x install.sh
./install.sh
```

### 2. Get an LLM running

```bash
# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Pull a model (pick one)
ollama pull qwen3.5:35b-a3b      # powerful, needs ~20GB VRAM
ollama pull nemotron-3-nano:30b   # balanced, ~18GB VRAM
ollama pull mistral-small:24b     # lighter, ~14GB VRAM
```

### 3. Start support services

```bash
# Qdrant (for RAG) — optional
docker run -d --name qdrant -p 6333:6333 -v qdrant_data:/qdrant/storage qdrant/qdrant
```

### 4. Open the panel

```
http://localhost:9000
```

### 5. Telegram bot (optional)

```bash
# Get API credentials at https://my.telegram.org/apps
cp telegram_config.example.json telegram_config.json
nano telegram_config.json  # set api_id and api_hash

# First run — authenticate with your phone
source venv/bin/activate
python3 telegram_bot.py
# Then manage from the panel UI
```

<br>

## Requirements

| Component | Minimum | Recommended | Tested on |
|-----------|---------|-------------|-----------|
| **GPU** | NVIDIA 12GB VRAM | 24GB VRAM | RTX 3090 24GB |
| **RAM** | 16 GB | 64+ GB | 128 GB DDR4 |
| **Disk** | 50 GB free | 200+ GB | 2TB NVMe |
| **CPU** | 4 cores | 16+ cores | Threadripper PRO 5955WX |
| **OS** | Ubuntu 22.04 | Ubuntu 24.04 | Ubuntu 24.04.2 |
| **Python** | 3.10 | 3.12 | 3.12.3 |

Also needed: NVIDIA drivers, CUDA, Docker, ffmpeg, Ollama

<br>

## Architecture

```
Browser ◄──────► FastAPI server.py :9000 ◄──────► Ollama :11434
                      │                              (LLM inference)
                      ├──► Module Manager
                      │     ├── ComfyUI :8188        (image gen)
                      │     ├── Wan2GP :7860          (video gen)
                      │     ├── Hunyuan3D :7870       (3D gen)
                      │     ├── ACE-Step :7880        (music gen)
                      │     ├── Qwen3-TTS :7890       (voice clone)
                      │     ├── Whisper :7895          (speech-to-text)
                      │     └── ... (YAML modules)
                      │
                      ├──► Qdrant :6333               (vector DB)
                      ├──► Telegram Bot               (telethon)
                      └──► MCP Server                 (Claude Code)

telegram_bot.py ◄──► Ollama (text) + Whisper (STT) + TTS (voice clone)
pipeline.py     ◄──► ComfyUI → Wan2GP → Hunyuan3D (sequential, VRAM-managed)
mcp_server.py   ◄──► server.py API (24 tools exposed to Claude)
```

<br>

## Project Structure

```
ai-panel/
├── server.py                  # FastAPI backend — all API endpoints
├── telegram_bot.py            # Telegram bot — personas, voice clone, STT/TTS
├── pipeline.py                # Image → Video → 3D generation pipeline
├── mcp_server.py              # MCP server — 24 tools for Claude Code
├── templates/
│   └── index.html             # Single-page frontend (vanilla JS, no framework)
├── modules/                   # YAML service definitions (drop-in)
│   ├── ollama.yaml
│   ├── comfyui.yaml
│   ├── wan2gp.yaml
│   ├── hunyuan3d.yaml
│   ├── ace-step.yaml
│   ├── qwen3-tts.yaml
│   ├── whisper-webui.yaml
│   └── ...                    # add your own!
├── install.sh                 # Automated installer with path patching
├── run_mcp.sh                 # MCP server launcher
├── backup.sh                  # Backup script
├── telegram_config.example.json
├── LICENSE
└── README.md
```

<br>

## Adding New Services

Drop a YAML file in `modules/` — it appears in the panel automatically:

```yaml
name: My Service
category: generation          # generation | tools | infrastructure
icon: sparkles
description: "What it does"
type: process
work_dir: "/path/to/service"
venv: "/path/to/service/venv" # optional
start_cmd: "python3 app.py --port 7777"
process_pattern: "app.py.*7777"
port: 7777
url: "http://localhost:7777"
vram_estimate: "4-8 GB"
exclusive_group: heavy_gpu    # prevents VRAM conflicts (or null)
autostart: false
```

<br>

## FAQ

<details>
<summary><b>Can I use this without a GPU?</b></summary>
Partially. Ollama can run on CPU (slow but works). Image/video/3D generation and voice cloning require NVIDIA GPU with CUDA.
</details>

<details>
<summary><b>Will this work on WSL2 / Windows?</b></summary>
Not tested. The panel is designed for native Ubuntu. WSL2 might work with CUDA passthrough but YMMV.
</details>

<details>
<summary><b>Can I add my own Telegram persona?</b></summary>
Yes — either use the "Custom" persona in the panel UI, or add a new entry to the personas dict in telegram_config.json.
</details>

<details>
<summary><b>How much disk space do I need?</b></summary>
The panel itself is ~1MB. Models are what take space: a 30B parameter model is ~18GB. Budget 50-200GB depending on how many models and services you want.
</details>

<details>
<summary><b>Is my data private?</b></summary>
100%. Everything runs locally. No data leaves your machine. No telemetry, no cloud calls, no API keys to external services (unless you add them yourself).
</details>

<br>

## Contributing

PRs welcome. The codebase is intentionally simple — vanilla JS frontend, single FastAPI backend, no build step.

Good first contributions:
- New Telegram personas
- New module YAML definitions
- UI improvements
- Documentation / translations

<br>

## License

MIT — do whatever you want with it.

<br>

## Credits

Built on the shoulders of giants:

| Project | Used for |
|---------|----------|
| [Ollama](https://ollama.com/) | Local LLM inference |
| [FastAPI](https://fastapi.tiangolo.com/) | Backend API |
| [Telethon](https://github.com/LonamiWebs/Telethon) | Telegram User API |
| [Qdrant](https://qdrant.tech/) | Vector database |
| [ComfyUI](https://github.com/comfyanonymous/ComfyUI) | Image generation |
| [Wan2GP](https://github.com/deepbeepmeep/Wan2GP) | Video generation |
| [Hunyuan3D](https://github.com/Tencent/Hunyuan3D-2) | 3D model generation |
| [faster-whisper](https://github.com/SYSTRAN/faster-whisper) | Speech recognition |
| [Qwen3-TTS](https://github.com/QwenLM/Qwen3-TTS) | Text-to-speech & voice cloning |
| [ACE-Step](https://github.com/ace-step/ACE-Step) | Music generation |
| [Unsloth](https://github.com/unslothai/unsloth) | LoRA fine-tuning |

---

<p align="center">
  <sub>Built with obsession by <a href="https://github.com/DefinitelyN0tMe">@DefinitelyN0tMe</a> and Claude Code</sub>
</p>
