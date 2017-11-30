@echo off

REM ROM is not complete! catacomb.x is missing (replaced by .w temporary)

set    zip=catacomb.zip
set ifiles=catacomb.u+catacomb.v+catacomb.w+catacomb.w+catacomb.y+catacomb.y+catacomb.y+catacomb.y+cat-gfx1+cat-gfx1+cat-gfx2+cat-gfx2
set  ofile=a.ctcomb.rom

rem =====================================
setlocal ENABLEDELAYEDEXPANSION

set pwd=%~dp0
echo.
echo.

if EXIST %zip% (

	!pwd!7za x -otmp %zip%
	if !ERRORLEVEL! EQU 0 ( 
		cd tmp

		copy /b/y %ifiles% !pwd!%ofile%
		if !ERRORLEVEL! EQU 0 ( 
			echo.
			echo ** done **
			echo.
			echo Copy "%ofile%" into root of SD card
		)
		cd !pwd!
		rmdir /s /q tmp
	)

) else (

	echo Error: Cannot find "%zip%" file
	echo.
	echo Put "%zip%", "7za.exe" and "%~nx0" into the same directory
)

echo.
echo.
pause
