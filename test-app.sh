#!/bin/bash

# Script de test rapide pour l'application
# Usage: ./test-app.sh

echo "=========================================="
echo "🧪 TEST DE L'APPLICATION APP-SIMPLE"
echo "=========================================="
echo ""

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction de test
test_step() {
    echo -e "${YELLOW}▶ $1${NC}"
}

success() {
    echo -e "${GREEN}✅ $1${NC}"
}

error() {
    echo -e "${RED}❌ $1${NC}"
    exit 1
}

# Test 1: Vérifier que les fichiers existent
test_step "Test 1: Vérification des fichiers..."
files=("package.json" "server.js" "test.js" "Dockerfile" "Jenkinsfile" "deploy-docker.yml")
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        success "  $file existe"
    else
        error "  $file manquant"
    fi
done

# Test 2: Vérifier Node.js
test_step "Test 2: Vérification de Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    success "  Node.js installé: $NODE_VERSION"
else
    error "  Node.js n'est pas installé"
fi

# Test 3: Vérifier NPM
test_step "Test 3: Vérification de NPM..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    success "  NPM installé: $NPM_VERSION"
else
    error "  NPM n'est pas installé"
fi

# Test 4: Vérifier Docker
test_step "Test 4: Vérification de Docker..."
if command -v docker &> /dev/null; then
    DOCKER_VERSION=$(docker --version)
    success "  Docker installé: $DOCKER_VERSION"
else
    echo -e "${YELLOW}  ⚠️  Docker n'est pas installé (optionnel pour les tests)${NC}"
fi

# Test 5: Installation des dépendances
test_step "Test 5: Installation des dépendances..."
if npm install --silent; then
    success "  Dépendances installées"
else
    error "  Échec de l'installation des dépendances"
fi

# Test 6: Exécution des tests
test_step "Test 6: Exécution des tests de l'application..."
if npm test; then
    success "  Tests passés avec succès"
else
    error "  Les tests ont échoué"
fi

# Test 7: Vérification du Dockerfile
test_step "Test 7: Vérification de la syntaxe du Dockerfile..."
if docker build -t app-simple:test . > /dev/null 2>&1; then
    success "  Dockerfile valide et image construite"
    docker rmi app-simple:test > /dev/null 2>&1
else
    echo -e "${YELLOW}  ⚠️  Impossible de construire l'image Docker (Docker requis)${NC}"
fi

# Résumé
echo ""
echo "=========================================="
echo -e "${GREEN}✅ TOUS LES TESTS SONT PASSÉS !${NC}"
echo "=========================================="
echo ""
echo "📋 Prochaines étapes :"
echo "  1. Lancer l'application: npm start"
echo "  2. Tester avec Docker: docker-compose up"
echo "  3. Configurer Jenkins avec le Jenkinsfile"
echo "  4. Déployer avec Ansible: ansible-playbook deploy-docker.yml"
echo ""
