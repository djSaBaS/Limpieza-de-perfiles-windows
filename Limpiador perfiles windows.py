import os
import shutil
import subprocess

def show_menu():
    print("============================================================")
    print("=============== Limpiador de Perfiles ======================")
    print("=============== by SABAS ===================================")
    print("=============== WINDOWS 10/11 ==============================")
    print("============================================================")
    print("")
    print("************************************************************")
    print("*************************-=[MENU]=-*************************")
    print("************************************************************")
    print("1) Limpiar todos los perfiles")
    print("2) Limpiar perfiles Curso Mañana")
    print("3) Limpiar perfiles Curso Tarde")
    print("4) Crear perfiles Curso Mañana y Curso Tarde")
    print("5) Acerca de...")
    print("6) Borrar perfiles indicados")
    print("7) Salir")
    print("************************************************************")
    print("")

def clean_all_profiles():
    print("Limpiando todos los perfiles...")
    profiles = ["CURSO MAÑANA", "Curso Mañana", "curso mañana", "curso mañanas", "curso medio dia", "Curso Tarde", "CURSO TARDE", "curso tardes", "curso tarde"]
    for profile in profiles:
        path = os.path.join("C:\\Users", profile)
        if os.path.exists(path):
            shutil.rmtree(path)
        subprocess.run(["net", "user", profile, "/delete"])
    create_profiles()
    print("FINALIZADO!!!")

def clean_morning_profiles():
    print("Limpiando perfiles Curso Mañana...")
    profiles = ["CURSO MAÑANA", "Curso Mañana", "curso mañana", "curso mañanas"]
    for profile in profiles:
        path = os.path.join("C:\\Users", profile)
        if os.path.exists(path):
            shutil.rmtree(path)
        subprocess.run(["net", "user", profile, "/delete"])
    create_profile("curso mañana")
    print("FINALIZADO!!!")

def clean_afternoon_profiles():
    print("Limpiando perfiles Curso Tarde...")
    profiles = ["Curso Tarde", "CURSO TARDE", "curso tardes", "curso tarde"]
    for profile in profiles:
        path = os.path.join("C:\\Users", profile)
        if os.path.exists(path):
            shutil.rmtree(path)
        subprocess.run(["net", "user", profile, "/delete"])
    create_profile("curso tarde")
    print("FINALIZADO!!!")

def create_profiles():
    create_profile("curso mañana")
    create_profile("curso tarde")

def create_profile(profile_name):
    subprocess.run(["net", "user", profile_name, "/add"])
    subprocess.run(["net", "localgroup", "administrators", profile_name, "/add"])
    subprocess.run(["WMIC", "USERACCOUNT", "WHERE", f"Name='{profile_name}'", "SET", "PasswordExpires=FALSE"])

def delete_custom_profiles():
    cantidad = int(input("Introduce el numero de perfiles a eliminar: "))
    for i in range(1, cantidad + 1):
        usuario = input(f"Nombre de usuario {i}: ")
        requiere = input("Requiere contrasena? (s/n): ")
        if requiere.lower() == "s":
            clave = input(f"Introduce la contrasena para {usuario}: ")
            subprocess.run(["net", "user", usuario, clave, "/delete"])
        else:
            subprocess.run(["net", "user", usuario, "/delete"])
        path = os.path.join("C:\\Users", usuario)
        if os.path.exists(path):
            shutil.rmtree(path)

def about():
    print("Acerca de...")
    print("Esta version del Limpiador de perfiles by SABAS")
    print("se la dedico a todos los Tecnicos informaticos")
    print("de Dipaweb que tanto y tanto me han enseñado.")
    print("Javier")
    print("Pedro")
    print("JC")
    print("Oscar")
    print("Rober")
    print("Alex quien me animo y reto hacer este menu...")
    print("")
    print("Un saludo a todos y disfrutarlo con moderacion.")
    print("")
    print("...PAZ Y DINERO FACIL...")
    print("")
    print("Juan Antonio Sanchez Plaza a.k.a. SABAS")

def main():
    while True:
        show_menu()
        choice = input("Seleccione una opcion [1-7]: ")
        if choice == "1":
            clean_all_profiles()
        elif choice == "2":
            clean_morning_profiles()
        elif choice == "3":
            clean_afternoon_profiles()
        elif choice == "4":
            create_profiles()
        elif choice == "5":
            about()
        elif choice == "6":
            delete_custom_profiles()
        elif choice == "7":
            break
        else:
            print("Lo que has indicado no esta dentro del 1 al 7.... ESPABILA TIO!")
        input("Presione Enter para continuar...")

if __name__ == "__main__":
    main()
