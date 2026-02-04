# 🐧 IncognitoAI Linux Setup - COMPLETE ✅

## 📦 What Was Created

A complete Linux setup folder with **TWO interfaces** for IncognitoAI:

### Folder Structure
```
linux/
├── 📄 README.md                   ← Full documentation
├── 🔧 setup.sh                    ← Automated setup script
├── ▶️  start.sh                    ← Launch Streamlit version
├── ▶️  bot.sh                      ← Launch Flask Cyberpunk version
├── 🐍 bot.py                      ← Flask application with AI
├── 📁 templates/
│   └── bot.html                   ← Web interface
└── 📁 static/
    ├── bot.css                    ← Cyberpunk styling
    └── bot.js                     ← Interactive features
```

---

## 🎯 TWO INTERFACES AVAILABLE

### 1️⃣ **STREAMLIT VERSION** (Original)
- **Command:** `./start.sh`
- **Port:** `http://localhost:8501`
- **Features:** Simple, clean interface
- **Best for:** Quick testing

### 2️⃣ **FLASK CYBERPUNK VERSION** (New!) ✨
- **Command:** `./bot.sh`
- **Port:** `http://localhost:5000`
- **Features:**
  - 🌐 Beautiful neon cyberpunk aesthetic
  - 💬 Real-time chat interface
  - 📁 Document upload with RAG
  - 🔄 RAG mode toggle
  - 🟢 System status indicator
  - 📱 Responsive design

**Recommended:** Use Flask Cyberpunk version for best experience!

---

## 🚀 QUICK START (3 Steps)

### Step 1: Initial Setup (ONE TIME)
```bash
cd linux
chmod +x setup.sh start.sh bot.sh
./setup.sh
```

This will:
- ✅ Install Python 3 (if needed)
- ✅ Create virtual environment
- ✅ Install dependencies
- ✅ Install Ollama (if needed)
- ✅ Download AI models (5-10 minutes)

### Step 2: Start Ollama (New Terminal)
```bash
ollama serve
```

### Step 3: Launch IncognitoAI (New Terminal)
```bash
cd linux
./bot.sh         # Flask Cyberpunk (recommended!)
# OR
./start.sh       # Streamlit version
```

---

## 🎨 Flask Cyberpunk Features

### Interface Design
- **Dark Theme:** Cyberpunk aesthetic with neon accents
- **Neon Colors:** Pink, cyan, purple, green glows
- **Responsive:** Works on desktop and mobile
- **Animations:** Smooth transitions and effects

### Functionality
- 💬 **Real-time Chat:** Type and get instant responses
- 📁 **Upload Documents:** PDF, TXT, Markdown support
- 🧠 **RAG Mode:** Chat with your documents
- 🔍 **Status Monitor:** See if Ollama is running
- 📊 **System Info:** Model details and features

### User Experience
- Auto-focus on input field
- Enter to send, Shift+Enter for newline
- Typing indicator while waiting for response
- Scroll to latest message
- Clean message history

---

## 📋 FILES EXPLAINED

| File | Purpose |
|------|---------|
| `setup.sh` | Automated Linux setup - installs everything |
| `start.sh` | Launches Streamlit interface (app.py) |
| `bot.sh` | Launches Flask Cyberpunk interface (bot.py) |
| `bot.py` | Flask app with AI logic and web routes |
| `bot.html` | Web page HTML structure |
| `bot.css` | Neon cyberpunk styling |
| `bot.js` | Interactive chat functionality |
| `README.md` | Complete documentation |

---

## 🔧 REQUIREMENTS

### System Requirements
- **OS:** Linux or macOS (Ubuntu 20.04+, Debian, Fedora, macOS 10.14+, etc.)
- **Python:** 3.8 or higher
- **RAM:** 4GB minimum (8GB recommended)
- **Disk:** 2GB+ free space
- **Internet:** For initial setup only

### Auto-Installed by Setup Script
- Python packages (Flask, LangChain, ChromaDB, Streamlit, etc.)
- Ollama (AI runtime)
- AI models (llama3.2:1b, all-minilm)

---

## 🌟 KEY FEATURES

### IncognitoAI Linux Setup
✅ **One-click setup** - Fully automated  
✅ **Two interfaces** - Streamlit + Flask Cyberpunk  
✅ **Beautiful design** - Modern cyberpunk aesthetic  
✅ **Fast performance** - Optimized for Linux/macOS  
✅ **RAG support** - Chat with documents  
✅ **100% offline** - No data leaves your machine  
✅ **Easy to use** - Simple shell scripts  
✅ **Well documented** - Multiple guides included  

---

## ⚙️ HOW IT WORKS

### Architecture
```
Your Computer (Linux/macOS)
    ↓
Ollama (AI Engine) - Port 11434
    ↓
Flask App (Web Interface) - Port 5000
    ↓
Browser (http://localhost:5000)
```

### Data Flow
1. **User Input** → Web browser sends message
2. **Processing** → Flask app prepares query
3. **AI Response** → Ollama generates response
4. **Display** → Flask sends response to browser
5. **ALL LOCAL** → Nothing leaves your computer

---

## 📝 USAGE EXAMPLES

### Basic Chat
1. Open http://localhost:5000
2. Type your question
3. Press Enter
4. Get instant response

### RAG Mode (Chat with Documents)
1. Click 📁 button
2. Select PDF/TXT/Markdown file
3. Upload completes automatically
4. Enable "RAG" toggle
5. Ask questions about your document

### Models
- **llama3.2:1b** - Fast, efficient AI model
- **all-minilm** - Embedding model for document search

---

## 🐛 TROUBLESHOOTING

### Setup Issues

**Q: "ollama: command not found"**
```bash
curl -fsSL https://ollama.ai/install.sh | sh
```

**Q: "Python not found"**
```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install python3 python3-pip

# macOS
brew install python@3.11
```

**Q: "Permission denied on script"**
```bash
chmod +x setup.sh start.sh bot.sh
```

### Runtime Issues

**Q: "Connection refused" on port 5000**
```bash
# Port already in use - edit bot.py:
# Find: app.run(debug=True, host='0.0.0.0', port=5000)
# Change to: app.run(debug=True, host='0.0.0.0', port=5001)
```

**Q: "Ollama offline" warning**
- Make sure to run `ollama serve` in another terminal

**Q: "Models not loading"**
```bash
ollama pull llama3.2:1b
ollama pull all-minilm
```

---

## 🔒 PRIVACY & SECURITY

✅ **100% Offline** - No data sent anywhere  
✅ **No Tracking** - Zero telemetry  
✅ **No Ads** - Clean interface  
✅ **Open Source** - MIT License  
✅ **Your Data** - Stored only on your machine  
✅ **No Account** - No login required  

---

## 📚 DOCUMENTATION

- **[README.md](README.md)** - Complete Linux/macOS setup guide
- **[../README.md](../README.md)** - Main project documentation
- **Ollama:** https://ollama.ai
- **Flask:** https://flask.palletsprojects.com
- **Streamlit:** https://streamlit.io

---

## 💡 TIPS & TRICKS

1. **Use both interfaces** - Try Streamlit and Cyberpunk
2. **Upload documents** - Test RAG with your PDFs
3. **Clear database** - Delete `.chroma_db` folder to reset
4. **Customize theme** - Edit `static/bot.css`
5. **Different models** - Change `MODEL_NAME` in `bot.py`

---

## 🎓 LEARNING PATH

1. Run setup script: `./setup.sh`
2. Read documentation: `README.md`
3. Try Flask Cyberpunk: `./bot.sh`
4. Upload a test document
5. Explore RAG mode
6. Customize and extend

---

## 📞 SUPPORT

Having issues? Check:
1. README.md - Detailed setup guide
2. ../README.md - Main documentation
3. Terminal error messages - Usually very helpful
4. GitHub Issues - Open an issue if stuck

---

## 🎉 YOU'RE ALL SET!

Your Linux/macOS IncognitoAI setup is complete and ready to use.

### Next Steps:
1. Run `./setup.sh` in the linux folder
2. Start Ollama in another terminal: `ollama serve`
3. Launch the Cyberpunk interface: `./bot.sh`
4. Open http://localhost:5000
5. Start chatting!

**Enjoy your private, offline AI assistant!** 🌐✨

---

*IncognitoAI - Made with ❤️ for privacy-conscious users*
*MIT License - Open Source*
