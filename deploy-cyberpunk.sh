#!/bin/bash

# 🌃 CYBERPUNK ETERNAL MEMES - DEPLOYMENT SCRIPT 🌃
# Blade Runner style memes site deployment to Render

set -e  # Exit on any error

echo "⚡ INITIATING CYBERPUNK DEPLOYMENT SEQUENCE ⚡"
echo "🌧️ Welcome to the digital rain..."

# Colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Project name
PROJECT_NAME="eternal-memes-cyberpunk"

echo -e "${CYAN}🤖 Setting up project: ${PROJECT_NAME}${NC}"

# Create project directory
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Initialize git repository
echo -e "${YELLOW}🔧 Initializing neural network repository...${NC}"
git init

# Create package.json for Node.js deployment
echo -e "${PURPLE}📦 Creating package configuration...${NC}"
cat > package.json << 'EOF'
{
  "name": "eternal-memes-cyberpunk",
  "version": "1.0.0",
  "description": "Cyberpunk Blade Runner style eternal memes showcase",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "node server.js"
  },
  "engines": {
    "node": ">=18.0.0",
    "npm": ">=8.0.0"
  },
  "dependencies": {
    "express": "^4.18.2",
    "helmet": "^7.1.0",
    "compression": "^1.7.4",
    "cors": "^2.8.5"
  },
  "keywords": ["cyberpunk", "memes", "blade-runner", "neon", "viral"],
  "author": "Tyrell Corporation",
  "license": "MIT"
}
EOF

# Create Express server
echo -e "${BLUE}🖥️ Creating neural server interface...${NC}"
cat > server.js << 'EOF'
const express = require('express');
const helmet = require('helmet');
const compression = require('compression');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Security middleware
app.use(helmet({
    contentSecurityPolicy: {
        directives: {
            defaultSrc: ["'self'"],
            styleSrc: ["'self'", "'unsafe-inline'", "https://fonts.googleapis.com"],
            fontSrc: ["'self'", "https://fonts.gstatic.com"],
            scriptSrc: ["'self'", "'unsafe-inline'"],
            imgSrc: ["'self'", "data:", "https:"],
            connectSrc: ["'self'"]
        }
    }
}));

// Performance middleware
app.use(compression());
app.use(cors());

// Serve static files
app.use(express.static(path.join(__dirname, 'public'), {
    maxAge: '1d',
    etag: true
}));

// Cyberpunk ASCII art for server start
const cyberpunkArt = `
⚡════════════════════════════════════════════════════════════════⚡
██████╗ ██╗      █████╗ ██████╗ ███████╗    ██████╗ ██╗   ██╗███╗   ██╗
██╔══██╗██║     ██╔══██╗██╔══██╗██╔════╝    ██╔══██╗██║   ██║████╗  ██║
██████╔╝██║     ███████║██║  ██║█████╗      ██████╔╝██║   ██║██╔██╗ ██║
██╔══██╗██║     ██╔══██║██║  ██║██╔══╝      ██╔══██╗██║   ██║██║╚██╗██║
██████╔╝███████╗██║  ██║██████╔╝███████╗    ██║  ██║╚██████╔╝██║ ╚████║
╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
⚡════════════════════════════════════════════════════════════════⚡
    🌧️ ETERNAL MEMES NEURAL NETWORK ACTIVE 🌧️
    🔴 NEXUS-7 REPLICANT DIVISION ONLINE 🔴
    📡 TYRELL CORPORATION SERVER v1.0 📡
⚡════════════════════════════════════════════════════════════════⚡
`;

// Routes
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Health check for Render
app.get('/health', (req, res) => {
    res.status(200).json({
        status: 'NEURAL_NETWORK_ACTIVE',
        timestamp: new Date().toISOString(),
        uptime: process.uptime(),
        memory: process.memoryUsage(),
        version: '1.0.0',
        message: 'Replicants online, systems nominal'
    });
});

// 404 handler
app.use((req, res) => {
    res.status(404).send(`
        <html>
        <head>
            <title>404 - Lost in the Digital Rain</title>
            <style>
                body { 
                    background: #0a0a0a; 
                    color: #00ffff; 
                    font-family: 'Courier New', monospace; 
                    text-align: center; 
                    padding: 50px;
                    text-shadow: 0 0 10px #00ffff;
                }
                h1 { font-size: 3rem; margin-bottom: 20px; }
                p { font-size: 1.2rem; }
                a { color: #ff0080; text-decoration: none; }
                a:hover { text-shadow: 0 0 15px #ff0080; }
            </style>
        </head>
        <body>
            <h1>⚡ 404 - NEURAL PATHWAY NOT FOUND ⚡</h1>
            <p>🌧️ Lost in the digital rain...</p>
            <p><a href="/">⚡ Return to Neural Network ⚡</a></p>
        </body>
        </html>
    `);
});

// Error handler
app.use((err, req, res, next) => {
    console.error('🔴 SYSTEM ERROR:', err.stack);
    res.status(500).json({
        error: 'NEURAL_NETWORK_MALFUNCTION',
        message: 'Replicant systems offline',
        timestamp: new Date().toISOString()
    });
});

// Start server
app.listen(PORT, () => {
    console.log(cyberpunkArt);
    console.log(`🌟 Server running on port ${PORT}`);
    console.log(`🔗 Local: http://localhost:${PORT}`);
    console.log(`📡 Environment: ${process.env.NODE_ENV || 'development'}`);
    console.log(`⚡ Neural network initialized successfully`);
});

module.exports = app;
EOF

# Create public directory
echo -e "${GREEN}🌐 Creating public interface directory...${NC}"
mkdir -p public

# Create the main HTML file
echo -e "${CYAN}🎨 Generating cyberpunk interface...${NC}"
cat > public/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>⚡ ETERNAL MEMES ⚡ - Legends in the Neon Rain</title>
    <meta name="description" content="Cyberpunk showcase of viral memes and digital legends that achieved immortality">
    <meta name="keywords" content="cyberpunk, memes, blade runner, neon, viral, digital immortality">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Rajdhani:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Rajdhani', sans-serif;
            background: #0a0a0a;
            color: #ffffff;
            overflow-x: hidden;
            line-height: 1.4;
            position: relative;
        }

        /* Loading Screen */
        .loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #0a0a0a;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            transition: opacity 0.5s ease;
        }

        .loader.hidden {
            opacity: 0;
            pointer-events: none;
        }

        .loader-content {
            text-align: center;
        }

        .loader-spinner {
            width: 60px;
            height: 60px;
            border: 2px solid rgba(0, 255, 255, 0.3);
            border-top: 2px solid #00ffff;
            border-radius: 50%;
            animation: cyber-spin 1s linear infinite;
            margin: 0 auto 2rem;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
        }

        @keyframes cyber-spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .loader-text {
            font-family: 'Orbitron', monospace;
            font-size: 1.5rem;
            color: #00ffff;
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        /* Hero Section */
        .hero {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
            background: 
                radial-gradient(circle at center, rgba(0, 255, 255, 0.1) 0%, transparent 70%),
                linear-gradient(135deg, #0a0a0a 0%, #1a1a2e 25%, #16213e 50%, #0f3460 75%, #0a0a0a 100%);
        }

        .hero-content h1 {
            font-family: 'Orbitron', monospace;
            font-size: clamp(3rem, 10vw, 8rem);
            font-weight: 900;
            color: #ffffff;
            text-shadow: 
                0 0 5px #00ffff,
                0 0 10px #00ffff,
                0 0 20px #00ffff,
                0 0 40px #00ffff,
                0 0 80px #00ffff;
            margin-bottom: 1rem;
            animation: neon-flicker 3s ease-in-out infinite;
            letter-spacing: 0.1em;
            text-transform: uppercase;
        }

        .hero-subtitle {
            font-size: clamp(1.2rem, 3vw, 2.5rem);
            font-weight: 700;
            background: linear-gradient(45deg, #ff0080, #00ffff, #ffff00);
            background-size: 300% 300%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: neon-rainbow 4s ease-in-out infinite;
            margin-bottom: 2rem;
            text-transform: uppercase;
            letter-spacing: 0.15em;
        }

        .hero-tagline {
            font-size: 1.3rem;
            font-weight: 400;
            color: #b0b0b0;
            margin-bottom: 3rem;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            letter-spacing: 0.05em;
        }

        .hero-cta {
            display: inline-block;
            padding: 1rem 2.5rem;
            background: linear-gradient(45deg, transparent, rgba(0, 255, 255, 0.2), transparent);
            border: 2px solid #00ffff;
            color: #00ffff;
            text-decoration: none;
            font-weight: 700;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 
                0 0 20px rgba(0, 255, 255, 0.3),
                inset 0 0 20px rgba(0, 255, 255, 0.1);
        }

        .hero-cta:hover {
            transform: translateY(-2px);
            box-shadow: 
                0 0 30px rgba(0, 255, 255, 0.6),
                inset 0 0 30px rgba(0, 255, 255, 0.2);
            text-shadow: 0 0 10px #00ffff;
        }

        .status-bar {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(0, 0, 0, 0.8);
            border: 1px solid #00ffff;
            padding: 10px 20px;
            font-family: 'Orbitron', monospace;
            font-size: 0.9rem;
            color: #00ffff;
            text-shadow: 0 0 5px #00ffff;
            letter-spacing: 0.1em;
            backdrop-filter: blur(10px);
        }

        /* Animations */
        @keyframes neon-flicker {
            0%, 100% { 
                text-shadow: 
                    0 0 5px #00ffff,
                    0 0 10px #00ffff,
                    0 0 20px #00ffff,
                    0 0 40px #00ffff,
                    0 0 80px #00ffff;
            }
            50% { 
                text-shadow: 
                    0 0 2px #00ffff,
                    0 0 5px #00ffff,
                    0 0 10px #00ffff,
                    0 0 20px #00ffff,
                    0 0 40px #00ffff;
            }
        }

        @keyframes neon-rainbow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 3rem;
            }
            .status-bar {
                font-size: 0.7rem;
                padding: 8px 15px;
            }
        }
    </style>
</head>
<body>
    <!-- Loading Screen -->
    <div class="loader" id="loader">
        <div class="loader-content">
            <div class="loader-spinner"></div>
            <div class="loader-text">INITIALIZING NEURAL NETWORK...</div>
        </div>
    </div>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>ETERNAL MEMES</h1>
            <div class="hero-subtitle">LEGENDS IN THE NEON RAIN</div>
            <p class="hero-tagline">Digital Immortals in the Age of Information</p>
            <a href="#" class="hero-cta" onclick="showComingSoon()">⚡ ACCESS DATABASE ⚡</a>
        </div>
    </section>

    <!-- Status Bar -->
    <div class="status-bar">
        STATUS: NEURAL NETWORK ACTIVE | NEXUS-7 ONLINE | TYRELL CORP v1.0
    </div>

    <script>
        // Loading screen
        window.addEventListener('load', () => {
            const loader = document.getElementById('loader');
            setTimeout(() => {
                loader.classList.add('hidden');
            }, 2500);
        });

        // Coming soon alert
        function showComingSoon() {
            const messages = [
                "⚡ NEURAL PATHWAYS EXPANDING ⚡",
                "🌧️ DIGITAL RAIN INTENSIFYING 🌧️", 
                "🤖 REPLICANT SYSTEMS UPGRADING 🤖",
                "🔴 FULL DATABASE COMING SOON 🔴"
            ];
            
            const randomMessage = messages[Math.floor(Math.random() * messages.length)];
            
            // Custom cyberpunk alert
            const alertDiv = document.createElement('div');
            alertDiv.style.cssText = `
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background: rgba(0, 0, 0, 0.9);
                border: 2px solid #00ffff;
                padding: 2rem;
                font-family: 'Orbitron', monospace;
                color: #00ffff;
                text-shadow: 0 0 10px #00ffff;
                z-index: 10000;
                text-align: center;
                backdrop-filter: blur(10px);
                animation: fadeIn 0.3s ease;
            `;
            alertDiv.innerHTML = `
                <h3 style="margin-bottom: 1rem; font-size: 1.5rem;">${randomMessage}</h3>
                <p style="margin-bottom: 1.5rem;">Full cyberpunk experience loading...</p>
                <button onclick="this.parentElement.remove()" style="
                    background: transparent;
                    border: 1px solid #ff0080;
                    color: #ff0080;
                    padding: 0.5rem 1rem;
                    cursor: pointer;
                    font-family: inherit;
                    text-transform: uppercase;
                ">ACKNOWLEDGE</button>
            `;
            
            document.body.appendChild(alertDiv);
            
            // Auto-remove after 5 seconds
            setTimeout(() => {
                if (alertDiv.parentElement) {
                    alertDiv.remove();
                }
            }, 5000);
        }

        // Add some dynamic effects
        setInterval(() => {
            const statusBar = document.querySelector('.status-bar');
            if (statusBar) {
                const timestamp = new Date().toISOString().slice(11, 19);
                statusBar.textContent = `STATUS: NEURAL NETWORK ACTIVE | TIME: ${timestamp} | NEXUS-7 ONLINE`;
            }
        }, 1000);
    </script>
</body>
</html>
EOF

# Create .gitignore
echo -e "${YELLOW}🚫 Creating git ignore protocols...${NC}"
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Coverage directory used by tools like istanbul
coverage/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Logs
logs
*.log

# Runtime data
pids
*.pid
*.seed

# Optional npm cache directory
.npm

# Optional REPL history
.node_repl_history

# Output of 'npm pack'
*.tgz

# Yarn Integrity file
.yarn-integrity

# dotenv environment variables file
.env

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Build outputs
dist/
build/
EOF

# Create README.md
echo -e "${PURPLE}📖 Creating neural documentation...${NC}"
cat > README.md << 'EOF'
# ⚡ ETERNAL MEMES - Cyberpunk Edition ⚡

🌧️ **Legends in the Neon Rain** 🌧️

A Blade Runner-inspired showcase of viral memes and digital immortals that have achieved legendary status across the neural networks.

## 🤖 Features

- **Cyberpunk Aesthetic**: Dark, moody design with neon lights and rain effects
- **Responsive Design**: Works across all devices and screen sizes
- **Performance Optimized**: Fast loading with compression and caching
- **Security Enhanced**: Helmet.js protection and CSP headers
- **Health Monitoring**: Built-in health check endpoint for monitoring

## 🚀 Quick Deployment to Render

1. **Clone this repository**
2. **Connect to Render**:
   - Go to [render.com](https://render.com)
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Use these settings:
     - **Build Command**: `npm install`
     - **Start Command**: `npm start`
     - **Environment**: Node.js

## 🛠️ Local Development

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Visit http://localhost:3000
```

## 📡 API Endpoints

- `/` - Main cyberpunk interface
- `/health` - System status and diagnostics

## 🌆 Tech Stack

- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Backend**: Node.js, Express.js
- **Security**: Helmet.js, CORS
- **Performance**: Compression, Static file caching
- **Deployment**: Render.com

## 🎨 Design Inspiration

- Blade Runner 2049 aesthetic
- Cyberpunk 2077 visual style
- Neon-soaked urban landscapes
- Digital rain and holographic elements

## 📝 License

MIT License - Feel free to use in your own neural networks

---

**⚡ TYRELL CORPORATION - NEXUS-7 REPLICANT DIVISION ⚡**

*"More human than human"*
EOF

# Create render.yaml for advanced deployment
echo -e "${BLUE}⚙️ Creating Render deployment configuration...${NC}"
cat > render.yaml << 'EOF'
services:
  - type: web
    name: eternal-memes-cyberpunk
    env: node
    plan: free
    buildCommand: npm install
    startCommand: npm start
    healthCheckPath: /health
    envVars:
      - key: NODE_ENV
        value: production
      - key: PORT
        value: 10000
EOF

# Install dependencies
echo -e "${GREEN}📦 Installing neural network dependencies...${NC}"
npm install

# Add all files to git
echo -e "${CYAN}📝 Committing to neural repository...${NC}"
git add .
git commit -m "⚡ Initial cyberpunk deployment - Neural network activated"

# Instructions for GitHub setup
echo -e "${GREEN}✅ CYBERPUNK DEPLOYMENT PREPARATION COMPLETE! ✅${NC}"
echo ""
echo -e "${YELLOW}🚀 NEXT STEPS FOR GITHUB & RENDER DEPLOYMENT:${NC}"
echo ""
echo -e "${CYAN}1. CREATE GITHUB REPOSITORY:${NC}"
echo "   - Go to https://github.com/new"
echo "   - Repository name: $PROJECT_NAME"
echo "   - Make it public"
echo "   - Don't initialize with README (we already have one)"
echo ""
echo -e "${PURPLE}2. PUSH TO GITHUB:${NC}"
echo "   git remote add origin https://github.com/YOUR_USERNAME/$PROJECT_NAME.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo -e "${BLUE}3. DEPLOY TO RENDER:${NC}"
echo "   - Go to https://render.com"
echo "   - Click 'New +' → 'Web Service'"
echo "   - Connect your GitHub repository"
echo "   - Settings will auto-populate from render.yaml"
echo "   - Click 'Create Web Service'"
echo ""
echo -e "${RED}4. OPTIONAL - CUSTOM DOMAIN:${NC}"
echo "   - In Render dashboard → Settings → Custom Domains"
echo "   - Add your domain (e.g., eternalmemes.yourdomain.com)"
echo ""
echo -e "${GREEN}🌧️ Your cyberpunk site will be live in minutes! 🌧️${NC}"
echo -e "${CYAN}⚡ Welcome to the neural network, replicant ⚡${NC}"
echo ""
echo -e "${YELLOW}📁 Project created in: $(pwd)${NC}"
echo -e "${PURPLE}🔗 Local development: http://localhost:3000${NC}"
echo ""
echo -e "${RED}💀 REMEMBER: More human than human 💀${NC}"
EOF

# Make the script executable
chmod +x deploy-cyberpunk.sh

echo "🎯 SCRIPT CREATED! Run this command to start deployment:"
echo "./deploy-cyberpunk.sh"