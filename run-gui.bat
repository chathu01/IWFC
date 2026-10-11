@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"

echo ============================================
echo  IWFC Swing GUI Launcher
echo ============================================

where javac >nul 2>nul
if errorlevel 1 (
  echo Java JDK was not found. Install JDK 17 or newer and add it to PATH.
  pause
  exit /b 1
)

if exist out rmdir /s /q out
mkdir out

rem Build a quoted source-file list directly on the command line. This avoids
rem Java argument-file escaping and works when the project path contains spaces.
set "sources="
for /r "src\main\java" %%F in (*.java) do set sources=!sources! "%%~fF"
javac -encoding UTF-8 --release 17 -d out !sources!
if errorlevel 1 (
  echo.
  echo Compilation failed. Review the errors above.
  pause
  exit /b 1
)

java -cp out com.iwfc.ui.IWFCGui
endlocal
