function addAlumno {
    Clear-Host
    [int]$entradaNum = Read-Host "Escribe la clave del alumno"
    [string]$entradaNom = Read-Host "Escribe el nombre"
    
    if (!$alumnos.ContainsValue( $entradaNom.ToLower() )) {
        $alumnos.Add($entradaNum, $entradaNom.ToLower())
    }
    else { Write-Host "El nombre ya existe" }
}
function borrarAlumno {
    mostrar
    [int]$key = Read-Host "Escribe la clave del alumno a eliminar"
    $alumnos.Remove($key)
}
function buscarNombre {
    
}
function mostrar {
    Clear-Host
    $alumnos
    Write-Host
}

$alumnos = @{1="juan"; 2="oscar"; 3="adrian"; 4="javier"}
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
