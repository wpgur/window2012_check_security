@echo off
setlocal enabledelayedexpansion

MODE CON COLS=100 LINES=30

cls
COLOR 0f
echo ****************************************************************************************************
echo.  
echo                WinDow Server 2012 Diagnosis Tool
echo.          
echo ****************************************************************************************************
echo.





REM -------------------------------------------1. W-01 : Administer 계정 이름 바꾸기
:ACCOUNT_W-01

ECHO [W1] Administrator 계정 이름 바꾸기

net user >> log.txt
type log.txt | find/i  "Administrator" >nul

if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-01 : Administrator 계정 이름 바꾸기 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: Administrator 계정이 존재하지 않아 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-01 : Administrator 계정 이름 바꾸기 - 양호 ] 
    ECHO. 
    ECHO 설명: Administrator 계정이 존재하지 않아 양호하다.
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO.
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO [ W-01 : Administrator 계정 이름 바꾸기 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : Administrator 계정이 존재하여 보안에 취약하다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO Step 1: "시작 > 실행 > secpol.msc > Local Policies > Security Options" >> bad.txt
    ECHO Step 2: "Administrator Default 계정 이름 변경" >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO "[ W-01 : Administrator 계정 이름 바꾸기 - 취약 ]" 
    ECHO. 
    ECHO "설명 : Administrator 계정이 존재하여 보안에 취약하다." 
    ECHO. 
    ECHO "[보안 조치]" 
    ECHO Step 1: "시작 > 실행 > secpol.msc > Local Policies > Security Options" 
    ECHO Step 2: "Administrator Default 계정 이름 변경"
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO. 
)

DEL log.txt
ECHO.

 
 

REM -------------------------------------------2. W-02 : Guest 계정 상태.
:ACCOUNT_W-02
ECHO [W2] Guest 계정 상태

net user guest >> log.txt
FOR /F "tokens=3-4" %%A IN ('net user guest ^| findstr /C:"활성 계정"') DO SET _result=%%A

IF "%_result%"=="예" (
    ECHO --------------------------------------------------------------------------------->> bad.txt
    ECHO [ W-02 : Guest 계정 상태 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : Guest 계정이 활성화 상태임으로 보안에 취약하다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO Step 1: "시작 > 실행 > secpol.msc > Local Security Policy > Local Policies > Security Options" >> bad.txt
    ECHO Step 2: "Guest 계정 상태 비활성화" >> bad.txt
    ECHO --------------------------------------------------------------------------------->> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt

    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-02 : Guest 계정 상태 - 취약 ] 
    ECHO. 
    ECHO 설명 : Guest 계정이 활성화 상태임으로 보안에 취약하다. 
    ECHO. 
    ECHO [보안 조치] 
    ECHO Step 1: "시작 > 실행 > secpol.msc > Local Security Policy > Local Policies > Security Options" 
    ECHO Step 2: "Guest 계정 상태 비활성화" 
    ECHO ---------------------------------------------------------------------------------
    ECHO. 
    ECHO. 
) ELSE (
   ECHO --------------------------------------------------------------------------------->> good.txt
   ECHO [ W-02 : Guest 계정 상태 - 양호 ] >> good.txt
   ECHO. >> good.txt
   ECHO 설명: Guest 계정이 비활성화됨으로 양호하다. >> good.txt
   ECHO --------------------------------------------------------------------------------->> good.txt
   ECHO. >> good.txt
   ECHO. >> good.txt

   ECHO ---------------------------------------------------------------------------------
   ECHO [ W-02 : Guest 계정 상태 - 양호 ] 
   ECHO. 
   ECHO 설명: Guest 계정이 비활성화됨으로 양호하다. 
   ECHO ---------------------------------------------------------------------------------
   ECHO. 
   ECHO. 
)
ECHO.
 
 

REM -------------------------------------------3. W-03 : 불필요한 계정 제거.
:ACCOUNT_W-03
ECHO [W3] 관리자 그룹에 최소한의 사용자 포함

net localgroup administrators | find /v "명령을 잘 실행했습니다." >nul

ECHO --------------------------------------------------------------------------------- >> check.txt
ECHO [ W-03 관리자 그룹에 최소한의 사용자 포함 - 확인 필요 ] >> check.txt
ECHO. >> check.txt
ECHO [사용자 계정 목록] >> check.txt
net localgroup administrators | find /v "명령을 잘 실행했습니다." >> check.txt
ECHO. >> check.txt
ECHO 설명 : Administrators 그룹에 불필요한 관리자 계정이 존재하면 제거해야 합니다. >> check.txt
ECHO. >> check.txt
ECHO [보안 조치] >> check.txt
ECHO. >> check.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ LUSRMGR.MSC ▶ 그룹 >> check.txt
ECHO [Step 2] 등록된 계정 중 불필요한 사용자 선택 ▶ 속성 ▶ "계정 사용 안 함"에 체크하거나 계정 삭제 >> check.txt
ECHO --------------------------------------------------------------------------------- >> check.txt
ECHO. >> check.txt
ECHO. >> check.txt


ECHO ---------------------------------------------------------------------------------
ECHO [ W-03 관리자 그룹에 최소한의 사용자 포함 - 확인 필요 ]
ECHO. 
ECHO [사용자 계정 목록] 
net localgroup administrators | find /v "명령을 잘 실행했습니다."
ECHO. 
ECHO 설명 : Administrators 그룹에 불필요한 관리자 계정이 존재하면 제거해야 합니다.
ECHO. 
ECHO [보안 조치] 
ECHO. 
ECHO [Step 1] 시작 ▶ 실행 ▶ LUSRMGR.MSC ▶ 그룹 
ECHO [Step 2] 등록된 계정 중 불필요한 사용자 선택 ▶ 속성 ▶ "계정 사용 안 함"에 체크하거나 계정 삭제 
ECHO --------------------------------------------------------------------------------- 
ECHO. 
ECHO. 

DEL log.txt
 
 


REM -------------------------------------------4. W-04 : 계정 잠금 임계값 설정. 확인
:ACCOUNT_W-04
ECHO [W4] 계정 잠금 임계값 설정

net accounts | findstr /I /C:"잠금 임계값" /C:"threshold" > W-4-xxx.txt
FOR /f "tokens=1-3" %%a IN (W-4-xxx.txt) DO SET Threshold=%%c


IF %Threshold% LEQ 5 (
   ECHO --------------------------------------------------------------------------------- >> good.txt
   ECHO. >> good.txt
   ECHO [ W-04 : 계정 잠금 임계값 설정 - 양호 ] >> good.txt
   ECHO. >> good.txt
   ECHO 설명 : 계정 잠금 임계값이 5 이하의 값으로 설정되어 있으므로 양호합니다. >> good.txt
   ECHO --------------------------------------------------------------------------------- >> good.txt
   ECHO. >> good.txt
   ECHO. >> good.txt
   
   ECHO --------------------------------------------------------------------------------- 
   ECHO. 
   ECHO [ W-04 : 계정 잠금 임계값 설정 - 양호 ] 
   ECHO. 
   ECHO 설명 : 계정 잠금 임계값이 5 이하의 값으로 설정되어 있으므로 양호합니다. 
   ECHO --------------------------------------------------------------------------------- 
   ECHO. 
   ECHO. 
)

IF NOT %Threshold% LEQ 5 (
   ECHO. >> bad.txt
   ECHO --------------------------------------------------------------------------------- >> bad.txt
   ECHO [ W-04 : 계정 잠금 임계값 설정 - 취약 ] >> bad.txt
   ECHO. >> bad.txt
   ECHO 설명 : 계정 잠금 임계값이 6 이상의 값으로 설정되어 있으므로 취약합니다. >> bad.txt
   ECHO. >> bad.txt
   ECHO [보안 조치] >> bad.txt
   ECHO. >> bad.txt
   ECHO Windows NT >> bad.txt
   ECHO [Step 1] 시작 ▶ 프로그램 ▶ 관리도구 ▶ 도메인 사용자 관리자 ▶ 정책 ▶ 계정 정책 >> bad.txt
   ECHO [Step 2] "계정 잠금" 선택 후 "잠금"에 "5" 이하의 값 설정 >> bad.txt
   ECHO. >> bad.txt
   ECHO Windows 2000, 2003, 2008, 2012 >> bad.txt
   ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 계정 정책 ▶ 계정 잠금 정책 >> bad.txt
   ECHO [Step 2] "계정 잠금 임계값"을 "5" 이하의 값으로 설정 >> bad.txt
   ECHO. >> bad.txt
   ECHO --------------------------------------------------------------------------------- >> bad.txt

   ECHO. 
   ECHO ---------------------------------------------------------------------------------
   ECHO [ W-04 : 계정 잠금 임계값 설정 - 취약 ] 
   ECHO. 
   ECHO 설명 : 계정 잠금 임계값이 6 이상의 값으로 설정되어 있으므로 취약합니다. 
   ECHO. 
   ECHO [보안 조치] 
   ECHO.
   ECHO Windows NT 
   ECHO [Step 1] 시작 ▶ 프로그램 ▶ 관리도구 ▶ 도메인 사용자 관리자 ▶ 정책 ▶ 계정 정책 
   ECHO [Step 2] "계정 잠금" 선택 후 "잠금"에 "5" 이하의 값 설정 
   ECHO. 
   ECHO Windows 2000, 2003, 2008, 2012 
   ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 계정 정책 ▶ 계정 잠금 정책 
   ECHO [Step 2] "계정 잠금 임계값"을 "5" 이하의 값으로 설정 
   ECHO. 
   ECHO --------------------------------------------------------------------------------- 
)
ECHO.
DEL W-4-xxx.txt
 
 


REM -------------------------------------------5. W-05 : 해독 가능한 암호화를 사용하여 암호 저장 해제. 확인필요 cleartextpasswd? 각각 0 도 나눠서 진행하는게 정확
:ACCOUNT_W-05 
ECHO [W5] 해독 가능한 암호화를 사용하여 암호 저장 해제


secedit /export /cfg LocalSecurityPolicy.txt>nul
TYPE LocalSecurityPolicy.txt | find /I "ClearTextPassword" | find "1" > NUL
ECHO %ERRORLEVEL%



IF ERRORLEVEL 1 (
   ECHO. >> good.txt
   ECHO --------------------------------------------------------------------------------->> good.txt
   ECHO [ W-05 : 해독 가능한 암호화를 사용하여 암호 저장 해제 - 양호 ] >> good.txt
   ECHO. >> good.txt
   ECHO 설명: "해독 가능한 암호화를 사용하여 암호 저장" 정책이 "사용 안 함" 으로 되어있어 양호하다. >> good.txt
   ECHO --------------------------------------------------------------------------------->> good.txt
   ECHO. >> good.txt
   ECHO. >> good.txt

   ECHO. 
   ECHO ---------------------------------------------------------------------------------
   ECHO [ W-05 : 해독 가능한 암호화를 사용하여 암호 저장 해제 - 양호 ] 
   ECHO. 
   ECHO 설명: "해독 가능한 암호화를 사용하여 암호 저장" 정책이 "사용 안 함" 으로 되어있어 양호하다. 
   ECHO ---------------------------------------------------------------------------------
   ECHO. 
   ECHO. 
   ) else (
   ECHO. >> bad.txt
   ECHO --------------------------------------------------------------------------------->> bad.txt
   ECHO [ W-05 : 해독 가능한 암호화를 사용하여 암호 저장 해제 - 취약 ] >> bad.txt
   ECHO. >> bad.txt
   ECHO 설명: "해독 가능한 암호화를 사용하여 암호 저장" 정책이 "사용" 으로 되어있어 취약하다. >> bad.txt
   ECHO. >> bad.txt
   ECHO [보안 조치] >> bad.txt
   ECHO Step 1: "시작> 실행> SECPOL.MSC> 계정 정책> 암호 정책> “해독 가능한 암호화를 사용하여 암호 저장” 설정 확인" >> bad.txt
   ECHO Step 2: "해독 가능한 암호화를 사용하여 암호 저장"을 "사용 안 함"으로 설정 >> bad.txt
   ECHO --------------------------------------------------------------------------------->> bad.txt
   ECHO. >> bad.txt
   ECHO. >> bad.txt

   ECHO. 
   ECHO ---------------------------------------------------------------------------------
   ECHO [ W-05 : 해독 가능한 암호화를 사용하여 암호 저장 해제 - 취약 ] 
   ECHO. 
   ECHO 설명: "해독 가능한 암호화를 사용하여 암호 저장" 정책이 "사용" 으로 되어있어 취약하다. 
   ECHO. 
   ECHO [보안 조치] 
   ECHO Step 1: "시작> 실행> SECPOL.MSC> 계정 정책> 암호 정책> “해독 가능한 암호화를 사용하여 암호 저장” 설정 확인" 
   ECHO Step 2: "해독 가능한 암호화를 사용하여 암호 저장"을 "사용 안 함"으로 설정 
   ECHO ---------------------------------------------------------------------------------
   ECHO. 
   ECHO. 
   )
DEL LocalSecurityPolicy.txt
 
 


REM -------------------------------------------6. W-06 : 관리자 그룹에 최소한의 사용자 포함¸
:ACCOUNT_W-06
ECHO [W6] 관리자 그룹에 최소한의 사용자 포함

set "userCount=0"
for /f "skip=6" %%A in ('net localgroup Administrators') do set /a "userCount+=1"
set /a userCount-=1
rem 사용자가 2개 이하면 양호 하다고 판단

if %userCount% gtr 2 (
   ECHO. >> bad.txt
   ECHO --------------------------------------------------------------------------------->> bad.txt
   ECHO [ W-06 : 관리자 그룹에 최소한의 사용자 포함 - 취약 ] >> bad.txt
   ECHO. >> bad.txt
   ECHO 설명:  Administrators 그룹에 불필요한 관리자 계정이 존재하는 경우 [사용자 2명 이하] >> bad.txt
   ECHO. >> bad.txt
   ECHO [보안 조치] >> bad.txt
   ECHO Step 1: 시작 ^> 실행 ^> LUSRMGR.MSC ^> 그룹 ^> Administrators ^〉속성 ^> Administrators 속성 확인 >> bad.txt
   ECHO Step 2: Administrator 그룹에서 불필요한 계정 제거 후 그룹 변경 >> bad.txt
   ECHO --------------------------------------------------------------------------------->> bad.txt
   ECHO. >> bad.txt
   ECHO. >> bad.txt

   ECHO. 
   ECHO ---------------------------------------------------------------------------------
   ECHO [ W-06 : 관리자 그룹에 최소한의 사용자 포함 - 취약 ] 
   ECHO. 
   ECHO 설명:  Administrators 그룹에 불필요한 관리자 계정이 존재하는 경우 [사용자 2명 이하]
   ECHO. 
   ECHO [보안 조치] 
   ECHO Step 1: 시작 ^> 실행 ^> LUSRMGR.MSC ^> 그룹 ^> Administrators ^〉속성 ^> Administrators 속성 확인
   ECHO Step 2: Administrator 그룹에서 불필요한 계정 제거 후 그룹 변경 
   ECHO ---------------------------------------------------------------------------------
   ECHO. 
   ECHO. 
) else (
   ECHO. >> good.txt
   ECHO --------------------------------------------------------------------------------->> good.txt
   ECHO [ W-06 : 관리자 그룹에 최소한의 사용자 포함 - 양호 ] >> good.txt
   ECHO. >> good.txt
   ECHO 설명:  Administrators 그룹의 구성원을 2명 이하로 유지하거나 불필요한 관리자 계정이 존재하지 않아 안전하다. >> good.txt
   ECHO. >> good.txt
   ECHO 관리자 그룹에 사용자 목록 >> good.txt
   net localgroup administrators | find /v "명령을 잘 실행했습니다" >> good.txt
   ECHO. >> good.txt
   ECHO --------------------------------------------------------------------------------->> good.txt
   ECHO. >> good.txt
   ECHO. >> good.txt

   ECHO. 
   ECHO ---------------------------------------------------------------------------------
   ECHO [ W-06 : 관리자 그룹에 최소한의 사용자 포함 - 양호 ]
   ECHO. 
   ECHO 설명:  Administrators 그룹의 구성원을 2명 이하로 유지하거나 불필요한 관리자 계정이 존재하지 않아 안전하다.
   ECHO. 
   ECHO 관리자 그룹에 사용자 목록 
   net localgroup administrators | find /v "명령을 잘 실행했습니다" 
   ECHO. 
   ECHO ---------------------------------------------------------------------------------
   ECHO. 
   ECHO. 
)
 
 

REM -------------------------------------------7. W-07 : Everyone 사용권한을 익명 사용자에 적용 해제.
:ACCOUNT_W-07
ECHO [W7] Everyone 사용권한을 익명 사용자에 적용 해제

secedit /EXPORT /CFG LocalSecurityPolicy.txt >NUL

TYPE LocalSecurityPolicy.txt | find /i "EveryoneIncludesAnonymous" | find "4,0" >NUL

IF ERRORLEVEL 1 (
ECHO ---------------------------------------------- >> bad.txt
ECHO. >> bad.txt
ECHO [ W-07 Everyone 사용 권한을 익명 사용자에게 적용 해제 - 취약 ] >> bad.txt
ECHO. >> bad.txt
ECHO 설명 : "Everyone 사용 권한을 익명 사용자에게 적용" 정책이 "사용" 으로 되어 있는 경우 >> bad.txt
ECHO. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO. >> bad.txt
ECHO ■ Windows 2003, 2008, 2012 >> bad.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 로컬 정책 ▶ 보안 옵션 >> bad.txt
ECHO [Step 2] "Everyone 사용 권한을 익명 사용자에게 적용" 정책을 "사용 안 함"으로 설정 >> bad.txt
ECHO. >> bad.txt
ECHO ---------------------------------------------- >> bad.txt

ECHO ----------------------------------------------
ECHO. 
ECHO [ W-07 Everyone 사용 권한을 익명 사용자에게 적용 해제 - 취약 ] 
ECHO. 
ECHO 설명 : "Everyone 사용 권한을 익명 사용자에게 적용" 정책이 "사용" 으로 되어 있는 경우 
ECHO. 
ECHO [보안 조치] 
ECHO. 
ECHO ■ Windows 2003, 2008, 2012 
ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 로컬 정책 ▶ 보안 옵션
ECHO [Step 2] "Everyone 사용 권한을 익명 사용자에게 적용" 정책을 "사용 안 함"으로 설정 
ECHO. 
ECHO ---------------------------------------------- 
)

IF NOT ERRORLEVEL 1 (
ECHO ---------------------------------------------- >> good.txt
ECHO. >> good.txt
ECHO [ W-07 Everyone 사용 권한을 익명 사용자에 적용 해제 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명 : "Everyone 사용 권한을 익명 사용자에게 적용" 정책이 "사용 안 함" 으로 되어 있어 양호합니다. >> good.txt
ECHO. >> good.txt
ECHO ---------------------------------------------- >> good.txt

ECHO ---------------------------------------------- 
ECHO. 
ECHO [ W-07 Everyone 사용 권한을 익명 사용자에 적용 해제 - 양호 ] 
ECHO. 
ECHO 설명 : "Everyone 사용 권한을 익명 사용자에게 적용" 정책이 "사용 안 함" 으로 되어 있어 양호합니다.
ECHO. 
ECHO ---------------------------------------------- 
)

DEL LocalSecurityPolicy.txt

 
 

REM -------------------------------------------8. W-08 : 계정 잠금 기간 설정. token 값이 4일경우 확인
:ACCOUNT_W-08
ECHO [W8] 계정 잠금 기간 설정

net accounts | findstr /I /C:"잠금 기간" /C:"duration" >> 1-08-LockTime.txt
FOR /f "tokens=1-4" %%a IN (1-08-LockTime.txt) DO SET LockTime=%%d

echo %LockTime%
 
net accounts | findstr /I /C:"잠금 관찰 창" /C:"observation" >> 1-08-LockReTime.txt
FOR /f "tokens=1-5" %%a IN (1-08-LockReTime.txt) DO SET LockReTime=%%e

echo %LockReTime%
 
IF %LockTime% GEQ 60 (
    IF %LockReTime% GEQ 60 (
        GOTO 1-08-Y
    )
)

GOTO 1-08-N


:1-08-Y
ECHO ---------------------------------------------- >> good.txt
ECHO. >> good.txt
ECHO [ W-08 계정 잠금 기간 설정 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명 : "계정 잠금 기간" 및 "계정 잠금 기간 원래대로 설정 기간"이 설정되어 있으므로 양호합니다.(60 분 이상) >> good.txt
ECHO. >> good.txt
ECHO ---------------------------------------------- >> good.txt
ECHO. >> good.txt

ECHO ----------------------------------------------
ECHO.
ECHO [ W-08 계정 잠금 기간 설정 - 양호 ]
ECHO.
ECHO 설명 : "계정 잠금 기간" 및 "계정 잠금 기간 원래대로 설정 기간"이 설정되어 있으므로 양호합니다.(60 분 이상)
ECHO.
ECHO ----------------------------------------------
ECHO.
GOTO 1-08-END

:1-08-N
ECHO ---------------------------------------------- >> bad.txt
ECHO. >> bad.txt
ECHO [ W-08 계정 잠금 기간 설정 - 취약 ] >> bad.txt
ECHO. >> bad.txt
ECHO 설명 : "계정 잠금 기간" 및 "잠금 기간 원래대로 설정 기간"이 설정되지 않았으므로 취약합니다. ( 60분 이상의 값으로 설정하기를 권고) >> bad.txt
ECHO. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO. >> bad.txt
ECHO ■ Windows NT >> bad.txt
ECHO [Step 1] 시작 ▶ 프로그램 ▶ 관리도구 ▶ 도메인 사용자 관리자 ▶ 정책 ▶ 계정 정책 >> bad.txt
ECHO [Step 2] "횟수 다시 설정"을 "60분 후"로 설정 "잠금 유지 기간"의 "시간 제한"을 "60 분"으로 설정 >> bad.txt
ECHO. >> bad.txt
ECHO ■ Windows 2000, 2003, 2008, 2012 >> bad.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 계정 정책 ▶ 계정 잠금 정책 >> bad.txt
ECHO [Step 2] "계정 잠금 기간" "다음 시간 후 계정 잠금 수를 월내대로 설정"에 대해 각각 "60 분" 설정 >> bad.txt
ECHO. >> bad.txt
ECHO ---------------------------------------------- >> bad.txt
ECHO. >> bad.txt

ECHO ----------------------------------------------
ECHO.
ECHO [ W-08 계정 잠금 기간 설정 - 취약 ]
ECHO.
ECHO 설명 : "계정 잠금 기간" 및 "잠금 기간 원래대로 설정 기간"이 설정되지 않았으므로 취약합니다. ( 60분 이상의 값으로 설정하기를 권고)
ECHO.
ECHO [보안 조치]
ECHO.
ECHO ■ Windows NT
ECHO [Step 1] 시작 ▶ 프로그램 ▶ 관리도구 ▶ 도메인 사용자 관리자 ▶ 정책 ▶ 계정 정책
ECHO [Step 2] "횟수 다시 설정"을 "60분 후"로 설정 "잠금 유지 기간"의 "시간 제한"을 "60 분"으로 설정
ECHO.
ECHO ■ Windows 2000, 2003, 2008, 2012 
ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 계정 정책 ▶ 계정 잠금 정책
ECHO [Step 2] "계정 잠금 기간" "다음 시간 후 계정 잠금 수를 월내대로 설정"에 대해 각각 "60 분" 설정
ECHO.
ECHO ----------------------------------------------
ECHO.
GOTO 1-08-END

:1-08-END
DEL 1-08-LockTime.txt
DEL 1-08-LockReTime.txt

 
 

REM -------------------------------------------9. W-09 : 패스워드 복잡성 설정.
:ACCOUNT_W-09
ECHO [W9] 패스워드 복잡성 설정.

secedit /EXPORT /CFG LocalSecurityPolicy.txt >NUL
TYPE LocalSecurityPolicy.txt | find /i "PasswordComplexity" | find "1" >NUL

IF ERRORLEVEL 1 ( 
ECHO ---------------------------------------------- >> bad.txt
ECHO. >> bad.txt
ECHO [ W-09 패스워드 복잡성 설정 - 취약 ] >> bad.txt
ECHO. >> bad.txt
ECHO 설명 : "암호는 복잡성을 만족해야 함" 정책이 "사용"으로 되어 있어 취약합니다. >> bad.txt
ECHO. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO. >> bad.txt
ECHO ■ Windows NT, 2000, 2003, 2008, 2012 >> bad.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 계정 정책 ▶ 암호 정책 >> bad.txt
ECHO [Step 2] "암호는 복잡성을 만족해야 함"을 "사용" 으로 설정 >> bad.txt
ECHO. >> bad.txt
ECHO ---------------------------------------------- >> bad.txt

ECHO ---------------------------------------------- 
ECHO. 
ECHO [ W-09 패스워드 복잡성 설정 - 취약 ] 
ECHO. 
ECHO 설명 : "암호는 복잡성을 만족해야 함" 정책이 "사용"으로 되어 있어 취약합니다. 
ECHO. 
ECHO [보안 조치] 
ECHO. 
ECHO ■ Windows NT, 2000, 2003, 2008, 2012 
ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 계정 정책 ▶ 암호 정책 
ECHO [Step 2] "암호는 복잡성을 만족해야 함”을 “사용” 으로 설정 
ECHO. 
ECHO ----------------------------------------------
)

IF NOT ERRORLEVEL 1 ( 
ECHO ---------------------------------------------- >> good.txt
ECHO. >> good.txt
ECHO [ W-09 패스워드 복잡성 설정 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명 : "암호는 복잡성을 만족해야 함" 정책이 "사용"으로 되어 있어 양호합니다. >> good.txt
ECHO. >> good.txt
ECHO ---------------------------------------------- >> good.txt
ECHO. >> good.txt

ECHO ----------------------------------------------  
ECHO.  
ECHO [ W-09 패스워드 복잡성 설정 - 양호 ]
ECHO. >> good.txt
ECHO 설명 : "암호는 복잡성을 만족해야 함" 정책이 "사용"으로 되어 있어 양호합니다.
ECHO.
ECHO ---------------------------------------------- 
ECHO. 
)

DEL LocalSecurityPolicy.txt

 
 

REM -------------------------------------------10. W-10 : 패스워드 최소 암호 길이. net accounts로 확인
:ACCOUNT_W-10
ECHO [W10] 패스워드 최소 암호 길이.

secedit /EXPORT /CFG LocalSecurityPolicy.txt >NUL
TYPE LocalSecurityPolicy.txt | find "MinimumPasswordLength =" > passwd.txt
FOR /f "tokens=1-3" %%a IN (passwd.txt) DO SET passwd_length=%%c >NUL

IF %passwd_length% GEQ 8 (
ECHO ---------------------------------------------- >> good.txt
ECHO. >> good.txt
ECHO [ W-10 패스워드 최소 암호 길이 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명 : "최소 암호 길이"가 "8문자" 이상으로 설정되어 있어 양호합니다. >> good.txt
ECHO. >> good.txt
ECHO ---------------------------------------------- >> good.txt
ECHO. >> good.txt

ECHO ----------------------------------------------
ECHO.
ECHO [ W-10 패스워드 최소 암호 길이 - 양호 ]
ECHO.
ECHO 설명 : "최소 암호 길이"가 "8문자" 이상으로 설정되어 있어 양호합니다.
ECHO.
ECHO ----------------------------------------------
ECHO.
)

IF NOT %passwd_length% GEQ 8 (
ECHO ---------------------------------------------- >> bad.txt
ECHO. >> bad.txt
ECHO [ W-10 패스워드 최소 암호 길이 - 취약 ] >> bad.txt
ECHO. >> bad.txt
ECHO 설명 : "최소 암호 길이"가 설정되지 않았거나 "8문자" 미만으로 설정되어 있어 취약합니다. >> bad.txt
ECHO. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO. >> bad.txt
ECHO ■ Windows NT, 2000, 2003, 2008, 2012 >> bad.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 계정 정책 ▶ 암호 정책 >> bad.txt
ECHO [Step 2] "최소 암호 길이"를 "8문자"로 설정 >> bad.txt
ECHO. >> bad.txt
ECHO ---------------------------------------------- >> bad.txt

ECHO ----------------------------------------------
ECHO.
ECHO [ W-10 패스워드 최소 암호 길이 - 취약 ]
ECHO.
ECHO 설명 : "최소 암호 길이"가 설정되지 않았거나 "8문자" 미만으로 설정되어 있어 취약합니다.
ECHO.
ECHO [보안 조치]
ECHO.
ECHO ■ Windows NT, 2000, 2003, 2008, 2012
ECHO [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 계정 정책 ▶ 암호 정책
ECHO [Step 2] "최소 암호 길이"를 "8문자"로 설정 
ECHO.
ECHO ----------------------------------------------
)




DEL LocalSecurityPolicy.txt
DEL passwd.txt

 
 

REM -------------------------------------------11. W-11 : 패스워드 최대 사용 기간. net accounts
:ACCOUNT_W-11
ECHO [W11] 패스워드 최대 사용 기간.

secedit /EXPORT /CFG LocalSecurityPolicy.txt >NUL
TYPE LocalSecurityPolicy.txt | find "MaximumPasswordAge =" > passwd.txt
FOR /f "tokens=1-3" %%a IN (passwd.txt) DO SET passwd_maxage=%%c >NUL

IF %passwd_maxage% LEQ 90 (
ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO. >> good.txt
ECHO [ W-11 패스워드 최대 사용 기간 - 양호 ] >> good.txt 
ECHO 설명 : "최대 암호 사용 기간"이 "90일" 이하로 설정되어있어 양호하다. >> good.txt 
ECHO. >> good.txt 
ECHO ---------------------------------------------------------------------------------- >> good.txt 
ECHO. >> good.txt

ECHO ---------------------------------------------------------------------------------
ECHO.
ECHO [ W-11 패스워드 최대 사용 기간 - 양호 ]  	
ECHO 설명 : "최대 암호 사용 기간"이 "90일" 이하로 설정되어있어 양호하다.
ECHO.  
ECHO ---------------------------------------------------------------------------------- 
ECHO. 
)

IF NOT %passwd_maxage% LEQ 90 (
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO [ W-11  패스워드 최대 사용 기간 - 취약  ] >> bad.txt
ECHO. >> bad.txt
ECHO 설명 : "최대 암호 사용 기간"이 설정되지 않았거나 90일을 초과하는 값으로 설정되어 취약하다. >> bad.txt
ECHO. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO. >> bad.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ secpol.msc ▶ 계정 정책 ▶ 암호 정책 >> bad.txt
ECHO [Step 2] 최대 암호 사용 기간 90일 설정 >> bad.txt
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO. 

ECHO --------------------------------------------------------------------------------- 
ECHO [ W-11  패스워드 최대 사용 기간 - 취약  ] 
ECHO. 
ECHO 설명 : "최대 암호 사용 기간"이 설정되지 않았거나 90일을 초과하는 값으로 설정되어 취약하다." 
ECHO. 
ECHO [보안 조치] 
ECHO.
ECHO [Step 1] 시작 ▶ 실행 ▶ secpol.msc ▶ 계정 정책 ▶ 암호 정책 
ECHO [Step 2] 최대 암호 사용 기간 90일 설정 
ECHO ---------------------------------------------------------------------------------
ECHO. 
)




DEL LocalSecurityPolicy.txt
DEL passwd.txt
 
 

REM -------------------------------------------12. W-12 : 패스워드 최소 사용 기간. 
:ACCOUNT_W-12
ECHO [W12] 패스워드 최소 사용 기간.

secedit /EXPORT /CFG LocalSecurityPolicy.txt >NUL
TYPE LocalSecurityPolicy.txt | find "MinimumPasswordAge =" > passwd.txt
FOR /f "tokens=1-3" %%a IN (passwd.txt) DO SET passwd_minage=%%c >NUL

IF %passwd_minage% GEQ 1 (
ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO. >> good.txt
ECHO [ W-12  패스워드 최소 사용 기간 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명 : "최소 암호 사용 기간이 0보다 큰 값으로 설정되어 있어 양호다." >> good.txt
ECHO. >> good.txt
ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO. >> good.txt

ECHO --------------------------------------------------------------------------------- 
ECHO. 
ECHO [ W-12  패스워드 최소 사용 기간 - 양호 ] 
ECHO. 
ECHO 설명 : "최소 암호 사용 기간이 0보다 큰 값으로 설정되어 있어 양호다." 
ECHO.
ECHO ---------------------------------------------------------------------------------
ECHO. 
)

IF NOT %passwd_minage% GEQ 1 (

ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO [ W-12 패스워드 최소 사용 기간 - 취약  ] >> bad.txt
ECHO. >> bad.txt
ECHO 설명 : "최소 암호 사용 기간이 0으로 설정되어 있어 취약하다." >> bad.txt
ECHO. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO. >> bad.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ secpol.msc ▶ 계정 정책 ▶ 암호 정책 >> bad.txt
ECHO [Step 2] 최소 암호 사용 기간 1일 설정 >> bad.txt
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO. >> bad.txt

ECHO --------------------------------------------------------------------------------- 
ECHO [ W-12 패스워드 최소 사용 기간 - 취약  ] 
ECHO.
ECHO 설명 : "최소 암호 사용 기간이 0으로 설정되어 있어 취약하다."
ECHO.
ECHO [보안 조치]
ECHO. 
ECHO [Step 1] 시작 ▶ 실행 ▶ secpol.msc ▶ 계정 정책 ▶ 암호 정책 
ECHO [Step 2] 최소 암호 사용 기간 1일 설정 
ECHO --------------------------------------------------------------------------------- 
ECHO.
)




DEL LocalSecurityPolicy.txt
DEL passwd.txt

 
 

REM -------------------------------------------13. W-13 : 마지막 사용자 이름 표시 안함.
:ACCOUNT_W-13
ECHO [W13] 마지막 사용자 이름 표시 안함.

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" | findstr /I "DontDisplayLastUserNam" | find "1" > NUL


IF NOT ERRORLEVEL 1 (
ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO [ W-13 마지막 사용자 이름 표시 안함 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명 : "마지막 사용자 이름 표시 안 함이 "사용"으로 설정되어 있어 양호하다." >> good.txt
ECHO ---------------------------------------------------------------------------------

ECHO ----------------------------------------------
ECHO.
ECHO [ W-13 마지막 사용자 이름 표시 안함 - 양호 ]
ECHO.
ECHO 설명 : "마지막 사용자 이름 표시 안 함이 "사용"으로 설정되어 있어 양호하다."
ECHO.
ECHO ----------------------------------------------
ECHO.
)
IF ERRORLEVEL 1 (
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO [ W-13 마지막 사용자 이름 표시 안함 - 취약  ] >> bad.txt
ECHO. >> bad.txt
ECHO 설명 : "마지막 사용자 이름 표시 안 함이 "사용 안 함"으로 설정되어 있어 취약하다." >> bad.txt
ECHO. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO. >> bad.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ secpol.msc ▶ 로컬 정책 ▶ 보안 옵션 >> bad.txt
ECHO [Step 2] 대화형 로그온 : 마지막 사용자 이름 표시 안 함 >> bad.txt
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO. >> bad.txt
ECHO. >> bad.txt

ECHO ----------------------------------------------
ECHO.
ECHO [ W-13 마지막 사용자 이름 표시 안함 - 취약  ]
ECHO.
ECHO 설명 : "마지막 사용자 이름 표시 안 함이 "사용 안 함"으로 설정되어 있어 취약하다."
ECHO.
ECHO [보안 조치]
ECHO.
ECHO ■ Windows NT, 2000, 2003, 2008, 2012
ECHO [Step 1] 시작 ▶ 실행 ▶ secpol.msc ▶ 로컬 정책 ▶ 보안 옵션
ECHO [Step 2] 대화형 로그온 : 마지막 사용자 이름 표시 안 함
ECHO.
ECHO ----------------------------------------------
)

 
 

REM -------------------------------------------14. W-14 : 로컬 로그온 허용.
:ACCOUNT_W-14
ECHO [W14] 로컬 로그온 허용.

setlocal enabledelayedexpansion

secedit /EXPORT /CFG log.txt >nul
for /f "delims=" %%A in ('TYPE log.txt ^| findstr /I "SeInteractiveLogonRight"') do set "string=%%A"

@REM 문자열을 = 문자 이후로 나누어 리스트로 만듭니다.
for /f "tokens=2 delims==" %%a in ("!string!") do set "list=%%a"

set "vulnerable=0"

@REM 3개 이상부터는 자동으로 필요없는 계정이 포함된것임으로 3개의 변수만
@REM 값이 없을 수도 있으니 공백도 조건으로 추가
@REM 맨 처음 %%a 값은 앞에 공백이 있음으로 공백 추가
for /f "tokens=1-5 delims=," %%a in ("!list!") do (
    if "%%a" neq " *S-1-5-32-544" if "%%a" neq " *S-1-5-32-568" if "%%a" neq "" set "vulnerable=1"
    if "%%b" neq "*S-1-5-32-544" if "%%b" neq "*S-1-5-32-568" if "%%b" neq "" set "vulnerable=1"
    if "%%c" neq "*S-1-5-32-544" if "%%c" neq "*S-1-5-32-568" if "%%c" neq "" set "vulnerable=1"
)

if !vulnerable!==1 (
    ECHO ---------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-14 로컬 로그온 허용 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : "로컬 로그온 허용 정책"에 Administrator와 IUSR 이외의 다른 그룹이 존재하므로 취약합니다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO [Step 1] 시작 ▶ 실행 ▶ secpol.msc ▶ 로컬 정책 ▶ 사용자 권한 할당 >> bad.txt
    ECHO [Step 2] Administrator와 IUSR 이외의 다른 그룹을 제거 >> bad.txt
    ECHO ---------------------------------------------- >> bad.txt
    ECHO. >> bad.txt

    ECHO ---------------------------------------------- 
    ECHO. 
    ECHO [ W-14 로컬 로그온 허용 - 취약 ] 
    ECHO. 
    ECHO 설명 : "로컬 로그온 허용 정책"에 Administrator와 IUSR 이외의 다른 그룹이 존재하므로 취약합니다. 
    ECHO. 
    ECHO [보안 조치] 
    ECHO. 
    ECHO [Step 1] 시작 ▶ 실행 ▶ secpol.msc ▶ 로컬 정책 ▶ 사용자 권한 할당 
    ECHO [Step 2] Administrator와 IUSR 이외의 다른 그룹을 제거 
    ECHO ---------------------------------------------- 
    ECHO. 
) else (
    ECHO ---------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO [ W-14 로컬 로그온 허용 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명 : "로컬 로그온 허용 정책"에 Administrator와 IUSR 이외의 다른 그룹이 없으므로 양호합니다. >> good.txt
    ECHO ---------------------------------------------- >> good.txt
    ECHO. >> good.txt

    ECHO ---------------------------------------------- 
    ECHO. 
    ECHO [ W-14 로컬 로그온 허용 - 양호 ] 
    ECHO. 
    ECHO 설명 : "로컬 로그온 허용 정책"에 Administrator와 IUSR 이외의 다른 그룹이 없으므로 양호합니다. 
    ECHO ---------------------------------------------- 
    ECHO. 
)
DEL log.txt

 
 

REM -------------------------------------------15. W-15 : 익명 SID/이름 변환 허용 해제.
:ACCOUNT_W-15
ECHO [W15] 익명 SID/이름 변환 허용 해제.

secedit /EXPORT /CFG LocalSecurityPolicy.txt >NUL
TYPE LocalSecurityPolicy.txt | find /i "LSAAnonymousNameLookup" | find "0" > NUL

if not errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-15 : 익명 SID이름 변환 허용 해제 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: "익명 SID/이름 변환 허용" 정책이 "사용 안 함" 으로 되어 있으므로 양호하다 >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-15 : 익명 SID이름 변환 허용 해제 - 양호 ] 
    ECHO. 
    ECHO 설명: "익명 SID/이름 변환 허용" 정책이 "사용 안 함" 으로 되어 있으므로 양호하다 
    ECHO --------------------------------------------------------------------------------- 
    ECHO.
    ECHO. 
) 

if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-15 : 익명 SID이름 변환 허용 해제 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : "익명 SID/이름 변환 허용" 정책이 "사용함" 으로 되어 있으므로 양호하다 >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO Step 1: "시작 > 실행 > secpol.msc > 로컬 정책 > 보안 옵션" >> bad.txt
    ECHO Step 2: "네트워크 액세스: 익명 SID/이름 변환 허용" 정책을 "사용 안함"으로 설정 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO.
    ECHO [ W-15 : 익명 SID이름 변환 허용 해제 - 취약 ] 
    ECHO.
    ECHO 설명 : "익명 SID/이름 변환 허용" 정책이 "사용함" 으로 되어 있으므로 양호하다 
    ECHO.
    ECHO [보안 조치] 
    ECHO.
    ECHO Step 1: "시작 > 실행 > secpol.msc > 로컬 정책 > 보안 옵션" 
    ECHO Step 2: "네트워크 액세스: 익명 SID/이름 변환 허용" 정책을 "사용 안함"으로 설정 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO. 
)
DEL LocalSecurityPolicy.txt
ECHO.

 
 

REM -------------------------------------------16. W-16 : 최근 암호 기억.
:ACCOUNT_W-16
ECHO [W16] 최근 암호 기억.

net accounts | findstr /I /C:"암호 기록 개수" /C:"history maintained" >> passwd.txt
FOR /f "tokens=1-4" %%a IN (passwd.txt) DO SET passwd_hsize=%%d


if %passwd_hsize% GEQ 4 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-16 : 최근 암호 기억 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: "최근 암호 기억"이 4개 이상으로 설정되어 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-16 : 최근 암호 기억 - 양호 ]
    ECHO.
    ECHO 설명:  "최근 암호 기억"이 4개 이상으로 설정되어 양호하다.
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-16 : 최근 암호 기억 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : "최근 암호 기억"이 4개 이하로 설정되어 취약하다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO Step 1: "시작 > 실행 > secpol.msc > 암호정책" >> bad.txt
    ECHO Step 2: "최근 암호 기억"을 "4개 암호 기억됨"으로 설정 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt


    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO [ W-16 : 최근 암호 기억 - 취약 ] 
    ECHO.
    ECHO 설명 : "최근 암호 기억"이 4개 이하로 설정되어 취약하다.
    ECHO.
    ECHO [보안 조치]
    ECHO.
    ECHO Step 1: "시작 > 실행 > secpol.msc > 암호정책"
    ECHO Step 2: "최근 암호 기억"을 "4개 암호 기억됨"으로 설정
    ECHO ---------------------------------------------------------------------------------
    ECHO. 
    ECHO. 
    
)

DEL passwd.txt
ECHO.

 
 

REM -------------------------------------------17. W-17 : 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한.
:ACCOUNT_W-17
ECHO [W17] 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한.

secedit /EXPORT /CFG LocalSecurityPolicy.txt > NUL
TYPE LocalSecurityPolicy.txt | find /i "LimitBlankPasswordUse=" | find "4,1" > NUL

if not errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-17 : 콘솔 로그온 시 로컬 계정에서 빈 암호 사용제한 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: "콘솔 로그온 시 로컬 계정에서 빈 암호 사용제한" 정책이 "사용"이므로 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-17 : 콘솔 로그온 시 로컬 계정에서 빈 암호 사용제한 - 양호 ]
    ECHO.
    ECHO 설명: "콘솔 로그온 시 로컬 계정에서 빈 암호 사용제한" 정책이 "사용"이므로 양호하다. 
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO [ W-17 : 콘솔 로그온 시 로컬 계정에서 빈 암호 사용제한 - 취약 ] >> bad.txt
    ECHO 설명 : "콘솔 로그온 시 로컬 계정에서 빈 암호 사용제한" 정책이 "사용 안 함"이므로 취약하다. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO Step 1: "시작 > 실행 > secpol.msc > 로컬 정책 > 보안 옵션" >> bad.txt
    ECHO Step 2: "계정: 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한" 정책을 "사용"으로 설정 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-17 : 콘솔 로그온 시 로컬 계정에서 빈 암호 사용제한 - 취약 ] 
    ECHO 설명 : "콘솔 로그온 시 로컬 계정에서 빈 암호 사용제한" 정책이 "사용 안 함"이므로 취약하다. 
    ECHO [보안 조치]
    ECHO Step 1: "시작 > 실행 > secpol.msc > 로컬 정책 > 보안 옵션"
    ECHO Step 2: "계정: 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한" 정책을 "사용"으로 설정
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)
DEL LocalSecurityPolicy.txt
ECHO.

 
 


REM -------------------------------------------1. W-18. 원격터미널 접속 가능한 사용자 그룹 제한
:ACCOUNT_W-18
ECHO [W18] 원격터미널 접속 가능한 사용자 그룹 제한.

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" | find /i "fDenyTSConnections" | find "1" > NUL

if not errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-18 : 원격터미널 접속 가능한 사용자 그룹 제한 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: 컴퓨터에 대한 원격 연결을 허용하지 않아 안전하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-18 : 원격터미널 접속 가능한 사용자 그룹 제한 - 양호 ]
    ECHO.
    ECHO 설명: 컴퓨터에 대한 원격 연결을 허용하지 않아 안전하다.
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO [ W-18 : 원격터미널 접속 가능한 사용자 그룹 제한 - 확인 필요 ] >> check.txt
    ECHO 설명 : " 컴퓨터에 대한 원격 연결을 허용하고 있어 불필요한 계정이 있는지 수동 진단을 권장합니다." >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO Step 1: 제어판 ^> 사용자 계정 ^> 관리자 계정 이외의 계정 생성 >> bad.txt
    ECHO Step 2: 제어판 ^> 시스템 ^> '원격' 탭 ^> '원격' 탭 메뉴에서 "사용자가 이 컴퓨터에 원격으로 연결할 수 있음"에 체크 > "원격 사용자 선택"에서 원격 사용자 지정후 확인 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-18 : 원격터미널 접속 가능한 사용자 그룹 제한 - 확인 필요 ] 
    ECHO 설명 : "컴퓨터에 대한 원격 연결을 허용하고 있어 불필요한 계정이 있는지 수동 진단을 권장합니다."
    ECHO [보안 조치]
    ECHO Step 1: 제어판 ^> 사용자 계정 ^> 관리자 계정 이외의 계정 생성
    ECHO Step 2: 제어판 ^> 시스템 ^> '원격' 탭 ^> '원격' 탭 메뉴에서 "사용자가 이 컴퓨터에 원격으로 연결할 수 있음"에 체크 ^> "원격 사용자 선택"에서 원격 사용자 지정후 확인 
    ECHO ---------------------------------------------------------------------------------
    ECHO. 
    ECHO. 
    
)

ECHO.

 
 





echo ****************************************************************************************************
echo           계정 관리 보안 점검 리스트가 종료 되었습니다.
echo ****************************************************************************************************