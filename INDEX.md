# 📚 INDEX DE LA DOCUMENTATION

Guide complet pour naviguer dans la documentation du projet app-simple.

---

## 🎯 PAR OBJECTIF

### Démarrer rapidement
→ **[QUICKSTART.md](QUICKSTART.md)** - Guide de démarrage rapide

### Comprendre le projet
→ **[README.md](README.md)** - Documentation complète
→ **[STRUCTURE.md](STRUCTURE.md)** - Structure détaillée du projet

### Tester le projet
→ **[TESTS.md](TESTS.md)** - Guide de tests complet
→ **test-app.ps1** - Script de test PowerShell
→ **test-app.sh** - Script de test Bash

### Valider l'examen
→ **[EXAMEN_COMPLET.md](EXAMEN_COMPLET.md)** - Récapitulatif de l'examen
→ **[CHECKLIST.md](CHECKLIST.md)** - Checklist de validation

### Publier sur GitHub
→ **[GITHUB_PUSH.md](GITHUB_PUSH.md)** - Instructions pour GitHub

---

## 📁 PAR TYPE DE FICHIER

### 📄 Code Source
- **server.js** - Application Express.js principale
- **test.js** - Tests unitaires
- **package.json** - Configuration Node.js

### 🐳 Docker
- **Dockerfile** - Configuration de l'image Docker
- **.dockerignore** - Fichiers à exclure du build
- **docker-compose.yml** - Orchestration Docker Compose

### 🔄 CI/CD
- **Jenkinsfile** - Pipeline Jenkins complet (7 stages)

### 🤖 Ansible
- **deploy-docker.yml** - Playbook de déploiement
- **inventory.ini** - Inventaire des serveurs
- **ansible.cfg** - Configuration Ansible
- **vars.example.yml** - Variables d'exemple

### 📚 Documentation
- **README.md** - Documentation principale (8+ KB)
- **QUICKSTART.md** - Démarrage rapide (4+ KB)
- **EXAMEN_COMPLET.md** - Récapitulatif examen (8+ KB)
- **STRUCTURE.md** - Structure projet (8+ KB)
- **CHECKLIST.md** - Validation complète (7+ KB)
- **TESTS.md** - Guide de tests (10+ KB)
- **GITHUB_PUSH.md** - Instructions GitHub (3+ KB)
- **INDEX.md** - Ce fichier

### 🧪 Tests
- **test-app.ps1** - Script de validation Windows
- **test-app.sh** - Script de validation Linux/Mac

### ⚙️ Configuration
- **.gitignore** - Fichiers à ignorer par Git

---

## 🎓 PAR NIVEAU D'EXPERTISE

### 👶 Débutant - Commencer ici
1. [QUICKSTART.md](QUICKSTART.md) - Démarrage rapide
2. [README.md](README.md) - Lire la section "Démarrage rapide"
3. Exécuter `npm install && npm start`

### 🧑 Intermédiaire - Approfondir
1. [STRUCTURE.md](STRUCTURE.md) - Comprendre l'architecture
2. [TESTS.md](TESTS.md) - Tester toutes les fonctionnalités
3. Construire l'image Docker

### 👨‍🎓 Avancé - Maîtriser
1. [EXAMEN_COMPLET.md](EXAMEN_COMPLET.md) - Comprendre le pipeline complet
2. **Jenkinsfile** - Analyser le pipeline CI/CD
3. **deploy-docker.yml** - Étudier l'automatisation Ansible

---

## 🔍 PAR TÂCHE SPÉCIFIQUE

### Installation et configuration
```
README.md → Section "Prérequis"
README.md → Section "Démarrage rapide"
QUICKSTART.md → Sections 1-3
```

### Tester l'application
```
TESTS.md → Tous les tests
test-app.ps1 → Validation automatique Windows
test-app.sh → Validation automatique Linux/Mac
```

### Containerisation Docker
```
README.md → Section "Avec Docker"
Dockerfile → Configuration de l'image
docker-compose.yml → Orchestration
TESTS.md → Section "Test Docker"
```

### Pipeline Jenkins
```
Jenkinsfile → Pipeline complet
README.md → Section "Pipeline Jenkins"
QUICKSTART.md → Section "Configuration Jenkins"
EXAMEN_COMPLET.md → Architecture du pipeline
```

### Déploiement Ansible
```
deploy-docker.yml → Playbook principal
inventory.ini → Configuration des serveurs
ansible.cfg → Configuration Ansible
README.md → Section "Déploiement avec Ansible"
QUICKSTART.md → Section "Déploiement avec Ansible"
```

### Troubleshooting
```
README.md → Section "Dépannage"
TESTS.md → Section "Troubleshooting"
QUICKSTART.md → Sections de troubleshooting
```

### Publication GitHub
```
GITHUB_PUSH.md → Instructions complètes
```

---

## 📊 STATISTIQUES DE LA DOCUMENTATION

| Document | Taille | Sections | Niveau |
|----------|--------|----------|--------|
| README.md | ~8 KB | 20+ | Tous |
| QUICKSTART.md | ~4 KB | 10+ | Débutant |
| EXAMEN_COMPLET.md | ~8 KB | 15+ | Avancé |
| STRUCTURE.md | ~8 KB | 10+ | Intermédiaire |
| CHECKLIST.md | ~7 KB | 12+ | Tous |
| TESTS.md | ~10 KB | 10+ | Intermédiaire |
| GITHUB_PUSH.md | ~3 KB | 8+ | Débutant |

**Total : ~48 KB de documentation**

---

## 🗺️ PARCOURS RECOMMANDÉ

### Parcours 1 : Découverte (30 min)
1. Lire **[QUICKSTART.md](QUICKSTART.md)** (5 min)
2. Exécuter `npm install && npm test` (5 min)
3. Lancer `npm start` et tester l'app (10 min)
4. Construire l'image Docker (5 min)
5. Tester avec Docker (5 min)

### Parcours 2 : Compréhension (1h)
1. Lire **[README.md](README.md)** complet (15 min)
2. Lire **[STRUCTURE.md](STRUCTURE.md)** (10 min)
3. Exécuter tous les tests de **[TESTS.md](TESTS.md)** (30 min)
4. Explorer les fichiers de code (5 min)

### Parcours 3 : Maîtrise (2h)
1. Analyser **Jenkinsfile** ligne par ligne (30 min)
2. Analyser **deploy-docker.yml** (30 min)
3. Tester le pipeline complet manuellement (45 min)
4. Valider avec **[CHECKLIST.md](CHECKLIST.md)** (15 min)

### Parcours 4 : Examen (15 min)
1. Lire **[EXAMEN_COMPLET.md](EXAMEN_COMPLET.md)** (10 min)
2. Vérifier **[CHECKLIST.md](CHECKLIST.md)** (5 min)

---

## 🔗 LIENS RAPIDES

### Commandes essentielles
- Tests : `npm test`
- Démarrage : `npm start`
- Docker : `docker build -t app-simple .`
- Docker Compose : `docker-compose up -d`
- Ansible : `ansible-playbook deploy-docker.yml`

### Endpoints de l'application
- Page d'accueil : `http://localhost:3000/`
- Health check : `http://localhost:3000/health`
- API info : `http://localhost:3000/api/info`

---

## 📞 BESOIN D'AIDE ?

1. **Problème d'installation** → [README.md](README.md) section "Prérequis"
2. **Erreur lors des tests** → [TESTS.md](TESTS.md) section "Troubleshooting"
3. **Docker ne fonctionne pas** → [README.md](README.md) section "Dépannage"
4. **Questions sur Ansible** → [README.md](README.md) section "Déploiement avec Ansible"
5. **Problème avec Jenkins** → [README.md](README.md) section "Pipeline Jenkins"

---

## ✅ CHECKLIST RAPIDE

Avant de commencer :
- [ ] Node.js installé
- [ ] Docker installé
- [ ] Git configuré

Pour valider le projet :
- [ ] Lire [QUICKSTART.md](QUICKSTART.md)
- [ ] Exécuter les tests
- [ ] Builder l'image Docker
- [ ] Consulter [CHECKLIST.md](CHECKLIST.md)

Pour l'examen :
- [ ] Lire [EXAMEN_COMPLET.md](EXAMEN_COMPLET.md)
- [ ] Vérifier tous les livrables

---

## 🎯 OBJECTIFS DE L'ATELIER

Référence rapide des objectifs et où les trouver :

| Objectif | Fichier | Documentation |
|----------|---------|---------------|
| Application simple | server.js, test.js | README.md |
| Dockerfile | Dockerfile | README.md, STRUCTURE.md |
| Jenkinsfile | Jenkinsfile | EXAMEN_COMPLET.md |
| Playbook Ansible | deploy-docker.yml | README.md |
| Déploiement | deploy-docker.yml | QUICKSTART.md |

---

**Navigation complète de la documentation app-simple**

*Dernière mise à jour : 26 novembre 2025*
