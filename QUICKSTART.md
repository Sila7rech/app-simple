# 🚀 Guide de démarrage rapide

## Test local de l'application (sans Docker)

### 1. Installer les dépendances
```bash
npm install
```

### 2. Lancer les tests
```bash
npm test
```

### 3. Démarrer l'application
```bash
npm start
```

Ouvrir http://localhost:3000 dans votre navigateur.

---

## Test avec Docker

### 1. Construire l'image
```bash
docker build -t app-simple:latest .
```

### 2. Lancer le conteneur
```bash
docker run -d -p 3000:3000 --name app-simple app-simple:latest
```

### 3. Vérifier les logs
```bash
docker logs app-simple
```

### 4. Tester l'application
```bash
curl http://localhost:3000/health
```

### 5. Arrêter et nettoyer
```bash
docker stop app-simple
docker rm app-simple
```

---

## Test avec Docker Compose

### 1. Lancer l'application
```bash
docker-compose up -d
```

### 2. Voir les logs
```bash
docker-compose logs -f
```

### 3. Arrêter l'application
```bash
docker-compose down
```

---

## Déploiement avec Ansible

### 1. Installer Ansible (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install ansible python3-docker -y
```

### 2. Vérifier la connexion
```bash
ansible all -i inventory.ini -m ping
```

### 3. Déployer l'application
```bash
ansible-playbook -i inventory.ini deploy-docker.yml
```

### 4. Vérifier le déploiement
```bash
curl http://localhost/health
```

---

## Configuration Jenkins

### 1. Créer un nouveau pipeline
- Jenkins Dashboard → New Item → Pipeline
- Nom : "app-simple-pipeline"

### 2. Configuration du pipeline
- Pipeline → Definition : "Pipeline script from SCM"
- SCM : Git
- Repository URL : https://github.com/Sila7rech/app-simple.git
- Script Path : Jenkinsfile

### 3. Configurer les credentials Docker
- Manage Jenkins → Credentials → Add Credentials
- Kind : Username with password
- ID : docker-credentials
- Username : votre_username_dockerhub
- Password : votre_token_dockerhub

### 4. Lancer le build
- Cliquer sur "Build Now"

---

## Endpoints disponibles

| Endpoint | Description |
|----------|-------------|
| `http://localhost:3000/` | Page d'accueil |
| `http://localhost:3000/health` | Health check |
| `http://localhost:3000/api/info` | Informations API |

---

## Commandes utiles

### Docker
```bash
# Voir les conteneurs en cours
docker ps

# Voir toutes les images
docker images

# Nettoyer les conteneurs arrêtés
docker container prune

# Nettoyer les images non utilisées
docker image prune
```

### Git
```bash
# Voir l'état
git status

# Voir l'historique
git log --oneline

# Pousser vers GitHub
git push origin main
```

### Ansible
```bash
# Vérifier la syntaxe du playbook
ansible-playbook deploy-docker.yml --syntax-check

# Dry-run (simulation)
ansible-playbook -i inventory.ini deploy-docker.yml --check

# Mode verbose
ansible-playbook -i inventory.ini deploy-docker.yml -vvv
```

---

## Troubleshooting

### Port déjà utilisé
```bash
# Windows
netstat -ano | findstr :3000

# Linux/Mac
lsof -i :3000
```

### Docker ne démarre pas
```bash
# Vérifier les logs
docker logs app-simple

# Inspecter le conteneur
docker inspect app-simple
```

### Ansible échoue
```bash
# Vérifier la connectivité
ansible all -i inventory.ini -m ping

# Installer les modules Python nécessaires
pip install docker
```

---

**Bon travail ! 🎉**
