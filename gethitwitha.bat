@echo off
:loop

SETLOCAL EnableExtensions
SET EXE=ClassroomWindows.exe
REM for testing
REM SET EXE=svchost.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF NOT %%x == %EXE% (
  ECHO %EXE% is Not Running - Made by Combobreak
ECHO %EXE% Kill attemped made.
  REM This GOTO may be not necessary
  GOTO notRunning
) ELSE (
  ECHO %EXE% is running - Made By Combobreak
  GOTO Running
)
:Running
taskkill /f /im ClassroomWindows.exe

:notRunning
goto loop
