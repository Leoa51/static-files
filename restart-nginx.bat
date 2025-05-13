@echo off
echo Arrêt de Nginx...
taskkill /F /IM nginx.exe /T
timeout /t 2 /nobreak > nul

echo Suppression du fichier PID...
if exist logs\nginx.pid del /F logs\nginx.pid

echo Démarrage de Nginx...
start /B nginx.exe
echo Nginx a été redémarré.
