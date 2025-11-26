# 🧪 GUIDE DE TEST COMPLET

Ce guide vous permet de tester toutes les fonctionnalités du projet étape par étape.

---

## 📋 PRÉALABLES

Assurez-vous d'avoir installé :
- Node.js (v14+)
- NPM
- Docker
- Git
- Ansible (pour les tests de déploiement)

---

## 1️⃣ TEST DE L'APPLICATION NODE.JS

### Installation des dépendances
```bash
npm install
```

**Résultat attendu :** Installation réussie d'Express

### Exécution des tests
```bash
npm test
```

**Résultat attendu :** 
```
✅ Test 1: Module Express est disponible
✅ Test 2: Fichier server.js existe
✅ Test 3: Package.json est valide
✅ Test 4: Structure de l'application est correcte
✅ Tous les tests sont passés avec succès!
```

### Lancement de l'application
```bash
npm start
```

**Résultat attendu :** 
```
✅ Serveur démarré sur le port 3000
🌐 Accédez à l'application sur http://localhost:3000
```

### Test des endpoints

**Terminal 2 (pendant que l'app tourne) :**

```bash
# Test endpoint principal
curl http://localhost:3000/

# Test endpoint health
curl http://localhost:3000/health

# Test endpoint API
curl http://localhost:3000/api/info
```

**Résultats attendus :**
- `/` : Page HTML complète
- `/health` : `{"status":"OK","timestamp":"...","uptime":...}`
- `/api/info` : JSON avec infos du projet

### Arrêter l'application
`Ctrl+C` dans le terminal

---

## 2️⃣ TEST DOCKER

### Construction de l'image
```bash
docker build -t app-simple:test .
```

**Résultat attendu :** 
```
Successfully built [image-id]
Successfully tagged app-simple:test
```

### Vérification de l'image
```bash
docker images | grep app-simple
```

**Résultat attendu :** Ligne affichant l'image `app-simple:test`

### Lancement du conteneur
```bash
docker run -d -p 3000:3000 --name app-simple-test app-simple:test
```

**Résultat attendu :** ID du conteneur

### Vérification du conteneur
```bash
docker ps | grep app-simple-test
```

**Résultat attendu :** Conteneur en statut "Up"

### Test des logs
```bash
docker logs app-simple-test
```

**Résultat attendu :** 
```
✅ Serveur démarré sur le port 3000
🌐 Accédez à l'application sur http://localhost:3000
```

### Test de l'application dans Docker
```bash
# Test health
curl http://localhost:3000/health

# Test API
curl http://localhost:3000/api/info
```

### Inspection du conteneur
```bash
docker inspect app-simple-test
```

**Résultat attendu :** JSON avec toutes les infos du conteneur

### Test du healthcheck
```bash
docker inspect --format='{{json .State.Health}}' app-simple-test
```

**Résultat attendu :** Status "healthy"

### Nettoyage
```bash
docker stop app-simple-test
docker rm app-simple-test
docker rmi app-simple:test
```

---

## 3️⃣ TEST DOCKER COMPOSE

### Lancement avec Docker Compose
```bash
docker-compose up -d
```

**Résultat attendu :** 
```
Creating network "app-simple_app-network" with driver "bridge"
Creating app-simple ... done
```

### Vérification
```bash
docker-compose ps
```

**Résultat attendu :** Service "app" en statut "Up"

### Logs
```bash
docker-compose logs -f
```

### Test de l'application
```bash
curl http://localhost:3000/health
```

### Arrêt et nettoyage
```bash
docker-compose down
```

---

## 4️⃣ TEST DU JENKINSFILE

### Validation de la syntaxe
```bash
# Avec un linter Jenkins (si disponible)
jenkins-cli declarative-linter < Jenkinsfile
```

### Test manuel des étapes

**Simuler le stage Test :**
```bash
npm install
npm test
```

**Simuler le stage Build :**
```bash
docker build -t app-simple:1 .
```

**Simuler le stage Test Image :**
```bash
docker run -d --name test-container -p 3001:3000 app-simple:1
sleep 5
docker logs test-container
docker stop test-container
docker rm test-container
```

---

## 5️⃣ TEST DU PLAYBOOK ANSIBLE

### Vérification de la syntaxe
```bash
ansible-playbook deploy-docker.yml --syntax-check
```

**Résultat attendu :** `playbook: deploy-docker.yml`

### Test de connectivité
```bash
ansible all -i inventory.ini -m ping
```

**Résultat attendu :** 
```
localhost | SUCCESS => {
    "ping": "pong"
}
```

### Dry-run (simulation)
```bash
ansible-playbook -i inventory.ini deploy-docker.yml --check
```

### Liste des tâches
```bash
ansible-playbook deploy-docker.yml --list-tasks
```

### Exécution en mode verbose
```bash
ansible-playbook -i inventory.ini deploy-docker.yml -vvv
```

**Note :** Pour un test complet, vous aurez besoin d'une machine distante ou VM.

---

## 6️⃣ TEST DES SCRIPTS DE VALIDATION

### Windows (PowerShell)
```powershell
.\test-app.ps1
```

### Linux/Mac (Bash)
```bash
chmod +x test-app.sh
./test-app.sh
```

**Résultat attendu :** Tous les tests passent

---

## 7️⃣ TEST GIT

### Vérification du dépôt
```bash
git status
```

**Résultat attendu :** "nothing to commit, working tree clean"

### Historique
```bash
git log --oneline --graph
```

**Résultat attendu :** Liste des 7 commits

### Vérification des fichiers trackés
```bash
git ls-files
```

**Résultat attendu :** Liste de tous les fichiers versionnés

---

## 8️⃣ TESTS D'INTÉGRATION COMPLÈTE

### Scénario 1 : Dev → Docker → Test

```bash
# 1. Installer et tester
npm install
npm test

# 2. Builder Docker
docker build -t app-simple:integration .

# 3. Lancer
docker run -d -p 3000:3000 --name integration-test app-simple:integration

# 4. Tester
curl http://localhost:3000/health
curl http://localhost:3000/api/info

# 5. Nettoyer
docker stop integration-test
docker rm integration-test
docker rmi app-simple:integration
```

### Scénario 2 : Pipeline complet (manuel)

```bash
# Stage 1: Checkout
git pull

# Stage 2: Install
npm install

# Stage 3: Test
npm test

# Stage 4: Build
docker build -t app-simple:latest .

# Stage 5: Test Image
docker run -d --name pipeline-test -p 3001:3000 app-simple:latest
sleep 5
curl http://localhost:3001/health
docker stop pipeline-test
docker rm pipeline-test

# Stage 6: Push (simulation)
echo "Image would be pushed to registry here"

# Stage 7: Clean
docker system prune -f
```

---

## 9️⃣ TESTS DE PERFORMANCE

### Test de charge simple
```bash
# Lancer l'application
npm start &

# Dans un autre terminal
for i in {1..100}; do
    curl -s http://localhost:3000/health > /dev/null
    echo "Request $i done"
done
```

### Avec Apache Bench (si installé)
```bash
ab -n 1000 -c 10 http://localhost:3000/health
```

---

## 🔟 CHECKLIST FINALE

- [ ] Tests Node.js passent
- [ ] Application démarre localement
- [ ] Tous les endpoints répondent
- [ ] Image Docker se construit
- [ ] Conteneur Docker fonctionne
- [ ] Docker Compose fonctionne
- [ ] Jenkinsfile est valide
- [ ] Playbook Ansible est valide
- [ ] Scripts de test passent
- [ ] Git est configuré
- [ ] Documentation est complète

---

## 🐛 TROUBLESHOOTING

### Port déjà utilisé
```bash
# Windows
netstat -ano | findstr :3000
taskkill /PID [PID] /F

# Linux/Mac
lsof -ti:3000 | xargs kill -9
```

### Docker daemon non lancé
```bash
# Windows/Mac
# Démarrer Docker Desktop

# Linux
sudo systemctl start docker
```

### Permission denied (Docker)
```bash
# Linux
sudo usermod -aG docker $USER
# Puis se reconnecter
```

### Node modules manquants
```bash
rm -rf node_modules package-lock.json
npm install
```

---

## 📊 RÉSULTATS ATTENDUS

Si tous les tests passent :

✅ Application fonctionnelle en local
✅ Application fonctionnelle dans Docker
✅ Pipeline Jenkins validé
✅ Playbook Ansible validé
✅ Documentation complète
✅ Projet prêt pour production

**FÉLICITATIONS ! Votre projet est complet et opérationnel ! 🎉**

---

*Pour toute question, consultez le README.md ou les autres fichiers de documentation.*
