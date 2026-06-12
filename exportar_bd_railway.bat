@echo off
echo ============================================
echo  EXPORTAR BASE DE DATOS LOCAL PARA RAILWAY
echo ============================================

set PGPASSWORD=101606
set DB=ROS_db
set USER=postgres
set HOST=127.0.0.1
set PORT=5432
set ARCHIVO=backup_para_railway.sql

echo Exportando base de datos %DB%...
pg_dump -h %HOST% -p %PORT% -U %USER% -d %DB% --no-owner --no-acl -f %ARCHIVO%

if %ERRORLEVEL% == 0 (
    echo.
    echo Backup creado: %ARCHIVO%
    echo.
    echo SIGUIENTE PASO:
    echo 1. Ve a Railway ^> tu proyecto ^> PostgreSQL ^> Data
    echo 2. Haz clic en "Connect" y copia la DATABASE_URL
    echo 3. Ejecuta este comando para importar:
    echo    psql TU_DATABASE_URL_DE_RAILWAY -f %ARCHIVO%
    echo.
) else (
    echo ERROR al exportar. Verifica que PostgreSQL este corriendo.
)
pause
