function testConn {
    
}
function mostrarDat {
    
}
function lsDir {
    
}
function treeDirS {
    
}
function treeDirC {
    
}
function usuAct {
    
}
function usuDes {
    
}
function nomGrup {
    
}

function menu {
    do {
        Clear-Host
        Write-Host "
        MEN� 04
        1. Lee un fichero ips.txt (tendras varias ips, una por l�nea), haz un Test-Connection y muestra un mensaje (Conexi�n establecida/ Conexi�n fallida).
        2. Lee un fichero users.csv y muestra solo los datos de las columnas Id, Username y Location.
        3. Pide la ruta de un directorio y lista el contenido de dicho directorio usando un cmdlet.
        4. Pide la ruta de un directorio y muestra su estructura sin ficheros (la funci�n ser� la misma en el punto 4 y 5).
        5. Pide la ruta de un directorio y muestra su estructura con ficheros (la funci�n ser� la misma en el punto 4 y 5).
        6. Lista los usuarios locales que est�n activados (la funci�n ser� la misma en el punto 6 y 7).
        7. Lista los usuarios locales que est�n desactivados (la funci�n ser� la misma en el punto 6 y 7).
        8. Lista los grupos locales y mandalos solo su nombre a un fichero grupos.txt en orden descendente. 
        S. Salir
        "
        $op = Read-Host "Elige opci�n"
        
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

menu