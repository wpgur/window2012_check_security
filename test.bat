@echo off

ECHO [W33] IIS 미사용 스크립트 매핑 제거.

echo.                                                       
secedit /EXPORT /CFG log.txt > NUL
type log.txt | Find /I ".htr" 
if not errorlevel 1 GOTO weak
type log.txt | Find /I ".idc"
if not errorlevel 1 GOTO weak
type log.txt | Find /I ".stm"
if not errorlevel 1 GOTO weak
type log.txt | Find /I ".shtm"
if not errorlevel 1 GOTO weak
type log.txt | Find /I ".shtml"
if not errorlevel 1 GOTO weak
type log.txt | Find /I ".printer"
if not errorlevel 1 GOTO weak
type log.txt | Find /I ".htw"
if not errorlevel 1 GOTO weak
type log.txt | Find /I ".ida"
if not errorlevel 1 GOTO weak
type log.txt | Find /I ".idq"
if not errorlevel 1 GOTO weak
if errorlevel 1 GOTO good

:weak
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO [ W-33 : IIS 미사용 스크립트 매핑 제거 - 취약 ] >> bad.txt
ECHO 설명 : 취약한 매핑이 확인되었으므로 취약하다. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO Step 1 : "시작 > 실행 > INETMGR > 웹 사이트 > 해당 웹사이트 > 처리기 매핑 선택" >> bad.txt
ECHO Step 2 : 취약한 매핑 제거 >> bad.txt
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO. >> bad.txt
ECHO. >> bad.txt
ECHO ---------------------------------------------------------------------------------
ECHO [ W-33 : IIS 미사용 스크립트 매핑 제거 - 취약 ]
ECHO 설명 : 취약한 매핑이 확인되었으므로 취약하다.
ECHO [보안 조치]
ECHO Step 1 : "시작 > 실행 > INETMGR > 웹 사이트 > 해당 웹사이트 > 처리기 매핑 선택"
ECHO Step 2 : 취약한 매핑 제거
ECHO ---------------------------------------------------------------------------------
ECHO.
GOTO end

:good
ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO [  W-33 : IIS 미사용 스크립트 매핑 제거 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명: 취약한 매핑이 발견되지 않았으므로 양호하다 >> good.txt
ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO. >> good.txt
ECHO. >> good.txt
ECHO ---------------------------------------------------------------------------------
ECHO [  W-33 : IIS 미사용 스크립트 매핑 제거 - 양호 ]
ECHO.
ECHO 설명: 취약한 매핑이 발견되지 않았으므로 양호하다
ECHO ---------------------------------------------------------------------------------
ECHO.
ECHO.
:end

DEL log.txt