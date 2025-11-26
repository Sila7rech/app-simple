# ✅ Atelier 10 - Examen Blanc Pratique - COMPLÉTÉ

## 📋 Récapitulatif des livrables

### ✅ 1. Application Simple
- **server.js** : Application web Node.js avec Express
- **test.js** : Tests unitaires
- **package.json** : Configuration et dépendances

### ✅ 2. Dockerfile
- Containerisation de l'application Node.js
- Multi-étapes optimisées
- Utilisateur non-root pour la sécurité
- Healthcheck intégré
- Fichier **.dockerignore** pour optimiser la build

### ✅ 3. Jenkinsfile
- Pipeline CI/CD complet avec 7 stages
- Tests automatisés
- Build de l'image Docker
- Test de l'image avant push
- Push vers Docker Registry
- Nettoyage automatique
- Gestion des erreurs avec post-actions

### ✅ 4. Playbook Ansible (deploy-docker.yml)
- Installation complète de Docker
- Configuration du service Docker
- Pull de l'image depuis le registry
- Déploiement du conteneur
- Configuration du restart automatique
- Healthcheck du déploiement
- Affichage des informations de connexion

### ✅ 5. Fichiers de configuration
- **inventory.ini** : Inventaire des serveurs cibles
- **ansible.cfg** : Configuration Ansible
- **docker-compose.yml** : Alternative de déploiement
- **vars.example.yml** : Variables d'exemple

### ✅ 6. Documentation
- **README.md** : Documentation complète
- **QUICKSTART.md** : Guide de démarrage rapide
- Ce fichier récapitulatif

---

## 🎯 Objectifs de l'atelier - Statut

| Objectif | Statut | Fichier |
|----------|--------|---------|
| Cloner l'application depuis Git | ✅ | - |
| Écrire un Dockerfile | ✅ | `Dockerfile` |
| Créer un Jenkinsfile | ✅ | `Jenkinsfile` |
| Créer un playbook Ansible | ✅ | `deploy-docker.yml` |
| Lancer l'application conteneurisée | ✅ | `deploy-docker.yml` |

---

## 🚀 Étapes pour exécuter le projet

### 1️⃣ Test Local (Sans Docker)
```bash
npm install
npm test
npm start
# Accès: http://localhost:3000
```

### 2️⃣ Test avec Docker
```bash
# Build
docker build -t app-simple:latest .

# Run
docker run -d -p 3000:3000 --name app-simple app-simple:latest

# Vérification
docker logs app-simple
curl http://localhost:3000/health
```

### 3️⃣ Pipeline Jenkins
1. Créer un nouveau pipeline dans Jenkins
2. Pointer vers le `Jenkinsfile`
3. Configurer les credentials Docker (ID: `docker-credentials`)
4. Lancer le build

Variables à adapter dans `Jenkinsfile` :
- `DOCKER_REGISTRY` : Votre registre Docker
- `IMAGE_NAME` : Nom de votre image

### 4️⃣ Déploiement Ansible
```bash
# Vérifier la connexion
ansible all -i inventory.ini -m ping

# Déployer
ansible-playbook -i inventory.ini deploy-docker.yml

# Vérifier
curl http://localhost/health
```

---

## 📝 Points clés de l'implémentation

### Dockerfile
- ✅ Image de base officielle Node.js (alpine pour la légèreté)
- ✅ Multi-étapes pour optimisation
- ✅ Sécurité : utilisateur non-root
- ✅ Healthcheck intégré
- ✅ .dockerignore pour build optimisée

### Jenkinsfile
- ✅ 7 stages : Checkout, Env Info, Install, Test, Build, Test Image, Push
- ✅ Variables d'environnement configurables
- ✅ Test de l'image avant push
- ✅ Tags multiples (numéro de build + latest)
- ✅ Nettoyage automatique
- ✅ Gestion des erreurs (post-actions)

### Playbook Ansible
- ✅ Installation complète de Docker
- ✅ Gestion des dépendances
- ✅ Configuration du service Docker
- ✅ Déploiement du conteneur
- ✅ Restart policy configurée
- ✅ Healthcheck du déploiement
- ✅ Variables paramétrables
- ✅ Gestion des erreurs avec ignore_errors

---

## 🔧 Personnalisation

### Pour adapter à votre environnement :

1. **Jenkinsfile** (lignes 6-8)
```groovy
DOCKER_REGISTRY = 'votre-registre.com'
IMAGE_NAME = 'votre-username/app-simple'
```

2. **deploy-docker.yml** (lignes 7-11)
```yaml
docker_image_name: 'votre-registre.com/app-simple'
docker_image_tag: 'latest'
host_port: 80  # ou autre port
```

3. **inventory.ini**
```ini
[webservers]
votre-serveur.com ansible_user=ubuntu
```

---

## 📊 Architecture du pipeline CI/CD

```
┌─────────────┐
│   GitHub    │  ← Code source
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Jenkins   │  ← Pipeline CI/CD
│             │
│  1. Test    │
│  2. Build   │
│  3. Push    │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Docker    │  ← Registry
│   Registry  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Ansible   │  ← Déploiement
│             │
│  • Install  │
│  • Deploy   │
│  • Monitor  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Server    │  ← Production
│   Docker    │
└─────────────┘
```

---

## 🎓 Compétences démontrées

✅ **Docker**
- Création de Dockerfile optimisés
- Gestion des images et conteneurs
- Sécurité des conteneurs
- Healthchecks

✅ **Jenkins**
- Pipeline as Code (Jenkinsfile)
- Intégration continue
- Tests automatisés
- Gestion des credentials
- Push vers registry

✅ **Ansible**
- Playbooks YAML
- Gestion d'inventaire
- Installation de services
- Déploiement d'applications
- Idempotence

✅ **DevOps**
- CI/CD complet
- Infrastructure as Code
- Automatisation
- Bonnes pratiques

---

## 📞 Support

Pour toute question :
1. Consultez le **README.md** pour la documentation complète
2. Consultez le **QUICKSTART.md** pour le démarrage rapide
3. Vérifiez les logs :
   - Docker : `docker logs app-simple`
   - Ansible : `ansible-playbook ... -vvv`

---

## ✨ Conclusion

Ce projet démontre une maîtrise complète de la chaîne DevOps :
- ✅ Développement d'une application web
- ✅ Containerisation avec Docker
- ✅ Pipeline CI/CD avec Jenkins
- ✅ Déploiement automatisé avec Ansible
- ✅ Bonnes pratiques et sécurité

**Tous les objectifs de l'atelier sont atteints ! 🎉**

---

*Atelier 10 - Examen Blanc Pratique - Complété le 26 novembre 2025*
