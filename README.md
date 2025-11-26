# 🚀 App-Simple - Atelier DevOps

Application web simple pour l'atelier pratique DevOps intégrant Docker, Jenkins et Ansible.

## 📋 Description

Ce projet est une application Node.js conteneurisée qui démontre l'intégration complète d'un pipeline CI/CD utilisant :
- **Docker** pour la containerisation
- **Jenkins** pour l'intégration continue
- **Ansible** pour le déploiement automatisé

## 🏗️ Architecture

```
app-simple/
├── server.js              # Application Express.js
├── test.js                # Tests unitaires
├── package.json           # Dépendances Node.js
├── Dockerfile             # Configuration Docker
├── Jenkinsfile            # Pipeline CI/CD Jenkins
├── deploy-docker.yml      # Playbook Ansible principal
├── inventory.ini          # Inventaire des serveurs
├── ansible.cfg            # Configuration Ansible
└── README.md              # Documentation
```

## 🎯 Objectifs de l'atelier

1. ✅ Cloner l'application depuis le dépôt Git
2. ✅ Écrire un Dockerfile pour containeriser l'application
3. ✅ Créer un Jenkinsfile pour configurer le pipeline CI/CD
4. ✅ Écrire un playbook Ansible pour déployer Docker
5. ✅ Lancer l'application conteneurisée avec Ansible

## 📦 Prérequis

- **Git** (pour cloner le projet)
- **Node.js** 14+ et NPM (pour le développement local)
- **Docker** (pour la containerisation)
- **Jenkins** (pour le CI/CD)
- **Ansible** (pour le déploiement)

## 🚀 Démarrage rapide

### 1. Cloner le projet

```bash
git clone https://github.com/Sila7rech/app-simple.git
cd app-simple
```

### 2. Développement local (sans Docker)

```bash
# Installer les dépendances
npm install

# Lancer les tests
npm test

# Démarrer l'application
npm start
```

L'application sera accessible sur `http://localhost:3000`

### 3. Avec Docker

#### Construire l'image Docker

```bash
docker build -t app-simple:latest .
```

#### Lancer le conteneur

```bash
docker run -d -p 3000:3000 --name app-simple app-simple:latest
```

#### Vérifier l'état

```bash
docker ps
docker logs app-simple
```

#### Accéder à l'application

Ouvrez votre navigateur sur `http://localhost:3000`

### 4. Pipeline Jenkins

#### Configuration Jenkins

1. Créer un nouveau pipeline dans Jenkins
2. Pointer vers le `Jenkinsfile` de ce projet
3. Configurer les credentials Docker :
   - Aller dans Jenkins → Credentials
   - Ajouter les credentials Docker Hub avec l'ID `docker-credentials`

#### Variables à configurer dans Jenkins

```groovy
DOCKER_REGISTRY = 'docker.io'  // Votre registre Docker
IMAGE_NAME = 'votre-username/app-simple'
```

#### Étapes du pipeline

1. **Checkout** : Récupération du code source
2. **Install Dependencies** : Installation des dépendances npm
3. **Test** : Exécution des tests
4. **Build Docker Image** : Construction de l'image Docker
5. **Test Docker Image** : Test de l'image construite
6. **Push to Registry** : Push vers le registre Docker
7. **Clean Up** : Nettoyage des images locales

### 5. Déploiement avec Ansible

#### Installation d'Ansible

Sur Ubuntu/Debian :
```bash
sudo apt update
sudo apt install ansible -y
```

Sur macOS :
```bash
brew install ansible
```

#### Configuration de l'inventaire

Éditez `inventory.ini` pour spécifier vos serveurs cibles :

```ini
[webservers]
# Pour un déploiement local
localhost ansible_connection=local

# Pour un serveur distant
# 192.168.1.100 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
```

#### Déploiement

```bash
# Vérifier la connexion aux serveurs
ansible all -i inventory.ini -m ping

# Déployer Docker et l'application
ansible-playbook -i inventory.ini deploy-docker.yml

# Avec verbose pour plus de détails
ansible-playbook -i inventory.ini deploy-docker.yml -v
```

#### Variables du playbook

Vous pouvez personnaliser le déploiement en modifiant les variables dans `deploy-docker.yml` :

```yaml
vars:
  docker_image_name: 'docker.io/app-simple'
  docker_image_tag: 'latest'
  app_container_name: 'app-simple'
  app_port: 3000
  host_port: 80
```

## 🧪 Tests

### Tests unitaires

```bash
npm test
```

### Test du conteneur Docker

```bash
# Construire et lancer
docker build -t app-simple:test .
docker run -d -p 3001:3000 --name test-container app-simple:test

# Tester l'endpoint de santé
curl http://localhost:3001/health

# Nettoyer
docker stop test-container
docker rm test-container
```

## 📡 Endpoints de l'API

| Endpoint | Méthode | Description |
|----------|---------|-------------|
| `/` | GET | Page d'accueil de l'application |
| `/health` | GET | Vérification de l'état de l'application |
| `/api/info` | GET | Informations sur l'application |

### Exemples de requêtes

```bash
# Page d'accueil
curl http://localhost:3000/

# Health check
curl http://localhost:3000/health

# Informations API
curl http://localhost:3000/api/info
```

## 🔧 Configuration avancée

### Variables d'environnement

| Variable | Description | Valeur par défaut |
|----------|-------------|-------------------|
| `PORT` | Port d'écoute de l'application | 3000 |
| `NODE_ENV` | Environnement d'exécution | development |

### Docker Compose (optionnel)

Créez un fichier `docker-compose.yml` :

```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - PORT=3000
    restart: always
```

Lancement :
```bash
docker-compose up -d
```

## 📊 Monitoring et logs

### Logs du conteneur

```bash
# Afficher les logs en temps réel
docker logs -f app-simple

# Afficher les 100 dernières lignes
docker logs --tail 100 app-simple
```

### Inspection du conteneur

```bash
# Informations détaillées
docker inspect app-simple

# Statistiques en temps réel
docker stats app-simple
```

## 🐛 Dépannage

### L'application ne démarre pas

```bash
# Vérifier les logs
docker logs app-simple

# Vérifier l'état du conteneur
docker ps -a

# Redémarrer le conteneur
docker restart app-simple
```

### Port déjà utilisé

```bash
# Trouver le processus utilisant le port 3000
lsof -i :3000  # macOS/Linux
netstat -ano | findstr :3000  # Windows

# Utiliser un autre port
docker run -d -p 8080:3000 --name app-simple app-simple:latest
```

### Problèmes avec Ansible

```bash
# Vérifier la connectivité
ansible all -i inventory.ini -m ping

# Mode debug
ansible-playbook -i inventory.ini deploy-docker.yml -vvv

# Vérifier la syntaxe
ansible-playbook deploy-docker.yml --syntax-check
```

## 📚 Ressources supplémentaires

- [Documentation Docker](https://docs.docker.com/)
- [Documentation Jenkins](https://www.jenkins.io/doc/)
- [Documentation Ansible](https://docs.ansible.com/)
- [Documentation Node.js](https://nodejs.org/docs/)
- [Documentation Express](https://expressjs.com/)

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
1. Fork le projet
2. Créer une branche (`git checkout -b feature/amelioration`)
3. Commit vos changements (`git commit -m 'Ajout d'une fonctionnalité'`)
4. Push vers la branche (`git push origin feature/amelioration`)
5. Ouvrir une Pull Request

## 📝 Licence

Ce projet est sous licence ISC.

## ✅ Checklist de l'atelier

- [x] Application Node.js créée
- [x] Tests unitaires implémentés
- [x] Dockerfile créé
- [x] Jenkinsfile configuré
- [x] Playbook Ansible créé
- [x] Inventaire Ansible configuré
- [x] Documentation complète

## 👥 Auteurs

- Projet d'atelier DevOps - Formation pratique

## 🎓 Compétences acquises

À la fin de cet atelier, vous saurez :
- ✅ Containeriser une application avec Docker
- ✅ Créer un pipeline CI/CD avec Jenkins
- ✅ Automatiser le déploiement avec Ansible
- ✅ Gérer des images Docker et les registres
- ✅ Configurer et orchestrer des outils DevOps

---

**Bon atelier ! 🚀**
