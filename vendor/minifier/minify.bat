@echo off
echo DESCRIPTION
echo These script will compress assets/js/application.js and assets/css/styles.css. The compressed files have the sufix -min
echo These files are compressed using yuicompressor.
echo.
echo REQUIRES:
echo This files requires yuicompressor-2.4.7.jar or another version of yuicompressor to work.
echo This files requires java
echo.
echo AUTHOR:
echo	Vinicius Ebersol
echo.
echo DATE:
echo	17/09/2012

echo.
echo.
echo =========================
echo compress files started...
echo =========================
echo.
echo.


echo.
echo.
echo www/assets/js/application.js to www/assets/js/application-min.js
echo.
echo.

@echo on

cd ../../www/assets/js/
del application-min.js
cd ../../../vendor/minifier/
java -jar yuicompressor-2.4.7/build/yuicompressor-2.4.7.jar ../../www/assets/js/application.js --nomunge -o ../../www/assets/js/application-min.js

@echo off

echo.
echo.
echo www/assets/css/styles.css to www/assets/js/styles-min.css
echo.
echo.

@echo on

cd ../../www/assets/css/
del styles-min.css
cd ../../../vendor/minifier/
java -jar yuicompressor-2.4.7/build/yuicompressor-2.4.7.jar ../../www/assets/css/styles.css --nomunge -o ../../www/assets/css/styles-min.css

@echo off

echo.
echo.
echo ================================
echo files successfully compressed!!!
echo ================================
echo.
echo.
echo ### ATENTION!!!
echo.
echo ### Cache control is a version number that will be inserted after css and javascript
echo ### filenames in HTML documents in order to avoid cache problems on deploy.
echo.
echo ### Example: styles-min.css?v=1231
echo.
echo.

set /p PROCEED= Do you want to proceed to cache controll (y, n)?

if /i {%PROCEED%}=={y} (goto :yes)
if /i {%PROCEED%}=={yes} (goto :yes)
goto :no

:yes

echo.
echo.
echo ================================
echo Cache controll changes started
echo ================================
echo.
echo.

Set CURRENTDIR=%CD%
set RANDNUM=%random%

cd ..\..\www

%CURRENTDIR%\rxfind.exe *.html /p:"(\.css\?v=)[0-9]+" /r:".css?v=%RANDNUM%" /F /B:2 /S
%CURRENTDIR%\rxfind.exe *.html /p:"(\.js\?v=)[0-9]+" /r:".js?v=%RANDNUM%" /F /B:2 /S

echo.
echo.
echo ================================
echo Cache controll changes finished!
echo ================================
echo.
echo.

:no


echo.
echo.
echo ================================
echo Task finished!!!
echo ================================
echo.
echo.

pause
