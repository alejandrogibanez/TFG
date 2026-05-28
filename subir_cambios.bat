@echo off
:: Cambiar la codificación a UTF-8 para evitar problemas con tildes en los mensajes
chcp 65001 > nul

:: Obtener la fecha y hora actual del sistema
set FECHA=%date% %time%

echo === Iniciando subida de cambios a Git ===
echo Fecha y hora actual: %FECHA%
echo.

:: 1. Añadir todos los cambios (nuevos y modificados)
echo [+] Añadiendo archivos...
git add .

:: 2. Hacer el commit con la fecha dinámica
echo [+] Creando commit...
git commit -m "Commit automático: %FECHA%"

:: 3. Subir los cambios a la rama actual
echo [+] Subiendo a GitHub/GitLab...
git push

echo.
echo === Proceso finalizado con éxito ===
pause