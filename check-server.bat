@echo off
echo === Verification du serveur ===

echo.
echo 1. Verification du serveur Django...
curl -I http://127.0.0.1/

if %ERRORLEVEL% NEQ 0 (
    echo [ERREUR] Le serveur Django n'est pas accessible sur le port 443.
    echo Veuillez demarrer votre serveur Django avec:
    echo python manage.py runserver
) else (
    echo [OK] Le serveur Django est accessible.
)

echo.
echo 2. Verification de la configuration Nginx...
tasklist /FI "IMAGENAME eq nginx.exe" | find "nginx.exe" > nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERREUR] Nginx n'est pas en cours d'execution.
    echo Demarrez Nginx avec: nginx.exe
) else (
    echo [OK] Nginx est en cours d'execution.
    echo Verification de la connexion via Nginx:
    echo.
    curl -k -I https://127.0.0.1/
)

echo.
echo === Diagnostic complet ===
echo.
echo Configuration actuelle:
echo - Django: http://127.0.0.1
echo - Nginx: https://127.0.0.1
echo - Proxy: Nginx redirige vers Django

echo.
echo Verifiez les logs d'erreur dans: logs\error.log
echo Verifiez les logs du proxy dans: logs\django_proxy_error.log
echo.
