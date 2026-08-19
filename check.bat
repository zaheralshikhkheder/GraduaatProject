@REM Kijkt je documenten na voor je ze indient

docker build -t gradproject-tex -f docker/Dockerfile .
if errorlevel 1 goto einde

docker run --rm -v "%cd%":/project gradproject-tex sh /project/docker/check.sh

:einde
pause
