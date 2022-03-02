function numAleatorios {
    Clear-Host
    [int]$max = 0
    for ($i = 0; $i -lt 10; $i++) {
        [int]$rand = Get-Random
        $rand >> aleatorios.txt
        if ($rand -gt $max) {
            $max = $rand
        }
    }
    Write-Host $max
    Get-Date | Write-Host
}
function mostrarUsuarios {
    Clear-Host
    Get-LocalUser | Write-Host
}
function secuenciaPares {
    Clear-Host
    for ($i = 2; $i -lt 50; $i++){
        if ($i%2 -eq 0) {
            Write-Host $i
        }
    }
}
function numeroMenor {
    [int64]$min = 99999999999
    foreach($row in Get-Content .\aleatorios.txt) {
        if ($row -lt $min) {
            $min = $row
        }
    }
    Write-Host $min
}
function guardarArray {
    for ($i = 0; $i -lt 10; $i++){
        [string]$entradaNom = Read-Host "Escribe un nombre"
        $array += $entradaNom + "`n"
    }
    $array > listaNombres.txt
}

$null > aleatorios.txt
$null > listaNombres.txt
do {
    Clear-Host
    Write-Host "
    MENÚ 02
    1 - BUCLE 10 REPETICIONES QUE OBTENGA DIEZ NÚMEROS ALEATORIOS, SE GUARDEN
        EN UN TXT E INFORME DEL NÚMERO MAYOR, LA FECHA Y LA HORA DEL SISTEMA
    2 - MOSTRAR USUARIOS LOCALES DEL SISTEMA
    3 - SECUENCIA -> DESDE EL NÃšMERO 2 MOSTRAR TODOS LOS PARES HASTA EL
        NÚMERO 50
    4 - LEER TXT LEER TXT DE LA OPCION 1 Y MOSTRAR POR PANTALLA EL NÚMERO
        MENOR
    5 - PEDIR 10 NOMBRES DE PERSONAS GUARDARLAS EN UN ARRAY ORDENADO Y
        GUARDARLA EN UN TXT
    S - SALIR
    "
    $op = Read-Host "Elige opción"
    
    switch ($op) {
        1 { numAleatorios }
        2 { mostrarUsuarios }
        3 { secuenciaPares }
        4 { numeroMenor }
        5 { guardarArray }
    }
    Pause
} until ($op.ToUpper() -eq "S")
