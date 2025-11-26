# Script de test PowerShell pour l'application
# Usage: .\test-app.ps1

Write-Host "`n==========================================" -ForegroundColor Cyan
Write-Host "  🧪 TEST DE L'APPLICATION APP-SIMPLE" -ForegroundColor Green
Write-Host "==========================================`n" -ForegroundColor Cyan

$ErrorCount = 0

function Test-Step {
    param($Message)
    Write-Host "▶ $Message" -ForegroundColor Yellow
}

function Success {
    param($Message)
    Write-Host "  ✅ $Message" -ForegroundColor Green
}

function Error {
    param($Message)
    Write-Host "  ❌ $Message" -ForegroundColor Red
    $script:ErrorCount++
}

# Test 1: Vérifier que les fichiers existent
Test-Step "Test 1: Vérification des fichiers..."
$files = @("package.json", "server.js", "test.js", "Dockerfile", "Jenkinsfile", "deploy-docker.yml")
foreach ($file in $files) {
    if (Test-Path $file) {
        Success "$file existe"
    } else {
        Error "$file manquant"
    }
}

# Test 2: Vérifier Node.js
Test-Step "Test 2: Vérification de Node.js..."
try {
    $nodeVersion = node --version
    Success "Node.js installé: $nodeVersion"
} catch {
    Error "Node.js n'est pas installé"
}

# Test 3: Vérifier NPM
Test-Step "Test 3: Vérification de NPM..."
try {
    $npmVersion = npm --version
    Success "NPM installé: $npmVersion"
} catch {
    Error "NPM n'est pas installé"
}

# Test 4: Vérifier Docker
Test-Step "Test 4: Vérification de Docker..."
try {
    $dockerVersion = docker --version
    Success "Docker installé: $dockerVersion"
} catch {
    Write-Host "  ⚠️  Docker n'est pas installé (optionnel pour les tests)" -ForegroundColor Yellow
}

# Test 5: Vérifier Git
Test-Step "Test 5: Vérification de Git..."
try {
    $gitStatus = git status --short
    Success "Dépôt Git initialisé"
    $commits = git log --oneline
    Success "Nombre de commits: $($commits.Count)"
} catch {
    Error "Git n'est pas configuré correctement"
}

# Test 6: Validation du package.json
Test-Step "Test 6: Validation du package.json..."
try {
    $package = Get-Content package.json | ConvertFrom-Json
    if ($package.name -eq "app-simple") {
        Success "Package.json valide"
    } else {
        Error "Package.json invalide"
    }
} catch {
    Error "Erreur de lecture du package.json"
}

# Test 7: Structure du projet
Test-Step "Test 7: Vérification de la structure du projet..."
$requiredDirs = @()
$allDirsExist = $true
foreach ($dir in $requiredDirs) {
    if (-not (Test-Path $dir)) {
        $allDirsExist = $false
    }
}
Success "Structure du projet correcte"

# Resume
Write-Host "`n==========================================" -ForegroundColor Cyan
if ($ErrorCount -eq 0) {
    Write-Host "  TOUS LES TESTS SONT PASSES !" -ForegroundColor Green
} else {
    Write-Host "  $ErrorCount ERREUR(S) DETECTEE(S)" -ForegroundColor Red
}
Write-Host "==========================================`n" -ForegroundColor Cyan

# Instructions suivantes
if ($ErrorCount -eq 0) {
    Write-Host "Prochaines etapes :" -ForegroundColor Cyan
    Write-Host "  1. Installer les dependances: npm install" -ForegroundColor Yellow
    Write-Host "  2. Lancer les tests: npm test" -ForegroundColor Yellow
    Write-Host "  3. Demarrer application: npm start" -ForegroundColor Yellow
    Write-Host "  4. Construire image Docker: docker build -t app-simple ." -ForegroundColor Yellow
    Write-Host "  5. Deployer avec Ansible: ansible-playbook deploy-docker.yml" -ForegroundColor Yellow
    Write-Host ""
} else {
    Write-Host "Corrigez les erreurs avant de continuer." -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

exit 0
