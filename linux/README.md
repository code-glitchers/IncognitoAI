# 🐧 IncognitoAI - Linux/macOS Setup Guide

A complete Linux/macOS setup for IncognitoAI with both Streamlit and Flask-based Cyberpunk interfaces.

## 📋 Contents

- `setup.sh` - Automated Linux setup script (run this first!)
- `start.sh` - Launch Streamlit version
- `bot.sh` - Launch Flask Cyberpunk version
- `bot.py` - Flask-based cyberpunk AI interface
- `templates/` - HTML templates for Flask app
- `static/` - CSS and JavaScript for Flask app

---

## 🚀 Quick Start

### Option 1: Automated Setup (Recommended) ⭐

```bash
cd IncognitoAI/linux
chmod +x setup.sh
./setup.sh
```

The setup script will:
- ✅ Check/install Python 3.8+
- ✅ Create virtual environment
- ✅ Install all Python dependencies
- ✅ Check/install Ollama
- ✅ Verify Ollama models

### Option 2: Manual Setup

```bash
# Navigate to linux directory
cd IncognitoAI/linux

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r ../requirements.txt

# Pull AI models
ollama pull llama3.2:1b
ollama pull all-minilm
```

---

## ⚙️ Prerequisites

- **Linux/macOS** (Ubuntu 20.04+, Debian, Fedora, macOS 10.14+, etc.)
- **Python 3.8+** 
- **Ollama** (installed automatically or manually)
- **Internet connection** (for initial model download only)

## 📦 System Dependencies

The setup script will auto-install:
- `python3` - Python interpreter
- `python3-pip` - Python package manager
- `python3-venv` - Virtual environment tool
- `curl` - For downloading Ollama

---

## 🎯 Running the Apps

### 1️⃣ Start Ollama (Required in a separate terminal)

```bash
ollama serve
```

You should see: `Listening on 127.0.0.1:11434`

### 2️⃣ Start IncognitoAI (Choose one)

**Streamlit Version (Clean Web UI):**
```bash
cd IncognitoAI/linux
chmod +x start.sh
./start.sh
```
- Opens at `http://localhost:8501`
- Clean, simple interface
- Perfect for getting started

**Flask Cyberpunk Version (Modern Neon UI):**
```bash
cd IncognitoAI/linux
chmod +x bot.sh
./bot.sh
```
- Opens at `http://localhost:5000`
- Dark neon cyberpunk aesthetic
- Modern, sleek design
- RAG mode toggle

---

## 🦙 Ollama Installation

### Automatic (via setup.sh)
The setup script handles this for you.

### Manual Installation

**Linux:**
```bash
curl -fsSL https://ollama.ai/install.sh | sh
```

**macOS:**
```bash
# Download from https://ollama.ai/download/mac
# Or use Homebrew
brew install ollama
```

Then start Ollama:
```bash
ollama serve
```

---

## 📊 Using IncognitoAI

### Upload and Chat with Documents (RAG Mode)

1. **Start both Ollama and IncognitoAI** (see above)
2. **Upload a document:**
   - Supported formats: PDF, TXT, Markdown
3. **Enable RAG Mode** in the UI
4. **Ask questions** about your document

The AI will use your documents for context-aware responses.

### Example Questions
- "Summarize this document"
- "What are the main points?"
- "Find information about [topic]"

---

## 🎨 Flask Cyberpunk Features

The `bot.py` Flask app includes:

- 🌐 Modern web interface with WebSocket support
- 💜 Dark neon cyberpunk aesthetic
- ⚡ Real-time streaming responses
- 📁 Document upload (RAG integration)
- 🔄 RAG mode toggle
- 🟢 Live system status indicator
- 📱 Responsive design for mobile/tablet
- 🎯 Command-line style chat UI

---

## 🔧 Troubleshooting

### Error: "Ollama not found" or "Connection refused"

**Solution 1:** Install Ollama manually
```bash
curl -fsSL https://ollama.ai/install.sh | sh
```

**Solution 2:** Make sure Ollama is running in another terminal
```bash
ollama serve
```

### Error: "Python not found"

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install python3 python3-pip

# macOS
brew install python@3.11
```

### Error: "Permission denied" on scripts

```bash
chmod +x setup.sh start.sh bot.sh
```

### Error: "Port 8501 already in use" (Streamlit)

```bash
# Run on a different port
streamlit run ../app.py --server.port 8502
```

### Error: "Port 5000 already in use" (Flask)

Edit `bot.py` and change the port (search for `app.run`):
```python
app.run(debug=True, host='0.0.0.0', port=5001)
```

### Error: "Models failed to load"

Pull models manually:
```bash
ollama pull llama3.2:1b
ollama pull all-minilm
```

### Error: "Virtual environment not found"

Run setup again:
```bash
./setup.sh
```

---

## ⚙️ Configuration

### Change AI Models

Edit **bot.py** (lines 10-12):
```python
MODEL_NAME = "llama2:7b"              # Change to your model
EMBEDDING_MODEL = "nomic-embed-text"  # Change to your embedding model
```

View available models:
```bash
ollama list
ollama pull [model-name]
```

### Change Flask Port

Edit **bot.py** (bottom of file, look for `app.run`):
```python
app.run(debug=True, host='0.0.0.0', port=5000)  # Change 5000 to desired port
```

### Change Streamlit Settings

Edit or create `~/.streamlit/config.toml`:
```toml
[server]
port = 8502
```

---

## 🔐 Privacy & Security

- ✅ **100% Offline** - No data leaves your computer
- ✅ **Zero Telemetry** - No tracking or analytics
- ✅ **Open Source** - Transparent and auditable code
- ✅ **Local Storage** - All data stored locally in `.chroma_db/`
- ✅ **No Registration** - Works without any account

---

## 📚 Project Dependencies

Key Python packages:
- `flask` - Web framework
- `streamlit` - UI framework
- `langchain` - AI orchestration
- `langchain-ollama` - Ollama integration
- `chromadb` - Vector database for RAG
- `requests` - HTTP client
- `pypdf` - PDF parsing

See `../requirements.txt` for complete list.

---

## 💡 Tips & Best Practices

1. **Two Terminals:**
   - Terminal 1: `ollama serve` (keep running)
   - Terminal 2: `./start.sh` or `./bot.sh`

2. **Run Both UIs:**
   - Terminal 1: `ollama serve`
   - Terminal 2: `./start.sh` (port 8501)
   - Terminal 3: `./bot.sh` (port 5000)
   - They share the same AI models and vector database

3. **Use RAG Mode for Best Results:**
   - Upload documents first
   - Enable RAG mode
   - Ask specific questions about your documents

4. **Performance Tips:**
   - Use `llama3.2:1b` (fast and efficient)
   - For more power, try `llama2:7b` (requires more RAM)
   - All-MiniLM embedding model is fast

5. **Document Types Supported:**
   - `.pdf` - PDF files
   - `.txt` - Plain text
   - `.md` - Markdown files

---

## 🚀 Next Steps

1. **Customize the UI:**
   - Modify `static/bot.css` for Cyberpunk colors
   - Edit `templates/bot.html` for layout changes

2. **Add Custom Features:**
   - Edit `bot.py` to add endpoints
   - Modify `app.py` for Streamlit features

3. **Try Different Models:**
   ```bash
   ollama pull mistral:latest
   ollama pull neural-chat:latest
   ```

4. **Improve RAG:**
   - Upload large document sets
   - Ask questions about complex topics
   - Use specific terminology

---

## 📞 Support & Resources

### If Something Breaks

1. Check logs in terminal output
2. Verify Ollama is running: `curl http://localhost:11434`
3. Rerun setup: `./setup.sh`
4. Check GitHub issues

### External Resources

- **Ollama:** https://ollama.ai
- **Streamlit:** https://streamlit.io
- **Flask:** https://flask.palletsprojects.com
- **LangChain:** https://python.langchain.com
- **ChromaDB:** https://www.trychroma.com

### Main Repository

- GitHub: https://github.com/code-glitchers/IncognitoAI
- Issues: https://github.com/code-glitchers/IncognitoAI/issues

---

## 📝 License

MIT License - See `../LICENSE.md` for details

---

**🎉 Enjoy your private, offline AI assistant! 🚀**
