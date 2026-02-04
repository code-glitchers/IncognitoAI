#!/bin/bash

# IncognitoAI Streamlit Starter (Linux/macOS)
# Launch the IncognitoAI assistant with Streamlit

echo "🚀 Starting IncognitoAI Streamlit Assistant..."
echo ""

# Activate virtual environment
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Run setup.sh first!"
    exit 1
fi

source venv/bin/activate

# Check if Ollama is running
echo "🔍 Checking if Ollama is running..."
if ! curl -s http://localhost:11434 > /dev/null 2>&1; then
    echo "⚠️  Ollama is not running. Please start Ollama in another terminal with:"
    echo "   ollama serve"
    echo ""
    read -p "Press Enter to continue anyway, or Ctrl+C to cancel..."
fi

# Start the Streamlit app
echo ""
echo "🎨 Launching IncognitoAI Assistant..."
echo "📱 Opening browser at: http://localhost:8501"
echo ""
streamlit run ../app.py

