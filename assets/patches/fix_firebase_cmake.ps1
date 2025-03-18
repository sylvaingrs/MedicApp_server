# Chemin vers le fichier CMakeLists.txt de Firebase
$firebaseCMakePath = "build/windows/x64/extracted/firebase_cpp_sdk_windows/CMakeLists.txt"

# Vérifier si le fichier existe
if (Test-Path $firebaseCMakePath) {
    # Lire le contenu du fichier
    $content = Get-Content $firebaseCMakePath -Raw
    
    # Remplacer la version minimale de CMake
    $updatedContent = $content -replace 'cmake_minimum_required\(VERSION [0-9]+\.[0-9]+\)', 'cmake_minimum_required(VERSION 3.5)'
    
    # Écrire le contenu mis à jour
    Set-Content -Path $firebaseCMakePath -Value $updatedContent
    
    Write-Host "CMakeLists.txt de Firebase mis à jour avec succès."
} else {
    Write-Host "Le fichier CMakeLists.txt de Firebase n'a pas été trouvé."
}