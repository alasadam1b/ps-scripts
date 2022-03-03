function mosCmdlet {
    $alias = Read-Host "Escribe un alias"

}
function mosAlias {
    $cmdlet = Read-Host "Escribe un cmdlet"

}
function mosAyuda {
    $cmdlet = Read-Host "Escribe un cmdlet"
}
function verbosText {
    $text = Read-Host "Escribe el texto"

}s
function cmdletText {
    $text = Read-Host "Escribe el texto"

}

function menu {
    do {
        Clear-Host
        Write-Host "
        MENÚ 03
        1. Pedir un alias y mostrar su cmdlet
        2. Pedir un cmdlet y motrar todos sus alias
        3. Pedir un cmdlet y mostar su ayuda
        4. Pedir un texto y mostrar todos los verbos que empiecen por el texto
        5. Pedir un texto y mostrar lodos los cmdlet que empiecen por el texto
        S. Salir
        "
        $op = Read-Host "Elige opción"
        
        switch ($op) {
            1 { mosCmdlet }
            2 { mosAlias }
            3 { mosAyuda }
            4 { verbosText }
            5 { cmdletText }
        }
        Pause
    } until ($op.ToUpper() -eq "S")
}

menu