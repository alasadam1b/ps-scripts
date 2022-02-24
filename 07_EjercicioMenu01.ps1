function addAlumno {
    Clear-Host
    [string]$entrada = Read-Host "Escribe el nombre"
    if (!$alumnos.ContainsValue($entrada)) {
        $alumnos.Add($alumnos.Count + 1, $entrada)
    }
    else { Write-Host "El nombre ya existe" }
}
function borrarAlumno {
    mostrar
    [string]$entrada = Read-Host "Escribe el nombre a eliminar"
    $alumnos.Add($alumnos.Count + 1, $entrada)
}
function buscarNombre {
    
}
function mostrar {
    Clear-Host
    for ($i = 1; $i -le $alumnos.Count; $i++) {
        Write-Host $alumnos[$i]
    }
}

$alumnos = @{1="juan"; 2="Oscar"; 3="Adrian"; 4="Javier"}
do {
    Clear-Host
    Write-Host "
    MENÚ 01
    1 - Añadir alumno
    2 - Eliminar alumno
    3 - Buscar por nombre
    4 - Mostrar alumnos
    S - Salir
    "
    $op = Read-Host "Elige opcion"
    
    switch ($op) {
        1 { addAlumno }
        2 { borrarAlumno }
        3 { buscarNombre }
        4 { mostrar }
    }
    Pause
} until ($op.ToUpper() -eq "S")
