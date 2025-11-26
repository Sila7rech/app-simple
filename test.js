// Tests simples pour l'application
console.log('🧪 Exécution des tests...\n');

let testsPassed = 0;
let testsFailed = 0;

// Test 1: Vérifier que le module express est disponible
try {
    require('express');
    console.log('✅ Test 1: Module Express est disponible');
    testsPassed++;
} catch (error) {
    console.log('❌ Test 1: Module Express n\'est pas disponible');
    testsFailed++;
}

// Test 2: Vérifier que le fichier server.js existe
const fs = require('fs');
try {
    if (fs.existsSync('./server.js')) {
        console.log('✅ Test 2: Fichier server.js existe');
        testsPassed++;
    } else {
        throw new Error('Fichier non trouvé');
    }
} catch (error) {
    console.log('❌ Test 2: Fichier server.js n\'existe pas');
    testsFailed++;
}

// Test 3: Vérifier que le package.json existe et est valide
try {
    const packageJson = require('./package.json');
    if (packageJson.name && packageJson.version) {
        console.log('✅ Test 3: Package.json est valide');
        testsPassed++;
    } else {
        throw new Error('Package.json invalide');
    }
} catch (error) {
    console.log('❌ Test 3: Package.json n\'est pas valide');
    testsFailed++;
}

// Test 4: Vérifier la structure de l'application
try {
    const app = require('./server.js');
    if (typeof app === 'object' || typeof app === 'function') {
        console.log('✅ Test 4: Structure de l\'application est correcte');
        testsPassed++;
    } else {
        throw new Error('Structure incorrecte');
    }
} catch (error) {
    console.log('❌ Test 4: Structure de l\'application incorrecte');
    testsFailed++;
}

// Résumé des tests
console.log('\n📊 Résumé des tests:');
console.log(`   Tests réussis: ${testsPassed}`);
console.log(`   Tests échoués: ${testsFailed}`);
console.log(`   Total: ${testsPassed + testsFailed}`);

if (testsFailed > 0) {
    console.log('\n❌ Certains tests ont échoué!');
    process.exit(1);
} else {
    console.log('\n✅ Tous les tests sont passés avec succès!');
    process.exit(0);
}
