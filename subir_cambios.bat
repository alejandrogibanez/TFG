@echo off
:: Cambiar la codificación a UTF-8 para evitar problemas con tildes en los mensajes
chcp 65001 > nul

:: 1. Capturar la hora actual y formatearla a HH:MM (gestionando el espacio de las mañanas)
set HORA_LIMPIA=%time:~0,5%
set HORA_LIMPIA=%HORA_LIMPIA: =0%

:: 2. Unir la fecha y la hora limpia
set FECHA=%date% a las %HORA_LIMPIA%

echo === Iniciando subida de cambios a Git ===
echo Fecha y hora actual: %FECHA%
echo.

:: 3. Añadir todos los cambios (nuevos y modificados)
echo [+] Añadiendo archivos...
git add .

:: 4. Hacer el commit con la fecha y hora filtradas
echo [+] Creando commit...
git commit -m "Commit automático: %FECHA%"

:: 5. Subir los cambios a la rama actual
echo [+] Subiendo a GitHub/GitLab...
git push

echo.
echo === Proceso finalizado con éxito ===
pause