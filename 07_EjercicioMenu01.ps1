function addAlumno {
    Clear-Host
    [string]$entrada = Read-Host "Escribe el nombre"
    if (!$alumnos.ContainsValue($entrada)) {
        
    }
    else { Write-Host "El nombre ya existe" }
}
function borrarAlumno {
    mostrar
    [int]$entrada = Read-Host "Escribe ... a eliminar"
    $alumnos.Remove($entrada)
}
function buscarNombre {
    
}
function mostrar {
    Clear-Host
    
}

$alumnos = @{1="juan"; 2="Oscar"; 3="Adrian"; 4="Javier"}
do {
    Clear-Host
    Write-Host "
    MEN� 01
    1 - A�adir alumno
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
