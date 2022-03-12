function testConn {
    Clear-Host
    foreach($row in Get-Content .\ips.txt) {
        if (Test-Connection $row) {
            Write-Host $row" - Conexión establecida"
        }
        else {
            Write-Host $row" - Conexión fallida"
        }
    }
}
function mostrarDat {
    Clear-Host
    $listOfRows = Import-Csv ".\users.csv" -Delimiter ";"
    $salida=""
    foreach($row in $listOfRows) {
        $salida = Write-Host $row.Id $row.Username $row.Location
    }
    $salida
}
function lsDir {
    $dir = Read-Host "Escribe la ruta a listar"
    Get-ChildItem $dir
}
function treeDirS {
    $dir = Read-Host "Escribe la ruta a mostrar"
    tree $dir
}
function treeDirC {
    $dir = Read-Host "Escribe la ruta a mostrar"
    tree $dir /f
}
function usuAct {
    foreach($user in Get-LocalUser) {
        if ($user.Enabled) {
            Write-Host $user
        }
    }
}
function usuDes {
    foreach($user in Get-LocalUser) {
        if (!$user.Enabled) {
            Write-Host $user
        }
    }
}
function nomGrup {
    foreach($group in Get-LocalGroup | Sort-Object -Descending) {
        [string]$group >> .\grupos.txt
    }
}

function menu {
    do {
        Clear-Host
        Write-Host "
        MENÚ 04
        1. Lee un fichero ips.txt (tendras varias ips, una por línea), haz
           un Test-Connection y muestra un mensaje (Conexión establecida/ Conexión fallida).
        2. Lee un fichero users.csv y muestra solo los datos de las columnas
           Id, Username y Location.
        3. Pide la ruta de un directorio y lista el contenido de dicho
           directorio usando un cmdlet.
        4. Pide la ruta de un directorio y muestra su estructura sin
           ficheros (la función será la misma en el punto 4 y 5).
        5. Pide la ruta de un directorio y muestra su estructura con
           ficheros (la función será la misma en el punto 4 y 5).
        6. Lista los usuarios locales que estén activados (la función
           será la misma en el punto 6 y 7).
        7. Lista los usuarios locales que estén desactivados (la función
           será la misma en el punto 6 y 7).
        8. Lista los grupos locales y mandalos solo su nombre a un fichero
           grupos.txt en orden descendente. 
        S. Salir
        "
        $op = Read-Host "Elige opción"
        
        switch ($op) {
            1 { testConn }
            2 { mostrarDat }
            3 { lsDir }
            4 { treeDirS }
            5 { treeDirC }
            6 { usuAct }
            7 { usuDes }
            8 { nomGrup }
        }
        Pause
    } until ($op.ToUpper() -eq "S")
}

$null > grupos.txt
menu