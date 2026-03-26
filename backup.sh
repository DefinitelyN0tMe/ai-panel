#!/bin/bash
# NeuralForge Backup Script
# Backs up configs, agent memory, workflows, panel, RAG data

BACKUP_DIR="/home/definitelynotme/Desktop/ai-backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP"

mkdir -p "$BACKUP_PATH"

echo "🔄 NeuralForge Backup — $TIMESTAMP"
echo ""

# 1. NeuralForge Panel
echo "📦 Panel files..."
cp -r /home/definitelynotme/Desktop/ai-panel/modules "$BACKUP_PATH/panel_modules"
cp -r /home/definitelynotme/Desktop/ai-panel/server.py "$BACKUP_PATH/panel_server.py"
cp -r /home/definitelynotme/Desktop/ai-panel/mcp_server.py "$BACKUP_PATH/panel_mcp.py"
cp -r /home/definitelynotme/Desktop/ai-panel/templates "$BACKUP_PATH/panel_templates"

# 2. Agent scripts + memory
echo "🤖 Agents and memory..."
cp -r /home/definitelynotme/Desktop/Claude_Test/agents "$BACKUP_PATH/agents" 2>/dev/null

# 3. ComfyUI workflows
echo "🎨 ComfyUI workflows..."
mkdir -p "$BACKUP_PATH/comfyui_workflows"
cp /home/definitelynotme/Desktop/ComfyUI/*.json "$BACKUP_PATH/comfyui_workflows/" 2>/dev/null

# 4. Claude settings
echo "⚙️ Claude Code settings..."
mkdir -p "$BACKUP_PATH/claude_config"
cp ~/.claude/settings.json "$BACKUP_PATH/claude_config/" 2>/dev/null
cp ~/.claude.json "$BACKUP_PATH/claude_config/" 2>/dev/null
cp /home/definitelynotme/Desktop/Claude_Test/.mcp.json "$BACKUP_PATH/claude_config/" 2>/dev/null
cp -r ~/.claude/projects/-home-definitelynotme-Desktop-Claude-Test/memory "$BACKUP_PATH/claude_config/memory" 2>/dev/null

# 5. Systemd services
echo "🔧 Systemd configs..."
mkdir -p "$BACKUP_PATH/systemd"
cp /etc/systemd/system/ai-panel.service "$BACKUP_PATH/systemd/" 2>/dev/null
cp -r /etc/systemd/system/ollama.service.d "$BACKUP_PATH/systemd/" 2>/dev/null
cp /etc/systemd/system/docker-socket-fix.service "$BACKUP_PATH/systemd/" 2>/dev/null

# 6. Ollama model list
echo "📋 Ollama models list..."
ollama list > "$BACKUP_PATH/ollama_models.txt" 2>/dev/null

# 7. Docker container configs
echo "🐳 Docker configs..."
for container in open-webui perplexica searxng qdrant; do
    docker inspect $container > "$BACKUP_PATH/docker_${container}.json" 2>/dev/null
done

# 8. SearXNG config
echo "🔍 SearXNG settings..."
cp /tmp/searxng/settings.yml "$BACKUP_PATH/searxng_settings.yml" 2>/dev/null

# Compress
echo ""
echo "📦 Compressing..."
cd "$BACKUP_DIR"
tar -czf "backup_$TIMESTAMP.tar.gz" "backup_$TIMESTAMP" 2>/dev/null
COMPRESSED_SIZE=$(du -sh "backup_$TIMESTAMP.tar.gz" 2>/dev/null | awk '{print $1}')
rm -rf "backup_$TIMESTAMP"

# Cleanup old backups (keep last 5)
ls -t "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | tail -n +6 | xargs rm -f 2>/dev/null

TOTAL_BACKUPS=$(ls "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | wc -l)

echo ""
echo "✅ Backup complete!"
echo "   File: $BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
echo "   Size: $COMPRESSED_SIZE"
echo "   Total backups: $TOTAL_BACKUPS (keeping last 5)"
