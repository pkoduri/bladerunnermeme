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
