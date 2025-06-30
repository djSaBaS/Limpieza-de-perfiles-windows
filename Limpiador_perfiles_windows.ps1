function Show-Menu {
    Clear-Host
    Write-Host "============================================================"
    Write-Host "=============== Limpiador de Perfiles ======================"
    Write-Host "=============== by SABAS ==================================="
    Write-Host "=============== WINDOWS 10/11 =============================="
    Write-Host "============================================================"
    Write-Host ""
    Write-Host "************************************************************"
    Write-Host "*************************-=[MENU]=-*************************"
    Write-Host "************************************************************"
    Write-Host "1) Limpiar todos los perfiles"
    Write-Host "2) Limpiar perfiles Curso Mañana"
    Write-Host "3) Limpiar perfiles Curso Tarde"
    Write-Host "4) Crear perfiles Curso Mañana y Curso Tarde"
    Write-Host "5) Acerca de..."
    Write-Host "6) Borrar perfiles indicados"
    Write-Host "7) Salir"
    Write-Host "************************************************************"
    Write-Host ""
}

function Clean-All-Profiles {
    Write-Host "Limpiando todos los perfiles..."
    Remove-Item -Recurse -Force "C:\Users\CURSO MAÑANA","C:\Users\Curso Mañana","C:\Users\curso mañana","C:\Users\curso mañanas","C:\Users\curso medio dia","C:\Users\Curso Tarde","C:\Users\CURSO TARDE","C:\Users\curso tardes","C:\Users\curso tarde"
    net user "CURSO MAÑANA" /delete
    net user "curso mañana" /delete
    net user "Curso Mañana" /delete
    net user "curso mañanas" /delete
    net user "curso medio dia" /delete
    net user "curso tarde" /delete
    net user "CURSO TARDE" /delete
    net user "Curso Tarde" /delete
    net user "curso tardes" /delete
    net user "curso tarde" /delete
    net user "curso mañana" /add
    net localgroup administrators "curso mañana" /add
    WMIC USERACCOUNT WHERE "Name='curso mañana'" SET PasswordExpires=FALSE
    net user "curso tarde" /add
    net localgroup administrators "curso tarde" /add
    WMIC USERACCOUNT WHERE "Name='curso tarde'" SET PasswordExpires=FALSE
    Write-Host "FINALIZADO!!!"
}

function Clean-Morning-Profiles {
    Write-Host "Limpiando perfiles Curso Mañana..."
    Remove-Item -Recurse -Force "C:\Users\CURSO MAÑANA","C:\Users\Curso Mañana","C:\Users\curso mañana","C:\Users\curso mañanas"
    net user "CURSO MAÑANA" /delete
    net user "curso mañana" /delete
    net user "Curso Mañana" /delete
    net user "curso mañanas" /delete
    net user "curso mañana" /add
    net localgroup administrators "curso mañana" /add
    WMIC USERACCOUNT WHERE "Name='curso mañana'" SET PasswordExpires=FALSE
}

function Clean-Afternoon-Profiles {
    Write-Host "Limpiando perfiles Curso Tarde..."
    Remove-Item -Recurse -Force "C:\Users\Curso Tarde","C:\Users\CURSO TARDE","C:\Users\curso tardes","C:\Users\curso tarde"
    net user "curso tarde" /delete
    net user "CURSO TARDE" /delete
    net user "Curso Tarde" /delete
    net user "curso tardes" /delete
    net user "curso tarde" /delete
    net user "curso tarde" /add
    net localgroup administrators "curso tarde" /add
    WMIC USERACCOUNT WHERE "Name='curso tarde'" SET PasswordExpires=FALSE
}

function Create-Profiles {
    Write-Host "Creando perfiles Curso Mañana y Curso Tarde..."
    net user "curso mañana" /add
    net localgroup administrators "curso mañana" /add
    WMIC USERACCOUNT WHERE "Name='curso mañana'" SET PasswordExpires=FALSE
    net user "curso tarde" /add
    net localgroup administrators "curso tarde" /add
    WMIC USERACCOUNT WHERE "Name='curso tarde'" SET PasswordExpires=FALSE
}

function Delete-Custom-Profiles {
    $cantidad = Read-Host "Introduce el numero de perfiles a eliminar"
    for ($i = 1; $i -le [int]$cantidad; $i++) {
        $usuario = Read-Host "Nombre de usuario $i"
        $requiere = Read-Host "Requiere contrasena? (s/n)"
        if ($requiere -eq 's') {
            $clave = Read-Host "Introduce la contrasena para $usuario"
            net user "$usuario" "$clave" /delete
        } else {
            net user "$usuario" /delete
        }
        $path = "C:\\Users\\$usuario"
        if (Test-Path $path) {
            Remove-Item -Recurse -Force $path
        }
    }
}

function About {
    Clear-Host
    Write-Host "Acerca de..."
    Write-Host "Esta version del Limpiador de perfiles by SABAS"
    Write-Host "se la dedico a todos los Tecnicos informaticos"
    Write-Host "de Dipaweb que tanto y tanto me han enseñado."
    Write-Host "Javier"
    Write-Host "Pedro"
    Write-Host "JC"
    Write-Host "Oscar"
    Write-Host "Rober"
    Write-Host "Alex quien me animo y reto hacer este menu..."
    Write-Host ""
    Write-Host "Un saludo a todos y disfrutarlo con moderacion."
    Write-Host ""
    Write-Host "...PAZ Y DINERO FACIL..."
    Write-Host ""
    Write-Host "Juan Antonio Sanchez Plaza a.k.a. SABAS"
}

function Main {
    do {
        Show-Menu
        $choice = Read-Host "Seleccione una opcion [1-7]"
        switch ($choice) {
            1 { Clean-All-Profiles }
            2 { Clean-Morning-Profiles }
            3 { Clean-Afternoon-Profiles }
            4 { Create-Profiles }
            5 { About }
            6 { Delete-Custom-Profiles }
            7 { exit }
            default { Write-Host "Lo que has indicado no esta dentro del 1 al 7.... ESPABILA TIO!" }
        }
        pause
    } while ($choice -ne 7)
}

Main
