@REM Maakt output/overleaf.zip om in Overleaf verder te werken

docker build -t gradproject-tex -f docker/Dockerfile .
if errorlevel 1 goto einde

docker run --rm -v "%cd%":/project gradproject-tex sh /project/docker/overleaf.sh

:einde
pause
