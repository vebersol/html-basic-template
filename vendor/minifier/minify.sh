#!/bin/bash

echo DESCRIPTION
echo This script will compress assets/js/application.js and assets/css/styles.css. The compressed files have the sufix -min
echo These files are compressed using yuicompressor.
echo
echo REQUIRES:
echo This files requires yuicompressor-2.4.7.jar or another version of yuicompressor to work.
echo This files requires java
echo
echo AUTHOR:
echo	Vinicius Ebersol
echo
echo DATE:
echo	15/01/2013

echo
echo
echo =========================
echo compress files started...
echo =========================
echo
echo


echo
echo
echo www/assets/js/application.js to www/assets/js/application-min.js
echo
echo

cd ../../www/assets/js/
rm application-min.js
cd ../../../vendor/minifier/
java -jar yuicompressor-2.4.7/build/yuicompressor-2.4.7.jar ../../www/assets/js/application.js --nomunge -o ../../www/assets/js/application-min.js

echo
echo
echo www/assets/js/headerApplication.js to www/assets/js/headerApplication-min.js
echo
echo

cd ../../www/assets/js/
rm headerApplication-min.js
cd ../../../vendor/minifier/
java -jar yuicompressor-2.4.7/build/yuicompressor-2.4.7.jar ../../www/assets/js/headerApplication.js --nomunge -o ../../www/assets/js/headerApplication-min.js

echo
echo
echo www/assets/css/styles.css to www/assets/js/styles-min.css
echo
echo

cd ../../www/assets/css/
rm styles-min.css
cd ../../../vendor/minifier/
java -jar yuicompressor-2.4.7/build/yuicompressor-2.4.7.jar ../../www/assets/css/styles.css --nomunge -o ../../www/assets/css/styles-min.css

echo
echo
echo ================================
echo files successfully compressed!!!
echo ================================
echo
echo
echo "### ATENTION!!!"
echo
echo "### Cache control is a version number that will be inserted after css and javascript"
echo "### filenames in HTML documents in order to avoid cache problems on deploy."
echo
echo "### Example: styles-min.css?v=1231"
echo
echo

# if /i {%PROCEED%}=={y} (goto :yes)
# if /i {%PROCEED%}=={yes} (goto :yes)
# goto :no

# :yes

# echo.
# echo.
# echo ================================
# echo Cache controll changes started
# echo ================================
# echo.
# echo.

# Set CURRENTDIR=%CD%
# set RANDNUM=%random%

# cd ..\..\www

# %CURRENTDIR%\rxfind.exe *.html /p:"(\.css\?v=)[0-9]+" /r:".css?v=%RANDNUM%" /F /B:2 /S
# %CURRENTDIR%\rxfind.exe *.html /p:"(\.js\?v=)[0-9]+" /r:".js?v=%RANDNUM%" /F /B:2 /S

# echo.
# echo.
# echo ================================
# echo Cache controll changes finished!
# echo ================================
# echo.
# echo.

# :no


echo
echo
echo ================================
echo Task finished!!!
echo ================================
echo
echo