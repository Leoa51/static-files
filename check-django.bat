@echo off
echo Vérification de la disponibilité du serveur Django...
curl -I http://127.0.0.1/
echo.

if %ERRORLEVEL% NEQ 0 (
    echo Le serveur Django ne semble pas en cours d'exécution sur le port 443.
    echo Veuillez démarrer votre serveur Django avec:
    echo python manage.py runserver
) else (
    echo Le serveur Django est accessible.
)
