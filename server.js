const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send(`
        <!DOCTYPE html>
        <html lang="fr">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>App Simple - DevOps</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    max-width: 800px;
                    margin: 50px auto;
                    padding: 20px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    color: white;
                }
                .container {
                    background: rgba(255, 255, 255, 0.1);
                    padding: 40px;
                    border-radius: 10px;
                    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                    backdrop-filter: blur(4px);
                    border: 1px solid rgba(255, 255, 255, 0.18);
                }
                h1 {
                    text-align: center;
                    margin-bottom: 30px;
                }
                .info {
                    background: rgba(255, 255, 255, 0.2);
                    padding: 20px;
                    border-radius: 5px;
                    margin: 20px 0;
                }
                .success {
                    background: rgba(76, 175, 80, 0.3);
                    padding: 15px;
                    border-radius: 5px;
                    margin-top: 20px;
                    text-align: center;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>🚀 Application Simple - Atelier DevOps</h1>
                <div class="info">
                    <h2>✅ Application déployée avec succès !</h2>
                    <p><strong>Technologies utilisées :</strong></p>
                    <ul>
                        <li>Node.js & Express</li>
                        <li>Docker pour la containerisation</li>
                        <li>Jenkins pour le CI/CD</li>
                        <li>Ansible pour le déploiement</li>
                    </ul>
                </div>
                <div class="success">
                    <p><strong>Port:</strong> ${PORT}</p>
                    <p><strong>Statut:</strong> En ligne 🟢</p>
                </div>
            </div>
        </body>
        </html>
    `);
});

app.get('/health', (req, res) => {
    res.status(200).json({ 
        status: 'OK', 
        timestamp: new Date().toISOString(),
        uptime: process.uptime()
    });
});

app.get('/api/info', (req, res) => {
    res.json({
        name: 'app-simple',
        version: '1.0.0',
        description: 'Application pour atelier DevOps',
        technologies: ['Docker', 'Jenkins', 'Ansible', 'Node.js']
    });
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`✅ Serveur démarré sur le port ${PORT}`);
    console.log(`🌐 Accédez à l'application sur http://localhost:${PORT}`);
});

module.exports = app;
