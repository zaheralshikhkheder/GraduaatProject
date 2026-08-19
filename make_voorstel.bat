@REM Bouwt het projectvoorstel tot een PDF in output
@REM Je hebt hiervoor enkel Docker nodig, geen LaTeX-installatie.
@REM Resultaat: output\voorstel.pdf

docker build -t gradproject-tex -f docker/Dockerfile .
if errorlevel 1 goto einde

docker run --rm -v "%cd%":/project gradproject-tex sh /project/docker/render.sh voorstel

:einde
pause
