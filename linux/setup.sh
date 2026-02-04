#!/bin/bash

# IncognitoAI Linux Setup Script
# Complete one-click setup for Linux users

echo "🛠️  Setting up IncognitoAI Linux Environment..."
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if running from the linux directory
if [ ! -f "setup.sh" ]; then
    echo -e "${RED}❌ Please run this script from the 'linux' directory${NC}"
    echo "Usage: cd linux && ./setup.sh"
    exit 1
fi

# 1. Check if Python 3.8+ is installed
echo -e "${BLUE}📋 Checking Python 3 installation...${NC}"
if ! command -v python3 &> /dev/null; then
    echo -e "${YELLOW}❌ Python 3 not found. Installing...${NC}"
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y python3 python3-pip python3-venv
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y python3 python3-pip
    elif command -v brew &> /dev/null; then
        brew install python@3.11
    else
        echo -e "${RED}❌ Could not determine package manager. Please install Python 3.8+ manually.${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ Python 3 installed${NC}"
else
    PYTHON_VERSION=$(python3 --version 2>&1 | grep -oP 'Python \K[0-9]+\.[0-9]+')
    echo -e "${GREEN}✅ Python 3 found (version $PYTHON_VERSION)${NC}"
fi

# 2. Create Virtual Environment
echo ""
echo -e "${BLUE}📦 Setting up Python virtual environment...${NC}"
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo -e "${GREEN}✅ Virtual environment created${NC}"
else
    echo -e "${GREEN}✅ Virtual environment already exists${NC}"
fi

# 3. Activate Virtual Environment and Install Dependencies
echo -e "${BLUE}⬇️  Installing Python dependencies...${NC}"
source venv/bin/activate

# Upgrade pip
pip install -q --upgrade pip

# Install requirements
if [ -f "../requirements.txt" ]; then
    pip install -q -r ../requirements.txt
    echo -e "${GREEN}✅ Dependencies installed${NC}"
else
    echo -e "${RED}❌ requirements.txt not found. Make sure you're in the correct directory.${NC}"
    exit 1
fi

# 4. Check/Install Ollama
echo ""
echo -e "${BLUE}🦙 Checking Ollama installation...${NC}"
if ! command -v ollama &> /dev/null; then
    echo -e "${YELLOW}❌ Ollama not found. Installing...${NC}"
    curl -fsSL https://ollama.ai/install.sh | sh
    echo -e "${GREEN}✅ Ollama installed${NC}"
else
    echo -e "${GREEN}✅ Ollama found${NC}"
fi

# 5. Check if Ollama service is running
echo ""
echo -e "${BLUE}🔍 Checking if Ollama service is running...${NC}"
if curl -s http://localhost:11434 > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Ollama service is running${NC}"
    
    # 6. Pull required models
    echo ""
    echo -e "${BLUE}📥 Verifying AI models...${NC}"
    
    echo -e "   Checking llama3.2:1b..."
    if ! ollama list 2>/dev/null | grep -q "llama3.2:1b"; then
        echo -e "   ${YELLOW}Pulling llama3.2:1b (this may take a few minutes)...${NC}"
        ollama pull llama3.2:1b
    else
        echo -e "   ${GREEN}✅ llama3.2:1b already available${NC}"
    fi
    
    echo -e "   Checking all-minilm (embeddings)..."
    if ! ollama list 2>/dev/null | grep -q "all-minilm"; then
        echo -e "   ${YELLOW}Pulling all-minilm (this may take a few minutes)...${NC}"
        ollama pull all-minilm
    else
        echo -e "   ${GREEN}✅ all-minilm already available${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  Ollama service is not running${NC}"
    echo -e "   Start it in another terminal with: ${BLUE}ollama serve${NC}"
    echo ""
    echo -e "You can pull models later, or start Ollama service and run this script again."
fi

# Make scripts executable
echo ""
echo -e "${BLUE}🔐 Making scripts executable...${NC}"
chmod +x start.sh
chmod +x bot.sh
echo -e "${GREEN}✅ Scripts are now executable${NC}"

# Final message
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "📖 Next Steps:"
echo ""
echo -e "1. ${BLUE}Start Ollama in a new terminal:${NC}"
echo -e "   ${YELLOW}ollama serve${NC}"
echo ""
echo -e "2. ${BLUE}Run IncognitoAI (choose one):${NC}"
echo ""
echo -e "   ${YELLOW}Streamlit version:${NC}"
echo -e "   ./start.sh"
echo -e "   Open: http://localhost:8501"
echo ""
echo -e "   ${YELLOW}Flask Cyberpunk version:${NC}"
echo -e "   ./bot.sh"
echo -e "   Open: http://localhost:5000"
echo ""
echo -e "📚 For more info, see: ${BLUE}README.md${NC}"
echo ""

