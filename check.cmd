REM Set working dir
Pushd %~dp1
REM Hash is for knowing is it new version
SET /P TMPHASH=<hash.txt
SET EXEFLNM=tempr
SET FLNM=tempr2

for /R %%Z in (*.exe) DO (
	set EXEFLNM=%%~nxZ
	set FLNM=%%~nZ
)
REM Do hash with built-in Windows util
CertUtil -hashfile %EXEFLNM% MD5 | findstr /C:"%TMPHASH%" /X
REM If sw version is new
if %ERRORLEVEL%==1 GOTO HASHGEN
REM If version is already installed
IF EXIST \\server\soft\deploy\logs\%computername%_%FLNM%.log goto END
:INST
REM Install with given parameters
CALL %1 %EXEFLNM%
REM Log that this sw ver is installed
echo %FLNM% installed %date% %time:~0,5%>\\server\soft\deploy\logs\%computername%_%FLNM%.log
:END
popd
goto :EOF
:HASHGEN
REM Generate new hash
CertUtil -hashfile %EXEFLNM% MD5 | find /i /v "md5" | find /i /v "certutil">hash.txt
REM Clear log
del \\server\soft\deploy\logs\%computername%_%FLNM%.log
goto INST