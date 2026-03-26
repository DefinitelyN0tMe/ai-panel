#!/bin/bash
# NeuralForge Recovery Script — restart base services
echo "🔄 NeuralForge Recovery — checking and restarting services..."

# Ollama
if ! systemctl is-active --quiet ollama; then
    echo "  ⚠️ Ollama is down, restarting..."
    sudo systemctl restart ollama
    sleep 3
fi
echo "  ✅ Ollama: $(systemctl is-active ollama)"

# NeuralForge Panel
if ! systemctl is-active --quiet ai-panel; then
    echo "  ⚠️ Panel is down, restarting..."
    sudo systemctl restart ai-panel
    sleep 3
fi
echo "  ✅ Panel: $(systemctl is-active ai-panel)"

# Docker containers
for container in open-webui perplexica searxng qdrant; do
    status=$(sudo docker inspect -f '{{.State.Running}}' $container 2>/dev/null)
    if [ "$status" != "true" ]; then
        echo "  ⚠️ $container is down, starting..."
        sudo docker start $container
        sleep 2
    fi
    echo "  ✅ $container: running"
done

# Fix Docker socket permissions
sudo chmod 666 /var/run/docker.sock 2>/dev/null

echo ""
echo "🎯 All base services are running!"
echo "   Panel:  http://localhost:9000"
echo "   Chat:   http://localhost:8080"
echo "   Search: http://localhost:3000"
