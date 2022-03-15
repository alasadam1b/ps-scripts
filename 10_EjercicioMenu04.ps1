function testConn {
    Clear-Host
    foreach($row in Get-Content .\ips.txt) {
        if (Test-Connection $row) {
            Write-Host $row" - Conexi�n establecida"
        }
        else {
            Write-Host $row" - Conexi�n fallida"
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
function treeDir([bool]$param) {
    $dir = Read-Host "Escribe la ruta a mostrar"
    if ($param) {
        tree $dir /f
    }
    else {
        tree $dir
    }
}
function usuAct([bool]$param) {
    foreach($user in Get-LocalUser) {
        if ($user.Enabled -eq $param) {
            Write-Host $user
        }
    }
}
function nomGrup {
    foreach($group in Get-LocalGroup | Sort-Object -Descending) {
        [string]$group
        [string]$group >> .\grupos.txt
    }
}

function menu {
    do {
        Clear-Host
        Write-Host "
        MEN� 04
        1. Lee un fichero ips.txt (tendras varias ips, una por l�nea), haz
           un Test-Connection y muestra un mensaje (Conexi�n establecida/ Conexi�n fallida).
        2. Lee un fichero users.csv y muestra solo los datos de las columnas
           Id, Username y Location.
        3. Pide la ruta de un directorio y lista el contenido de dicho
           directorio usando un cmdlet.
        4. Pide la ruta de un directorio y muestra su estructura sin
           ficheros (la funci�n ser� la misma en el punto 4 y 5).
        5. Pide la ruta de un directorio y muestra su estructura con
           ficheros (la funci�n ser� la misma en el punto 4 y 5).
        6. Lista los usuarios locales que est�n activados (la funci�n
           ser� la misma en el punto 6 y 7).
        7. Lista los usuarios locales que est�n desactivados (la funci�n
           ser� la misma en el punto 6 y 7).
        8. Lista los grupos locales y mandalos solo su nombre a un fichero
           grupos.txt en orden descendente. 
        S. Salir
        "
        $op = Read-Host "Elige opci�n"
        
        switch ($op) {
            1 { testConn }
            2 { mostrarDat }
            3 { lsDir }
            4 { treeDir($False) }
            5 { treeDir($True) }
            6 { usuAct($True) }
            7 { usuAct($False) }
            8 { nomGrup }
            S { Write-Host "Opci�n inv�lida" -ForegroundColor Red }
        }
        Pause
    } until ($op.ToUpper() -eq "S")
}

$null > grupos.txt
menu