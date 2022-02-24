function ej1 {
    Clear-Host
    [int]$max = Read-Host "Escribe nº max." 

    for ($i = 0; $i -le $max; $i++) {
        Write-Host $i
    }    
}
function ej2 {
    [array]$pueblos = "TUDELA", "ALSASUA", "LEKUNBERRI", "AOIZ"

    for ($i = 0; $i -lt $pueblos.Count; $i++) {
        Write-Host $pueblos[$i]
    }    
}
function ej3 {
    Clear-Host
    [array]$a = @()
    [array]$b = @()

    while (1 -eq 1) {
        [string]$nom = (Read-Host "Escribe un  nombre (I para imprimir)").ToLower()
        if ($nom -eq "I") {break}
        [string]$gen = (Read-Host "Escribe genero H/M").ToLower()

        if (($gen -eq "m" -and $nom[0] -lt "m") -or ($gen -eq "h" -and $nom[0] -gt "n")) { $a += $nom }
        else {$b += $nom + " "}
    }

    Write-Host "Grupo A:"
    foreach ($item in $a) {
        Write-Host $item
    }

    Write-Host "Grupo B:"
    foreach ($item in $b) {
        Write-Host $item
    }
}
function ej4 {
    Clear-Host

    [string]$fra = Read-Host "Escribe una frase"
    [char]$let = Read-Host "Escribe una letra"
    [int]$can = 0
    
    for ($i = 0; $i -lt $fra.Length; $i++) {
        if ($fra[$i] -eq $let) {
            $can ++
        } 
    }
    Write-Host $can
}
function menu {
    
    do {
        Clear-Host
        Write-Host "
        1 - Ejercicio 1
        2 - Ejercicio 2
        3 - Ejercicio 3
        4 - Ejercicio 4
        S - Salir
        "
        $op = Read-Host "Elige opcion"
        
        switch ($op) {
            1 { ej1 }
            2 { ej2 }
            3 { ej3 }
            4 { ej4 }
        }
        Pause
    } until ($op.ToUpper() -eq "S")
}

menu