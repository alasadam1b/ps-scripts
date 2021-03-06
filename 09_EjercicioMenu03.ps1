function mosCmdlet {
    $alias = Read-Host "Escribe un alias"
    Get-Alias $alias
}
function mosAlias {
    $cmdlet = Read-Host "Escribe un cmdlet"
    Get-Alias -Definition $cmdlet
}
function mosAyuda {
    $cmdlet = Read-Host "Escribe un cmdlet"
    Get-Help $cmdlet
}
function verbosText {
    $text = Read-Host "Escribe el texto"
    Get-Verb "$text*"
}
function cmdletText {
    $text = Read-Host "Escribe el texto"
    Get-Command "$text*"
}

function menu {
    do {
        Clear-Host
        Write-Host "
        MEN? 03
        1. Pedir un alias y mostrar su cmdlet
        2. Pedir un cmdlet y motrar todos sus alias
        3. Pedir un cmdlet y mostar su ayuda
        4. Pedir un texto y mostrar todos los verbos que empiecen por el texto
        5. Pedir un texto y mostrar lodos los cmdlet que empiecen por el texto
        S. Salir
        "
        $op = Read-Host "Elige opci?n"
        
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