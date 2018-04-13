@ECHO OFF
REM install with options
%1 -install
REM after install additional tasks
copy /Y \\server\soft\deploy\flash\mms.cfg C:\windows\system32\macromed\flash