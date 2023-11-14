@echo off
setlocal enabledelayedexpansion

MODE CON COLS=100 LINES=30

:HOME
cls
COLOR 0f
echo ****************************************************************************************************
echo                WinDow Server 2012 Diagnosis Tool
echo.
echo -------------------------------------------------HOME-----------------------------------------------
echo.
echo           1. 계정 관리 점검
echo           2. 서비스 관리 점검
echo           3. 로그 관리 점검
echo           4. 보안 관리 점검
echo           5. EXIT
echo.
echo.          
echo ****************************************************************************************************
echo.

set /p menu_choice=Enter your choice:

if "%menu_choice%"=="1" goto ACCOUNT
if "%menu_choice%"=="2" goto SERVICE
if "%menu_choice%"=="3" goto LOG
if "%menu_choice%"=="4" goto SECURITY
if "%menu_choice%"=="5" EXIT


:ACCOUNT
cls
echo ****************************************************************************************************
echo.
echo -------------------------------------------------ACCOUNT--------------------------------------------
echo           계정 관리 보안 점검 리스트 
echo.
echo           1. W-01 : Administer 계정 이름 바꾸기.
echo           2. W-02 : Guest 계정 상태.
echo           3. W-03 : 불필요한 계정 제거.
echo           4. W-04 : 계정 잠금 임계값 설정.
echo           5. W-05 : 해독 가능한 암호화를 사용하여 암호 저장 해제.
echo           6. W-06 : 관리자 그룹에 최소한의 사용자 포함¸
echo           7. W-07 : Everyone 사용권한을 익명 사용자에 적용 해제.
echo           8. W-08 : 계정 잠금 기간 설정.
echo           9. W-09 : 패스워드 복잡성 설정.
echo           10. W-10 : 패스워드 최소 암호 길이.
echo           11. W-11 : 패스워드 최대 사용 기간.
echo           12. W-12 : 패스워드 최소 사용 기간.
echo           13. W-13 : 마지막 사용자 이름 표시 안함.
echo           14. W-14 : 로컬 로그온 허용.
echo           15. W-15 : 익명 SID/이름 변환 허용 해제.
echo           16. W-16 : 최근 암호 기억.
echo           17. W-17 : 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한.
echo           18. W-18 : 원격터미널 접속 가능한 사용자 그룹 제한.
echo.
echo           19. HOME
echo.
echo           all. "all" 입력시 전부 점검
echo ****************************************************************************************************
echo.


set /p menu_choice=Enter your choice:

if "%menu_choice%"=="1" goto ACCOUNT_W-01
if "%menu_choice%"=="2" goto ACCOUNT_W-02
if "%menu_choice%"=="3" goto ACCOUNT_W-03
if "%menu_choice%"=="4" goto ACCOUNT_W-04
if "%menu_choice%"=="5" goto ACCOUNT_W-05
if "%menu_choice%"=="6" goto ACCOUNT_W-06
if "%menu_choice%"=="7" goto ACCOUNT_W-07
if "%menu_choice%"=="8" goto ACCOUNT_W-08
if "%menu_choice%"=="9" goto ACCOUNT_W-09
if "%menu_choice%"=="10" goto ACCOUNT_W-10
if "%menu_choice%"=="11" goto ACCOUNT_W-11
if "%menu_choice%"=="12" goto ACCOUNT_W-12
if "%menu_choice%"=="13" goto ACCOUNT_W-13
if "%menu_choice%"=="14" goto ACCOUNT_W-14
if "%menu_choice%"=="15" goto ACCOUNT_W-15
if "%menu_choice%"=="16" goto ACCOUNT_W-16
if "%menu_choice%"=="17" goto ACCOUNT_W-17
if "%menu_choice%"=="18" goto ACCOUNT_W-18
if "%menu_choice%"=="19" goto HOME

if "%menu_choice%"=="all" goto ACCOUNT_ALL

:ACCOUNT_ALL
.\진단해버려_계정관리_all.bat
pause
goto ACCOUNT





:SERVICE
cls
echo ****************************************************************************************************
echo.
echo -------------------------------------------------SERVICE--------------------------------------------
echo           서비스 관리 보안 점검 리스트 
echo.
echo           1. W-19. 공유 권한 및 사용자 그룹 설정.
echo           2. W-20. 하드디스크 기본 공유 제거.
echo           3. W-21. 불필요한 서비스 제거.
echo           4. W-22. IIS 서비스 구동 점검.
echo           5. W-23. IIS 디렉터리 리스팅 제거.
echo           6. W-24. IIS CGI 실행 제한¸
echo           7. W-25. IIS 상위 디렉터리 접근 금지.
echo           8. W-26. IIS 불필요한 파일 제거.
echo           9. W-27. IIS 웹 프로세스 권한 제한.
echo           10. W-28. IIS 링크 사용금지.
echo           11. W-29. IIS 파일 업로드 및 다운로드 제한.
echo           12. W-30. IIS DB 연결 취약점 점검.
echo           13. W-31. IIS 가상 디렉터리 삭제.
echo           14. W-32. IIS 데이터 파일 ACL 적용.
echo           15. W-33. IIS 미사용 스크립트 매핑 제거.
echo           16. W-34. IIS Exec 명령어 쉘 호출 진단.
echo           17. W-35. IIS WebDAV 비활성화.
echo           18. W-36. NetBIOS 바인딩 서비스 구동 점검.
echo           19. W-37. FTP 서비스 구동 점검.
echo           20. W-38. FTP 디렉터리 접근권한 설정.
echo           21. W-39. Anonymous FTP 금지.
echo           22. W-40. FTP 접근 제어 설정.
echo           23. W-41. DNS Zone Transfer 설정.
echo           24. W-42. RDS(Remote Data Services) 제거.
echo           25. W-43. 최신 서비스팩 적용.
echo.
echo           26. HOME
echo.
echo ****************************************************************************************************
echo.


set /p menu_choice=Enter your choice:

if "%menu_choice%"=="1" goto ACCOUNT_W-19
if "%menu_choice%"=="2" goto ACCOUNT_W-20
if "%menu_choice%"=="3" goto ACCOUNT_W-21
if "%menu_choice%"=="4" goto ACCOUNT_W-22
if "%menu_choice%"=="5" goto ACCOUNT_W-23
if "%menu_choice%"=="6" goto ACCOUNT_W-24
if "%menu_choice%"=="7" goto ACCOUNT_W-25
if "%menu_choice%"=="8" goto ACCOUNT_W-26
if "%menu_choice%"=="9" goto ACCOUNT_W-27
if "%menu_choice%"=="10" goto ACCOUNT_W-28
if "%menu_choice%"=="11" goto ACCOUNT_W-29
if "%menu_choice%"=="12" goto ACCOUNT_W-30
if "%menu_choice%"=="13" goto ACCOUNT_W-31
if "%menu_choice%"=="14" goto ACCOUNT_W-32
if "%menu_choice%"=="15" goto ACCOUNT_W-33
if "%menu_choice%"=="16" goto ACCOUNT_W-34
if "%menu_choice%"=="17" goto ACCOUNT_W-35
if "%menu_choice%"=="18" goto ACCOUNT_W-36
if "%menu_choice%"=="19" goto ACCOUNT_W-37
if "%menu_choice%"=="20" goto ACCOUNT_W-38
if "%menu_choice%"=="21" goto ACCOUNT_W-39
if "%menu_choice%"=="22" goto ACCOUNT_W-40
if "%menu_choice%"=="23" goto ACCOUNT_W-41
if "%menu_choice%"=="24" goto ACCOUNT_W-42
if "%menu_choice%"=="25" goto ACCOUNT_W-43

if "%menu_choice%"=="26" goto HOME


:LOG
cls
echo ****************************************************************************************************
echo.
echo ---------------------------------------------------LOG----------------------------------------------
echo           로그 관리 보안 점검 리스트 
echo.
echo           1. W-44. 로그의 정기적 검토 및 보고.
echo           2. W-45. 원격으로 액세스할 수 있는 레지스트리 경로.
echo.
echo           3. HOME
echo.
echo ****************************************************************************************************
echo.


set /p menu_choice=Enter your choice:

if "%menu_choice%"=="1" goto ACCOUNT_W-44
if "%menu_choice%"=="2" goto ACCOUNT_W-45

if "%menu_choice%"=="3" goto HOME



:SECURITY
cls
echo ****************************************************************************************************
echo.
echo ------------------------------------------------SECURITY--------------------------------------------
echo           보안 관리 보안 점검 리스트 
echo.
echo           1. W-46. 백신 프로그램 설치.
echo           2. W-47. SAM 파일 접근 통제 설정.
echo           3. W-48. 화면보호기 설정.
echo           4. W-49. 로그온 하지 않고 시스템 종료 허용 해제.
echo           5. W-50. 원격 시스템에서 강제로 시스템 종료¸
echo.
echo           6. HOME
echo.
echo ****************************************************************************************************
echo.


set /p menu_choice=Enter your choice:

if "%menu_choice%"=="1" goto ACCOUNT_W-46
if "%menu_choice%"=="2" goto ACCOUNT_W-47
if "%menu_choice%"=="3" goto ACCOUNT_W-48
if "%menu_choice%"=="4" goto ACCOUNT_W-49
if "%menu_choice%"=="5" goto ACCOUNT_W-50

if "%menu_choice%"=="6" goto HOME



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

pause
goto ACCOUNT

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
pause
goto ACCOUNT

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
pause
goto ACCOUNT


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
pause
goto ACCOUNT


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
pause
goto ACCOUNT


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
pause
goto ACCOUNT

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

pause
goto ACCOUNT

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

pause
goto ACCOUNT

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

pause
goto ACCOUNT

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

pause
goto ACCOUNT

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
pause
goto ACCOUNT

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

pause
goto ACCOUNT

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

pause
goto ACCOUNT

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

pause
goto ACCOUNT

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

pause
goto ACCOUNT

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

pause
goto ACCOUNT

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

pause
goto ACCOUNT


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

pause
goto ACCOUNT



REM -------------------------------------------1. W-19. 공유 권한 및 사용자 그룹 설정.
:ACCOUNT_W-19
ECHO [W19] 공유 권한 및 사용자 그룹 설정.

ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO [ W-19  공유 권한 및 사용자 그룹 설정 - 확인 필요 ] >> check.txt
ECHO. >> check.txt
ECHO 설명 : "공유 디렉토리 내 Everyone 권한 존재 여부 점검" >> check.txt
ECHO. >> check.txt
ECHO [보안 조치] >> check.txt
ECHO. >> check.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ FSMGMT.MSC ▶ Shared Folders^(Local^) ▶ Shares >> check.txt
ECHO [Step 2] 공유 디렉토리 접근 권한에서 Everyone 권한 제거 후 필요한 계정 추가 >> check.txt
ECHO --------------------------------------------------------------------------------- >> check.txt
ECHO. >> check.txt

ECHO ---------------------------------------------------------------------------------
ECHO. 
ECHO [ W-19  공유 권한 및 사용자 그룹 설정 - 확인 필요 ] 
ECHO. 
ECHO 설명 : "공유 디렉토리 내 Everyone 권한 존재 여부 점검"
ECHO.
ECHO [보안 조치] 
ECHO.
ECHO [Step 1] 시작 ▶ 실행 ▶ FSMGMT.MSC  ▶ Shared Folders^(Local^) ▶ Shares  
ECHO [Step 2] 공유 디렉토리 접근 권한에서 Everyone 권한 제거 후 필요한 계정 추가
ECHO --------------------------------------------------------------------------------- 
ECHO.

pause
goto SERVICE


REM -------------------------------------------2. W-20. 하드디스크 기본 공유 제거.
:ACCOUNT_W-20
ECHO [W20] 하드디스크 기본 공유 제거.

reg query HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters >> log.txt
TYPE log.txt  | findstr /I "AutoShareServer" > tmp.txt
TYPE tmp.txt| find "0x0" > nul

IF %ERRORLEVEL% EQU 1 (
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO. >> bad.txt
ECHO [ W-20 하드디스크 기본 공유 제거 - 취약 ] >> bad.txt
ECHO. >> bad.txt
ECHO 설명 : "레지스트리의 AutoShareServer (WinNT: AutoShareWks)가 1이거나 기본 공유가 존재해 취약하다." >> bad.txt
ECHO. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO. >> bad.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ FSMGMT.MSC ▶ 계정 정책 ▶ "Shared Folders(Local)" >> bad.txt
ECHO [Step 1] 시작 ▶ 실행 ▶ regedit ▶ HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer "(값 0)" >> bad.txt
ECHO [Step 3] 기본 공유 중지 >> bad.txt
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO. >> bad.txt

ECHO --------------------------------------------------------------------------------- 
ECHO. 
ECHO [ W-20 하드디스크 기본 공유 제거 - 취약 ] 
ECHO. 
ECHO 설명 : "레지스트리의 AutoShareServer (WinNT: AutoShareWks)가 1이거나 기본 공유가 존재해 취약하다." 
ECHO.
ECHO [보안 조치]
ECHO. 
ECHO [Step 1] 시작 ▶ 실행 ▶ FSMGMT.MSC ▶ 계정 정책 ▶ Shared Folders"(Local)" 
ECHO [Step 1] 시작 ▶ 실행 ▶ regedit ▶ HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer -> 값 0
ECHO [Step 3] 기본 공유 중지
ECHO --------------------------------------------------------------------------------- 
ECHO. 
)
IF %ERRORLEVEL% EQU 0 (
ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO [ W-20 하드디스크 기본 공유 제거 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명 : "레지스트리의 AutoShareServer (WinNT: AutoShareWks)가 0이며 기본 공유가 존재하지 않아 양호하다." >> good.txt
ECHO. >> good.txt
ECHO --------------------------------------------------------------------------------- 
ECHO. >> good.txt

ECHO --------------------------------------------------------------------------------- 
ECHO [ W-20 하드디스크 기본 공유 제거 - 양호 ] 
ECHO. 
ECHO 설명 : "레지스트리의 AutoShareServer (WinNT: AutoShareWks)가 0이며 기본 공유가 존재하지 않아 양호하다." 
ECHO. 
ECHO --------------------------------------------------------------------------------- 
ECHO.
)

del log.txt
del tmp.txt

pause
goto SERVICE

REM -------------------------------------------3. W-21. 불필요한 서비스 제거.
:ACCOUNT_W-21
ECHO [W21] 불필요한 서비스 제거

setlocal enabledelayedexpansion
set "services="Alerter" "Automatic Updates" "Clipbook" "Computer Browser" "Cryptographic Service" "DHCP Client" "Distributed Link Tracking Client" "Distributed Link Tracking Server" "DNS Client" "Error Reporting Service" "Human Interface Device Access" "IMAPI CD-Burning COM Service" "Messenger" "NetMeeting Remote Desktop Sharing" "Portable Media Serial Number" "Print Spooler" "Remote Registry" "Simple TCP/IP Services" "Wireless Zero Configuration""
set "vulnerable=0"

for %%S in (%services%) do (
    net start | findstr /C:%%S >nul
    if !errorlevel!==0 (
        echo %%S 서비스가 실행 중이기 때문에 취약합니다.
        set "vulnerable=1"
    )
)

if %vulnerable%==0 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO [ W-21 불필요한 서비스 제거 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명 : "일반적으로 불필요한 서비스가 구동 중이지 않기 때문에 양호하다."  >> good.txt
    ECHO. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt 
    ECHO. >> good.txt
    ECHO --------------------------------------------------------------------------------- 
    ECHO.
    ECHO [ W-21 불필요한 서비스 제거 - 양호 ]
    ECHO. 
    ECHO 설명 : "일반적으로 불필요한 서비스가 구동 중이지 않기 때문에 양호하다."
    ECHO. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO.
) ELSE (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-21 불필요한 서비스 제거 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : "일반적으로 불필요한 서비스가 구동 중이기 때문에 취약하다." >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO [Step 1] 시작 ▶ 실행 ▶ SERVICES.MSC ▶ Services >> bad.txt
    ECHO [Step 2] 시작 유형 ▶ 사용 안 함 >> bad.txt
    ECHO [Step 3] 서비스 상태 ▶ 중지 설정 >> bad.txt
    ECHO [Step 4] 서비스 중지 후 "사용 안 함" 설정 >> bad.txt
    ECHO. >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO [ W-21 불필요한 서비스 제거 - 취약 ]
    ECHO.
    ECHO 설명 : "일반적으로 불필요한 서비스가 구동 중이기 때문에 취약하다." 
    ECHO.
    ECHO [보안 조치]
    ECHO. 
    ECHO [Step 1] 시작 ▶ 실행 ▶ SERVICES.MSC ▶ Services
    ECHO [Step 2] 시작 유형 ▶ 사용 안 함 
    ECHO [Step 3] 서비스 상태 ▶ 중지 설정 
    ECHO [Step 4] 서비스 중지 후 "사용 안 함" 설정
    ECHO. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO.	
)

pause
goto SERVICE

REM -------------------------------------------4. W-22. IIS 서비스 구동 점검.    
:ACCOUNT_W-22
ECHO [W22] IIS 서비스 구동 점검.

sc query "W3SVC" | find "RUNNING" >nul

if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO [ W-22 IIS 서비스 구동 점검 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명 : "IIS 서비스가 필요하지 않아 이용하지 않고 있어 양호하다."  >> good.txt
    ECHO.  >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt 
    ECHO. >> good.txt
    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-22 IIS 서비스 구동 점검 - 양호 ]
    ECHO. 
    ECHO 설명 : "IIS 서비스가 필요하지 않아 이용하지 않고 있어 양호하다."
    ECHO. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO.
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt 
    ECHO [ W-22 IIS 서비스 구동 점검 - 취약 ] >> bad.txt
    ECHO. >> bad.txt 
    ECHO 설명 : "IIS 서비스가 필요하지 않지만 사용하여 취약하다."  >> bad.txt
    ECHO. >> bad.txt 
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO [Step 1] 서버 관리자 ▶ 역할 및 기능 추가 마법사 ▶ 서버 역할 ▶ 웹 서버 확인 >> bad.txt
    ECHO [Step 2] IIS 서비스를 사용하지 않는 경우 IIS 서비스 중지 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W-22 IIS 서비스 구동 점검 - 취약 ] 
    ECHO. 
    ECHO 설명 : "IIS 서비스가 필요하지 않지만 사용하여 취약하다." 
    ECHO. 
    ECHO [보안 조치]
    ECHO.
    ECHO [Step 1] 서버 관리자 ▶ 역할 및 기능 추가 마법사 ▶ 서버 역할 ▶ 웹 서버 확인 
    ECHO [Step 2] IIS 서비스를 사용하지 않는 경우 IIS 서비스 중지 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
)

pause
goto SERVICE

REM -------------------------------------------5. W-23. IIS 디렉터리 리스팅 제거.
:ACCOUNT_W-23
ECHO [W23] IIS 디렉터리 리스팅 제거.

%SystemRoot%\System32\inetsrv\appcmd list config "Web" /section:directoryBrowse | findstr /I "True"

if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO [ W-23 IIS 디렉터리 리스팅 제거 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명 : "디렉토리 검색을 활성화하지 않아 양호하다."  >> good.txt
    ECHO.  >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt 
    ECHO. >> good.txt
    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-23 IIS 디렉터리 리스팅 제거 - 양호 ]
    ECHO. 
    ECHO 설명 : "디렉토리 검색을 활성화하지 않아 양호하다."
    ECHO. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO.
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt 
    ECHO [ W-23 IIS 디렉터리 리스팅 제거 - 취약 ] >> bad.txt
    ECHO. >> bad.txt 
    ECHO 설명 : "디렉토리 검색을 활성화하여 취약하다." >> bad.txt
    ECHO. >> bad.txt 
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO [Step 1] 실행 ▶ INETMGR ▶ 해당 웹사이트 ▶ IIS ▶ 디렉터리 검색 ▶ 사용 안 함>> bad.txt
    ECHO [Step 2] 사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 디렉터리 검색 체크 해제 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W-23 IIS 디렉터리 리스팅 제거 - 취약 ] 
    ECHO. 
    ECHO 설명 : "디렉토리 검색을 활성화하여 취약하다."
    ECHO. 
    ECHO [보안 조치]
    ECHO.
    ECHO [Step 1] 실행 ▶ INETMGR ▶ 해당 웹사이트 ▶ IIS ▶ 디렉터리 검색 ▶ 사용 안 함
    ECHO [Step 2] 사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 디렉터리 검색 체크 해제
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
)

pause
goto SERVICE

REM -------------------------------------------6. W-24. IIS CGI 실행 제한¸
:ACCOUNT_W-24
ECHO [W24] IIS CGI 실행 제한¸

setlocal enabledelayedexpansion

set "folderPath=C:\inetpub\scripts"  REM 확인하려는 폴더 경로를 설정합니다.

:: 폴더가 존재하는지 확인합니다.
if exist "!folderPath!" (
    :: icacls 명령어를 사용하여 폴더의 권한을 가져옵니다.
    set "foundEveryone=0"
    for /f "tokens=*" %%A in ('icacls "!folderPath!"') do (
        set "line=%%A"
        
        :: 권한 설정에 Everyone 그룹이 있는지 확인합니다.
        echo !line! | find /i "Everyone" >nul
        if !errorlevel! equ 0 (
            set "foundEveryone=1"
        )
    )
    echo !foundEveryone!
    :: Everyone 그룹이 발견되었을 때 메시지를 출력합니다.
    if !foundEveryone!==1 (
        ECHO --------------------------------------------------------------------------------- >> bad.txt
        ECHO [ W-24 IIS CGI 실행 제한 - 취약 ] >> bad.txt
        ECHO. >> bad.txt
        ECHO 설명 : "기본 CGI 디렉토리의 Everyone 그룹이 존재하여 취약하다." >> bad.txt
        ECHO. >> bad.txt
        ECHO [보안 조치] >> bad.txt
        ECHO. >> bad.txt
        ECHO [Step 1] 실행 ▶ INETMGR ▶ 해당 웹사이트 ▶ IIS ▶ CGI ▶ Everyone의 모든 권한, 수정 권한, 쓰기 권한 제거 >> bad.txt
        ECHO [Step 2] 사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 Everyone에 모든 권한, 수정 권한, 쓰기 권한 제거 후 Administrators, System 그룹 추가^(모든 권한^) >> bad.txt
        ECHO --------------------------------------------------------------------------------- >> bad.txt
        ECHO. >> bad.txt
        
        ECHO --------------------------------------------------------------------------------- 
        ECHO. 
        ECHO [ W-24 IIS CGI 실행 제한 - 취약 ] 
        ECHO. 
        ECHO 설명 : "기본 CGI 디렉토리의 Everyone 그룹이 존재하여 취약하다."
        ECHO. 
        ECHO [보안 조치]
        ECHO.
        ECHO [Step 1] 실행 ▶ INETMGR ▶ 해당 웹사이트 ▶ IIS ▶ CGI ▶ Everyone의 모든 권한, 수정 권한, 쓰기 권한 제거
        ECHO [Step 2] 사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 Everyone에 모든 권한, 수정 권한, 쓰기 권한 제거 후 Administrators, System 그룹 추가^(모든 권한^)
        ECHO --------------------------------------------------------------------------------- 
        ECHO. >> bad.txt
        goto :end
    ) else (
        ECHO. >> good.txt
        ECHO --------------------------------------------------------------------------------- >> good.txt
        ECHO. >> good.txt
        ECHO [ W-24 IIS CGI 실행 제한 - 양호 ] >> good.txt
        ECHO. >> good.txt
        ECHO 설명 : "기본 CGI 디렉토리 Everyone 그룹의 권한이 없어 양호합니다." >> good.txt
        ECHO --------------------------------------------------------------------------------- >> good.txt
        ECHO. >> good.txt

        ECHO.  
        ECHO ---------------------------------------------------------------------------------  
        ECHO.  
        ECHO [ W-24 IIS CGI 실행 제한 - 양호 ]  
        ECHO.  
        ECHO 설명 : "기본 CGI 디렉토리 Everyone 그룹의 권한이 없어 양호합니다."  
        ECHO.  
        ECHO ---------------------------------------------------------------------------------  
        ECHO.  
    )
) else (
    ECHO.  >> good.txt
    ECHO ---------------------------------------------------------------------------------  >> good.txt
    ECHO.  >> good.txt
    ECHO [ W-24 IIS CGI 실행 제한 - 양호 ]  >> good.txt
    ECHO.  >> good.txt
    ECHO 설명 : "기본 CGI 디렉토리가 존재하지 않아 양호하다." >> good.txt
    ECHO ---------------------------------------------------------------------------------  >> good.txt
    ECHO.  >> good.txt

    ECHO.  
    ECHO ---------------------------------------------------------------------------------  
    ECHO.  
    ECHO [ W-24 IIS CGI 실행 제한 - 양호 ]  
    ECHO.  
    ECHO 설명 : "기본 CGI 디렉토리가 존재하지 않아 양호하다." 
    ECHO.
)
:end

pause
goto SERVICE

REM -------------------------------------------7. W-25. IIS 상위 디렉터리 접근 금지.
:ACCOUNT_W-25
ECHO [W25] IIS 상위 디렉터리 접근 금지.

%SystemRoot%\system32\inetsrv\appcmd.exe list config "web" /section:asp /config:* | findstr /I "enableParentPaths=\"false\"" > nul
if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> bad.txt 
    ECHO [ W-25 IIS 상위 디렉터리 접근 금지 - 취약 ] >> bad.txt
    ECHO. >> bad.txt 
    ECHO 설명 : "상위 패스 기능을 제거하지 않아 취약하다" >> bad.txt
    ECHO. >> bad.txt 
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO [Step 1] 실행 ▶ INETMGR ▶ 해당 웹사이트 ▶ IIS ▶ ASP ▶ 기능 열기 ▶ 동작 ▶ 부모 경로 사용 ▶ False >> bad.txt
    ECHO [Step 2] 사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 Everyone에 모든 권한, 수정 권한, 쓰기 권한 제거 후 Administrators, System 그룹 추가 ^(모든 권한^) >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W-25 IIS 상위 디렉터리 접근 금지 - 취약 ] 
    ECHO. 
    ECHO 설명 : "상위 패스 기능을 제거하지 않아 취약하다"
    ECHO. 
    ECHO [보안 조치]
    ECHO.
    ECHO [Step 1] 실행 ▶ INETMGR ▶ 해당 웹사이트 ▶ IIS ▶ ASP ▶ 기능 열기 ▶ 동작 ▶ 부모 경로 사용 ▶ False
    ECHO [Step 2] 사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 Everyone에 모든 권한, 수정 권한, 쓰기 권한 제거 후 Administrators, System 그룹 추가 ^(모든 권한^) 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
) else (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO [ W-25 IIS 상위 디렉터리 접근 금지 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명 : "상위 패스 기능을 제거하여 양호하다."  >> good.txt
    ECHO.  >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt 
    ECHO. >> good.txt
    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-25 IIS 상위 디렉터리 접근 금지 - 양호 ]
    ECHO. 
    ECHO 설명 : "상위 패스 기능을 제거하여 양호하다."
    ECHO. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO.
)

pause
goto SERVICE

REM -------------------------------------------8. W-26. IIS 불필요한 파일 제거.
:ACCOUNT_W-26
ECHO [W26] IIS 불필요한 파일 제거.

set "filePath=C:\inetpub\iissamples" 

if exist "%filePath%" (
ECHO --------------------------------------------------------------------------------- >> bad.txt
ECHO. >> bad.txt
ECHO [ W-26 IIS 불필요한 파일 제거 - 취약 ] >> bad.txt
ECHO. >> bad.txt
ECHO 설명 : 해당 웹 사이트에 IIS Samples, IISHelp 가상 디렉토리가 존재하게되면 취약합니다. >> bad.txt
ECHO. >> bad.txt
ECHO [보안 조치] >> bad.txt
ECHO Sample 디렉토리 확인 후 삭제 >> bad.txt
ECHO. >> bad.txt
ECHO  ◆ Windows 2000-IIS 5.0, 2003-IIS 6.0 >> bad.txt
ECHO. >> bad.txt
ECHO [ List ] c:\inetpub\iissamples >> bad.txt
ECHO          c:\winnt\help\iishelp -IIS 설명서- >> bad.txt
ECHO          c:\program files\common files\system\msadc\sample -데이터 액세스- >> bad.txt
ECHO          %SystemRoot%\System32\Inetsrv\IISADMPWD >> bad.txt
ECHO [ 현황 ] >> bad.txt
ECHO IISSAMPLES가 존재합니다. >> bad.txt

set "filePath=c:\winnt\help\iishelp"
if exist "%filePath%" (
ECHO IISHELP가 존재합니다. >> bad.txt
)
set "filePath=c:\program files\common files\system\msadc\sample"
if exist "%filePath%" (
ECHO c:\program files\common files\system\msadc\sample가 존재합니다. >> bad.txt
)
set "filePath=%SystemRoot%\System32\Inetsrv\IISADMPWD"
if exist "%filePath" (
ECHO %SystemRoot%\System32\Inetsrv\IISADMPWD가 존재합니다. >> bad.txt
)
ECHO. >> bad.txt
ECHO --------------------------------------------------------------------------------- >> bad.txt

ECHO --------------------------------------------------------------------------------- 
ECHO. 
ECHO [ W-26 IIS 불필요한 파일 제거 - 취약 ] 
ECHO. 
ECHO 설명 : 해당 웹 사이트에 IIS Samples, IISHelp 가상 디렉토리가 존재하게되면 취약합니다. 
ECHO. 
ECHO [보안 조치] 
ECHO Sample 디렉토리 확인 후 삭제 
ECHO. 
ECHO  ◆ Windows 2000-IIS 5.0, 2003-IIS 6.0 
ECHO. 
ECHO [ List ] c:\inetpub\iissamples 
ECHO          c:\winnt\help\iishelp -IIS 설명서- 
ECHO          c:\program files\common files\system\msadc\sample -데이터 액세스- 
ECHO          %SystemRoot%\System32\Inetsrv\IISADMPWD 
ECHO [ 현황 ] 
ECHO IISSAMPLES가 존재합니다. 

set "filePath=c:\winnt\help\iishelp"
if exist "%filePath%" (
ECHO IISHELP가 존재합니다. 
)
set "filePath=c:\program files\common files\system\msadc\sample"
if exist "%filePath%" (
ECHO c:\program files\common files\system\msadc\sample가 존재합니다. 
)
set "filePath=%SystemRoot%\System32\Inetsrv\IISADMPWD"
if exist "%filePath" (
ECHO %SystemRoot%\System32\Inetsrv\IISADMPWD가 존재합니다. 
)
ECHO. 
ECHO --------------------------------------------------------------------------------- 
) else (
ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO. >> good.txt
ECHO [ W-26 IIS 불필요한 파일 제거 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명 : 해당 웹 사이트에 IISSamples, IISHelp 가상 디렉토리가 존재하지 않아 양호합니다. >> good.txt
ECHO. >> good.txt
ECHO ◆ IIS 7.0-Windows 2008 이상 버전 해당 사항 없음 >> good.txt
ECHO. >> good.txt
ECHO --------------------------------------------------------------------------------- >> good.txt

ECHO --------------------------------------------------------------------------------- 
ECHO. 
ECHO [ W-26 IIS 불필요한 파일 제거 - 양호 ] 
ECHO. 
ECHO 설명 : 해당 웹 사이트에 IISSamples, IISHelp 가상 디렉토리가 존재하지 않아 양호합니다. 
ECHO. 
ECHO ◆ IIS 7.0-Windows 2008 이상 버전 해당 사항 없음 
ECHO. 
ECHO --------------------------------------------------------------------------------- 
)


pause
goto SERVICE

REM -------------------------------------------9. W-27. IIS 웹 프로세스 권한 제한.
:ACCOUNT_W-27
ECHO [W27] IIS 웹 프로세스 권한 제한.
setlocal enabledelayedexpansion

secedit /export /cfg secpol.txt >nul

REM 확인 결과를 파일에서 찾습니다.
type secpol.txt | find/i "SeServiceLogonRight" | find/i "nobody" >nul

if errorlevel 1 (
    ECHO. >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-27 IIS 웹 프로세스 권한 제한 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : 로컬 보안 정책 ^> 로컬 정책^> 사용자 권한에 "nobody" 계정이 누락되어 웹 프로세스가 관리자 권한이 부여된 계정으로 운영 중인 것으로 간주하여, 이를 취약으로 판단합니다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO ■ Windows NT, 2000, 2003 >> bad.txt
    ECHO. >> bad.txt
    ECHO [Step 1] "시작> 제어판> 관리도구> 컴퓨터 관리> 로컬 사용자 및 그룹> 사용자 선택" >> bad.txt
    ECHO [Step 2]" nobody 계정 추가 -> nobody 계정의 소속 그룹에 정해진 User가 있으면 제거" >> bad.txt
    ECHO [Step 3] "시작> 제어판> 관리도구> 로컬 보안 정책> 로컬 정책> 사용자 권한 할당 선택", "서비스 로그온"에 "nobody" 계정 추가 >> bad.txt
    ECHO [Step 4] "시작> 실행> SERVICES.MSC> IIS Admin Service> 속성> [로그온] 탭의 계정 지정에 nobody 계정 및 패스워드 입력" >> bad.txt
    ECHO [Step 5] "시작> 프로그램> 윈도우 탐색기> IIS 가 설치된 폴더 속성> [보안] 탭에서 nobody 계정을 추가하고 모든 권한 체크" >> bad.txt
    ECHO. >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt

    ECHO. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W-27 IIS 웹 프로세스 권한 제한 - 취약 ] 
    ECHO. 
    ECHO 설명 : 로컬 보안 정책 ^> 로컬 정책^> 사용자 권한에 "nobody" 계정이 누락되어 웹 프로세스가 관리자 권한이 부여된 계정으로 운영 중인 것으로 간주하여, 이를 취약으로 판단합니다.
    ECHO. 
    ECHO [보안 조치]
    ECHO. 
    ECHO ■ Windows NT, 2000, 2003 
    ECHO. 
    ECHO [Step 1] "시작> 제어판> 관리도구> 컴퓨터 관리> 로컬 사용자 및 그룹> 사용자 선택 "
    ECHO [Step 2] "nobody 계정 추가 -> nobody 계정의 소속 그룹에 정해진 User가 있으면 제거" 
    ECHO [Step 3] "시작> 제어판> 관리도구> 로컬 보안 정책> 로컬 정책> 사용자 권한 할당 선택", "서비스 로그온"에 "nobody" 계정 추가 
    ECHO [Step 4] "시작> 실행> SERVICES.MSC> IIS Admin Service> 속성> [로그온] 탭의 계정 지정에 nobody 계정 및 패스워드 입력 "
    ECHO [Step 5] "시작> 프로그램> 윈도우 탐색기> IIS 가 설치된 폴더 속성> [보안] 탭에서 nobody 계정을 추가하고 모든 권한 체크 "
    ECHO. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 

    goto end_27
    
)  

icacls "C:\web" | findstr /C:"nobody" > nul

if errorlevel 1 (
    ECHO. >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-27 IIS 웹 프로세스 권한 제한 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : IIS 디렉토리에 "nobody" 계정이 누락되어 웹 프로세스가 관리자 권한이 부여된 계정으로 운영 중인 것으로 간주하여, 이를 취약으로 판단합니다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO ■ Windows NT, 2000, 2003 >> bad.txt
    ECHO. >> bad.txt
    ECHO [Step 1] "시작> 제어판> 관리도구> 컴퓨터 관리> 로컬 사용자 및 그룹> 사용자 선택" >> bad.txt
    ECHO [Step 2] "nobody 계정 추가 -> nobody 계정의 소속 그룹에 정해진 User가 있으면 제거" >> bad.txt
    ECHO [Step 3] "시작> 제어판> 관리도구> 로컬 보안 정책> 로컬 정책> 사용자 권한 할당 선택", "서비스 로그온"에 "nobody" 계정 추가 >> bad.txt
    ECHO [Step 4] "시작> 실행> SERVICES.MSC> IIS Admin Service> 속성> [로그온] 탭의 계정 지정에 nobody 계정 및 패스워드 입력" >> bad.txt
    ECHO [Step 5] "시작> 프로그램> 윈도우 탐색기> IIS 가 설치된 폴더 속성> [보안] 탭에서 nobody 계정을 추가하고 모든 권한 체크" >> bad.txt
    ECHO. >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt

    ECHO. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W-27 IIS 웹 프로세스 권한 제한 - 취약 ] 
    ECHO. 
    ECHO 설명 : IIS 디렉토리에 "nobody" 계정이 누락되어 웹 프로세스가 관리자 권한이 부여된 계정으로 운영 중인 것으로 간주하여, 이를 취약으로 판단합니다. 
    ECHO [보안 조치]
    ECHO. 
    ECHO ■ Windows NT, 2000, 2003 
    ECHO. 
    ECHO [Step 1] "시작> 제어판> 관리도구> 컴퓨터 관리> 로컬 사용자 및 그룹> 사용자 선택 "
    ECHO [Step 2] "nobody 계정 추가 -> nobody 계정의 소속 그룹에 정해진 User가 있으면 제거 "
    ECHO [Step 3] "시작> 제어판> 관리도구> 로컬 보안 정책> 로컬 정책> 사용자 권한 할당 선택", "서비스 로그온"에 "nobody" 계정 추가 
    ECHO [Step 4] "시작> 실행> SERVICES.MSC> IIS Admin Service> 속성> [로그온] 탭의 계정 지정에 nobody 계정 및 패스워드 입력" 
    ECHO [Step 5] "시작> 프로그램> 윈도우 탐색기> IIS 가 설치된 폴더 속성> [보안] 탭에서 nobody 계정을 추가하고 모든 권한 체크 "
    ECHO. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 

    goto end_27
)


ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO. >> good.txt
ECHO [ W-27 IIS 웹 프로세스 권한 제한 - 양호 ] >> good.txt
ECHO. >> good.txt
ECHO 설명 : 웹 프로세스가 웹 서비스 운영에 필요한 최소한 권한^(nobody^)으로 설정되어 있어 양호합니다. >> good.txt
ECHO. >> good.txt
ECHO --------------------------------------------------------------------------------- >> good.txt
ECHO. >> good.txt    

ECHO --------------------------------------------------------------------------------- 
ECHO. 
ECHO [ W-27 IIS 웹 프로세스 권한 제한 - 양호 ] 
ECHO. 
ECHO 설명 : 웹 프로세스가 웹 서비스 운영에 필요한 최소한 권한^(nobody^)으로 설정되어 있어 양호합니다. 
ECHO. 
ECHO --------------------------------------------------------------------------------- 
ECHO.    

:end_27


pause
goto SERVICE

REM -------------------------------------------10. W-28. IIS 링크 사용금지.    
:ACCOUNT_W-28
ECHO [W28] IIS 링크 사용금지.

ECHO --------------------------------------------------------------------------------- >> check.txt
ECHO. >> check.txt
ECHO [ W - 28 IIS 링크 사용 금지 - 확인 필요 ] >> check.txt
ECHO. >> check.txt
ECHO 설명 : 심볼릭 링크, aliases, 바로가기 등의 파일이등록된 웹 사이트의 홈 디렉토리에 없는지 수동 점검해야 합니다.  >> check.txt
ECHO. >> check.txt
ECHO [보안 조치] >> check.txt
ECHO 등록된 웹 사이트의 홈 디렉토리에 있는 심볼릭 링크, aliases, 바로가기 파일 삭제 >> check.txt
ECHO . >> check.txt
ECHO ■ Windows 2000, 2003 >> check.txt
ECHO [Step 1] 인터넷 정보 서비스 관리 ▶ 해당 웹사이트 ▶ 속성 ▶ [홈 디렉토리] 탭 선택 ▶ [로컬 경로]에서 홈 디렉토리 위치 확인 >> check.txt
ECHO [Step 2] 로컬 경로에 입력된 홈 디렉토리로 이동하여 바로가기 파일 삭제 >> check.txt 
ECHO. >> check.txt
ECHO ■ Windows 2008, 2012, 2016, 2019 >> check.txt
ECHO [Step 1] 제어판 ▶ 관리도구 ▶ 인터넷 정보 서비스 관리자 ▶ 해당 웹사이트 ▶ 기본 설정 ▶ [실제 경로]에서 홈 디렉토리 위치 확인 >> check.txt
ECHO [Step 2] 실제 경로에 입력된 홈 디렉토리로 이동하여 바로가기 파일 삭제 >> check.txt
ECHO --------------------------------------------------------------------------------- >> check.txt
ECHO . >> check.txt

ECHO --------------------------------------------------------------------------------- 
ECHO. 
ECHO [ W - 28 IIS 링크 사용 금지 - 확인 필요 ]
ECHO. 
ECHO 설명 : 심볼릭 링크, aliases, 바로가기 등의 파일이등록된 웹 사이트의 홈 디렉토리에 없는지 수동 점검해야 합니다.  
ECHO. 
ECHO [보안 조치] 
ECHO 등록된 웹 사이트의 홈 디렉토리에 있는 심볼릭 링크, aliases, 바로가기 파일 삭제 
ECHO . 
ECHO ■ Windows 2000, 2003
ECHO [Step 1] 인터넷 정보 서비스 관리 ▶ 해당 웹사이트 ▶ 속성 ▶ [홈 디렉토리] 탭 선택 ▶ [로컬 경로]에서 홈 디렉토리 위치 확인 
ECHO [Step 2] 로컬 경로에 입력된 홈 디렉토리로 이동하여 바로가기 파일 삭제  
ECHO. 
ECHO ■ Windows 2008, 2012, 2016, 2019
ECHO [Step 1] 제어판 ▶ 관리도구 ▶ 인터넷 정보 서비스 관리자 ▶ 해당 웹사이트 ▶ 기본 설정 ▶ [실제 경로]에서 홈 디렉토리 위치 확인 
ECHO [Step 2] 실제 경로에 입력된 홈 디렉토리로 이동하여 바로가기 파일 삭제 
ECHO --------------------------------------------------------------------------------- 
ECHO .

pause
goto SERVICE

REM -------------------------------------------11. W-29. IIS 파일 업로드 및 다운로드 제한.   
:ACCOUNT_W-29
ECHO [W29] IIS 파일 업로드 및 다운로드 제한.

%SystemRoot%\System32\inetsrv\appcmd list config "Default Web Site" /section:requestFiltering | findstr "maxRequestEntityAllowed"
if %errorlevel% equ 0 (
    :goodw29
    ECHO ------------------------------------------------------------------- >> good.txt
    ECHO [ W - 29 파일 업로드 및 다운로드 제한 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명 : 웹 프로세스의 서버 자원 관리를 위해 업로드 및 다운로드 용량을 제한하므로 양호합니다. >> good.txt
    ECHO. >> good.txt
    ECHO ------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt

    ECHO ------------------------------------------------------------------- 
    ECHO [ W - 29 파일 업로드 및 다운로드 제한 - 양호 ]
    ECHO.
    ECHO 설명 : 웹 프로세스의 서버 자원 관리를 위해 업로드 및 다운로드 용량을 제한하므로 양호합니다.
    ECHO. 
    ECHO ------------------------------------------------------------------- 
    ECHO. 
pause
goto SERVICE
%windir%\System32\inetsrv\appcmd list config "web" -section:system.webServer/asp | findstr "limits" | findstr "bufferingLimit=\"4194304\"" | findstr "maxRequestEntityAllowed=\"200000\"" > nul
if %errorlevel%==0 (
    ECHO -------------------------------------------------------------------
    ECHO [ W - 29 파일 업로드 및 다운로드 제한 - 양호 ]
    ECHO.
    ECHO 설명 : 웹 프로세스의 서버 자원 관리를 위해 업로드 및 다운로드 용량을 제한하므로 양호합니다.
    ECHO.
    ECHO ------------------------------------------------------------------- >> good.txt
    ECHO [ W - 29 파일 업로드 및 다운로드 제한 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명 : 웹 프로세스의 서버 자원 관리를 위해 업로드 및 다운로드 용량을 제한하므로 양호합니다. >> good.txt
    ECHO. >> good.txt
) else (
    ECHO [ W - 29 파일 업로드 및 다운로드 제한 - 취약 ]
    ECHO.
    ECHO 설명 : 웹 프로세스의 서버 자원을 관리하지 않으므로 취약합니다. - 업로드 및 다운로드 용량 미 제한
    ECHO.
    ECHO [보안 조치] 
    ECHO.
    ECHO ■ Windows 2008, 2012, 2016, 2019
    ECHO [Step 1] 시작 ▶ 실행 ▶ INETMGR ▶ 웹 사이트 ▶ 해당 웹사이트 ▶ ASP ▶ 제한 속성 확인
    ECHO [Step 2] Default 값 설정
    ECHO 1 최대 요청 엔터티 본문 제한 maxRequestEntityAllowed - 파일 업로드 용량 : Default 200000 byte
    ECHO 2 응답 버퍼링 제한 bufferingLimit - 파일 다운로드 용량 : Default 4194304 byte
    ECHO. 
    ECHO ------------------------------------------------------------------- >> bad.txt
    ECHO [ W - 29 파일 업로드 및 다운로드 제한 - 취약 ]>> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : 웹 프로세스의 서버 자원을 관리하지 않으므로 취약합니다. - 업로드 및 다운로드 용량 미 제한 >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO [Step 1] 시작 ▶ 실행 ▶ INETMGR ▶ 웹 사이트 ▶ 해당 웹사이트 ▶ ASP ▶ 제한 속성 확인
    ECHO [Step 2] Default 값 설정 >> bad.txt
    ECHO 1 최대 요청 엔터티 본문 제한 maxRequestEntityAllowed - 파일 업로드 용량 : Default 200000 byte >> bad.txt
    ECHO 2 응답 버퍼링 제한 bufferingLimit - 파일 다운로드 용량 : Default 4194304 byte >> bad.txt
    ECHO. >> bad.txt
)

pause
goto SERVICE

	


@echo off

%SystemRoot%\System32\inetsrv\appcmd list config "Default Web Site" /section:requestFiltering | findstr "bufferingLimit"
if %errorlevel% equ 0 (
   call goodw29
) else (
   call badw29
)


REM -------------------------------------------12. W-30. IIS DB 연결 취약점 점검.
:ACCOUNT_W-30
ECHO [W30] IIS DB 연결 취약점 점검.

%windir%\system32\inetsrv\appcmd list config /section:handlers | findstr ".asa .asax"

if errorlevel 1 ( 
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO [ W - 30 IIS DB 연결 취약점 점검 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명 : .asa 매핑이 없으므로 양호하다. >> good.txt
    ECHO. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W - 30 IIS DB 연결 취약점 점검 - 양호 ]
    ECHO. 
    ECHO 설명 : .asa 매핑이 없으므로 양호하다. 
    ECHO. 
    ECHO ---------------------------------------------------------------------------------
    ECHO. 
) else ( 
    ECHO ---------------------------------------------------------------------------------  >> bad.txt
    ECHO.  >> bad.txt
    ECHO [ W - 30 IIS DB 연결 취약점 점검 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : .asa 매핑 시 모든 동작이 가능하도록 설정한 경우
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO ■ Windows 2000, 2003 >> bad.txt
    ECHO [Step 1] asa 매핑 등록 확인
    ECHO 인터넷 정보 서비스 관리자 ▶ 웹 사이트 ▶해당 웹 사이트 ▶ 속성 ▶ [홈 디렉토리] 탭에서 구성 ▶ [매핑] 탭 선택 >> bad.txt
    ECHO [Step 2] asa 매핑이 등록되어 있으면 특정 동작만 가능하도록 설정되어 있는지 확인 >> bad.txt
    ECHO [매핑] 탭에서 [편집] 내용이 다음과 동일하게 설정되어 있는지 확인 >> bad.txt
    ECHO    - 동사 ▶ 다음으로 제한 ▶ GET, HEAD, POST, TRACE 입력 >> bad.txt
    ECHO    - 스크립트 엔진 체크 >> bad.txt
    ECHO    - 파일이 있는지 확인 체크 >> bad.txt
    ECHO. >> bad.txt
    ECHO ■ Windows 2008, 2012, 2016, 2019 >> bad.txt
    ECHO asa / asax 파일 필터링 확인 >> bad.txt
    ECHO [Step 1] false 일 경우 양호 >> bad.txt
    ECHO 인터넷 정보 서비스 관리자 ▶ 해당 웹 사이트 ▶ IIS ▶ "요청 필터링" 선택, .asa / .asax 확장자가 false로 설정되어 있는지 확인 >> bad.txt
    ECHO True일 경우 제거하고 "파일 이름 확장명 거부" 에 등록 >> bad.txt
    ECHO ---------------------------------------------------------------------------------  >> bad.txt
    ECHO.  >> bad.txt

    ECHO ---------------------------------------------------------------------------------  
    ECHO.  
    ECHO [ W - 30 IIS DB 연결 취약점 점검 - 취약 ] 
    ECHO. 
    ECHO 설명 : .asa 매핑 시 모든 동작이 가능하도록 설정한 경우
    ECHO. 
    ECHO [보안 조치] 
    ECHO ■ Windows 2000, 2003 
    ECHO [Step 1] asa 매핑 등록 확인
    ECHO 인터넷 정보 서비스 관리자 ▶ 웹 사이트 ▶해당 웹 사이트 ▶ 속성 ▶ [홈 디렉토리] 탭에서 구성 ▶ [매핑] 탭 선택 
    ECHO [Step 2] asa 매핑이 등록되어 있으면 특정 동작만 가능하도록 설정되어 있는지 확인 
    ECHO [매핑] 탭에서 [편집] 내용이 다음과 동일하게 설정되어 있는지 확인 
    ECHO    - 동사 ▶ 다음으로 제한 ▶ GET, HEAD, POST, TRACE 입력 
    ECHO    - 스크립트 엔진 체크 
    ECHO    - 파일이 있는지 확인 체크 
    ECHO. 
    ECHO ■ Windows 2008, 2012, 2016, 2019 
    ECHO asa / asax 파일 필터링 확인 
    ECHO [Step 1] false 일 경우 양호 
    ECHO 인터넷 정보 서비스 관리자 ▶ 해당 웹 사이트 ▶ IIS ▶ "요청 필터링" 선택, .asa / .asax 확장자가 false로 설정되어 있는지 확인 
    ECHO True일 경우 제거하고 "파일 이름 확장명 거부" 에 등록 
    ECHO ---------------------------------------------------------------------------------  
    ECHO.  
    )

pause
goto SERVICE

REM -------------------------------------------13. W-31. IIS 가상 디렉터리 삭제.
:ACCOUNT_W-31
ECHO [W31] IIS 가상 디렉터리 삭제.

set "sitename=web"
set "configFile=%windir%\system32\inetsrv\config\applicationHost.config"
findstr /C:"<location path=\"%siteName%/IIS Admin\"" "%configFile%" >nul
if errorlevel 1 (
    :goodw31
    ECHO -------------------------------------------------------------------- >> good.txt
    ECHO.  >> good.txt
    ECHO [ W - 31 IIS 가상 디렉토리 삭제 - 양호]  >> good.txt
    ECHO.  >> good.txt
    ECHO 설명 : 해당 웹 사이트에 IIS Admin, IIS Adminpwd 가상 디렉토리가 존재하지 않으므로 양호하다.  >> good.txt
    ECHO.  >> good.txt
    ECHO -------------------------------------------------------------------- >> good.txt
    ECHO.  >> good.txt

    ECHO -------------------------------------------------------------------- 
    ECHO.  
    ECHO [ W - 31 IIS 가상 디렉토리 삭제 - 양호]  
    ECHO.  
    ECHO 설명 : 해당 웹 사이트에 IIS Admin, IIS Adminpwd 가상 디렉토리가 존재하지 않으므로 양호하다.  
    ECHO.  
    ECHO -------------------------------------------------------------------- 
    ECHO.  
pause
goto SERVICE
) else ( 
    :badw31
    ECHO -------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W - 31 IIS 가상 디렉토리 삭제 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : 해당 웹 사이트에 IIS Admin, IIS Adminpwd 가상 디렉토리가 존재하므로 취약하다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO ■ Windows 2000 >> bad.txt
    ECHO [Step 1] 시작 ▶ 실행 ▶ INETMGR ▶ 웹 사이트 ▶ IISAdmin, IISAdminpwd 선택 ▶삭제 >> bad.txt
    ECHO -- Windows 2003 이상 버전 해당 사항 없음 -- >> bad.txt
    ECHO. >> bad.txt
    ECHO -------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt

    ECHO -------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W - 31 IIS 가상 디렉토리 삭제 - 취약 ] 
    ECHO. 
    ECHO 설명 : 해당 웹 사이트에 IIS Admin, IIS Adminpwd 가상 디렉토리가 존재하므로 취약하다. 
    ECHO. 
    ECHO [보안 조치] 
    ECHO ■ Windows 2000 
    ECHO [Step 1] 시작 ▶ 실행 ▶ INETMGR ▶ 웹 사이트 ▶ IISAdmin, IISAdminpwd 선택 ▶삭제 
    ECHO -- Windows 2003 이상 버전 해당 사항 없음 -- 
    ECHO. 
    ECHO -------------------------------------------------------------------- 
    ECHO. 
pause
goto SERVICE
)

findstr /C:"<location path=\"%siteName%/IIS Adminpwd\"" "%configFile%" >nul
if errorlevel 1 (
    call goodw31
) else (
    call badw31
)


REM -------------------------------------------14. W-32. IIS 데이터 파일 ACL 적용.    
:ACCOUNT_W-32
ECHO [W32] IIS 데이터 파일 ACL 적용.

icacls C:\Inetpub\wwwroot\ | findstr /i "everyone"

IF ERRORLEVEL 1 (
        ECHO ---------------------------------------------------------------------- >> good.txt
        ECHO. >> good.txt
        ECHO [ W - 32 IIS 데이터 파일 ACL 적용 - 양호 ] >> good.txt
        ECHO . >> good.txt
        ECHO 설명 : 홈 디렉토리 내에 있는 하위 파일들에 대해 Everyone 권한이 존재하지 않으므로 양호하다. >> good.txt
        ECHO. >> good.txt
        ECHO ---------------------------------------------------------------------- >> good.txt

        ECHO ---------------------------------------------------------------------- 
        ECHO. 
        ECHO [ W - 32 IIS 데이터 파일 ACL 적용 - 양호 ] 
        ECHO . 
        ECHO 설명 : 홈 디렉토리 내에 있는 하위 파일들에 대해 Everyone 권한이 존재하지 않으므로 양호하다. 
        ECHO. 
        ECHO ---------------------------------------------------------------------- 
	) else (
        ECHO --------------------------------------------------------------------------------- >> bad.txt
        ECHO . >> bad.txt 
        ECHO [ W - 32 IIS 데이터 파일 ACL 적용 - 취약 ] >> bad.txt
        ECHO. >> bad.txt
        ECHO 설명 : 홈 디렉토리 내에 있는 파위 파일들에 대해 Everyone 권한이 존재하므로 취약하다. >> bad.txt
        ECHO. >> bad.txt 
        ECHO [보안 조치] >> bad.txt
        ECHO ■ Windows 2000, 2003 >> bad.txt
        ECHO [Step 1]  시작 ▶ 실행 ▶ INETMGR ▶ 웹 사이트 ▶ 해당 웹사이트 ▶ 속성 ▶ 홈 디렉토리 경로 확인 >> bad.txt
        ECHO [Step 2] 탐색기를 이용하여 홈 디렉토리의 등록정보 ▶ [보안] 탭에서 Everyone 권한 확인 >> bad.txt
        ECHO [Step 3] 아래와 같은 파일들에 대한 불필요한 Everyone 권한 제거 >> bad.txt
        ECHO 파일 형식 / 액세스 제어 목록    >> bad.txt
        ECHO CGI^(.exe, dll, .cmd, pl^)             / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) >> bad.txt
        ECHO 스크립트 파일^(.asp^)                  / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) >> bad.txt
        ECHO 포함 파일^(.inc, .shtm, .shtml^)       / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) >> bad.txt
        ECHO 정적 콘텐츠^(.txt, .gif, .jpg, .html^) / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) >> bad.txt
        ECHO. >> bad.txt
        ECHO ■ Windows 2008, 2012, 2016, 2019 >> bad.txt
        ECHO [Step 1] 시작 ▶ 실행 ▶ INETMGR ▶ 사이트 ▶ 해당 웹사이트 ▶ 기본 설정 ▶ 홈 디렉토리 실제 경로 확인 >> bad.txt
        ECHO [Step 2] 탐색기를 이용하여 홈 디렉토리의 등록 정보 ▶[보안] 탭에서 Everyone 권한 확인 >> bad.txt
        ECHO [Step 3] 아래와 같은 파일들에 대한 불필요한 Everyone 권한 제거 >> bad.txt
        ECHO 파일 형식 / 액세스 제어 목록 >> bad.txt
        ECHO CGI^(.exe, dll, .cmd, pl^)             / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) >> bad.txt
        ECHO 스크립트 파일^(.asp^)                  / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) >> bad.txt
        ECHO --------------------------------------------------------------------------------- >> bad.txt

        ECHO --------------------------------------------------------------------------------- 
        ECHO .  
        ECHO [ W - 32 IIS 데이터 파일 ACL 적용 - 취약 ] 
        ECHO. 
        ECHO 설명 : 홈 디렉토리 내에 있는 파위 파일들에 대해 Everyone 권한이 존재하므로 취약하다. 
        ECHO.  
        ECHO [보안 조치] 
        ECHO ■ Windows 2000, 2003 
        ECHO [Step 1]  시작 ▶ 실행 ▶ INETMGR ▶ 웹 사이트 ▶ 해당 웹사이트 ▶ 속성 ▶ 홈 디렉토리 경로 확인 
        ECHO [Step 2] 탐색기를 이용하여 홈 디렉토리의 등록정보 ▶ [보안] 탭에서 Everyone 권한 확인 
        ECHO [Step 3] 아래와 같은 파일들에 대한 불필요한 Everyone 권한 제거 
        ECHO 파일 형식 / 액세스 제어 목록    
        ECHO CGI^(.exe, dll, .cmd, pl^)             / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) 
        ECHO 스크립트 파일^(.asp^)                  / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) 
        ECHO 포함 파일^(.inc, .shtm, .shtml^)       / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) 
        ECHO 정적 콘텐츠^(.txt, .gif, .jpg, .html^) / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) 
        ECHO. 
        ECHO ■ Windows 2008, 2012, 2016, 2019 
        ECHO [Step 1] 시작 ▶ 실행 ▶ INETMGR ▶ 사이트 ▶ 해당 웹사이트 ▶ 기본 설정 ▶ 홈 디렉토리 실제 경로 확인 
        ECHO [Step 2] 탐색기를 이용하여 홈 디렉토리의 등록 정보 ▶[보안] 탭에서 Everyone 권한 확인 
        ECHO [Step 3] 아래와 같은 파일들에 대한 불필요한 Everyone 권한 제거 
        ECHO 파일 형식 / 액세스 제어 목록 
        ECHO CGI^(.exe, dll, .cmd, pl^)             / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) 
        ECHO 스크립트 파일^(.asp^)                  / 모든 사람 ^(X^), 관리자/시스템^(전체 제어^) 
        ECHO ---------------------------------------------------------------------------------
    )

pause
goto SERVICE

REM -------------------------------------------15. W-33. IIS 미사용 스크립트 매핑 제거.   
:ACCOUNT_W-33
ECHO [W33] IIS 미사용 스크립트 매핑 제거.

setlocal enabledelayedexpansion
set vuln_mapping=.htr .idc .stm .shtml .printer .htw .ida .idq
set vuln_found=0

for %%i in (%vuln_mapping%) do (
    %windir%\system32\inetsrv\appcmd list config "web" -section:system.webServer/handlers | findstr /C:"%%i" > nul
    if !errorlevel! == 0 (
        echo "%%i이 존재합니다." >> bad.txt
	echo "%%i이 존재합니다."
        set vuln_found=1
    )
)

if !vuln_found! equ 1 (
	ECHO ---------------------------------------------------------------------------------
	ECHO [ W-33 : IIS 미사용 스크립트 매핑 제거 - 취약 ]
	ECHO 설명 : 취약한 매핑이 확인되었으므로 취약하다.
	ECHO [보안 조치]
	ECHO.
	ECHO Step 1 : 시작 ^> 실행 ^> INETMGR ^> 웹 사이트 ^> 해당 웹사이트 ^> 처리기 매핑 선택
	ECHO Step 2 : 취약한 매핑 제거
	ECHO ---------------------------------------------------------------------------------
	ECHO.
	ECHO --------------------------------------------------------------------------------- >> bad.txt
	ECHO [ W-33 : IIS 미사용 스크립트 매핑 제거 - 취약 ] >> bad.txt
	ECHO 설명 : 취약한 매핑이 확인되었으므로 취약하다. >> bad.txt
	ECHO [보안 조치] >> bad.txt
	ECHO. >> bad.txt
	ECHO Step 1 : 시작 ^> 실행 ^> INETMGR ^> 웹 사이트 ^> 해당 웹사이트 ^> 처리기 매핑 선택 >> bad.txt
	ECHO Step 2 : 취약한 매핑 제거 >> bad.txt
	ECHO --------------------------------------------------------------------------------- >> bad.txt
	ECHO. >> bad.txt
) else (
	ECHO ---------------------------------------------------------------------------------
	ECHO [  W-33 : IIS 미사용 스크립트 매핑 제거 - 양호 ]
	ECHO.
	ECHO 설명: 취약한 매핑이 발견되지 않았으므로 양호하다
	ECHO ---------------------------------------------------------------------------------
	ECHO.
	ECHO --------------------------------------------------------------------------------- >> good.txt
	ECHO [  W-33 : IIS 미사용 스크립트 매핑 제거 - 양호 ] >> good.txt
	ECHO. >> good.txt
	ECHO 설명: 취약한 매핑이 발견되지 않았으므로 양호하다 >> good.txt
	ECHO --------------------------------------------------------------------------------- >> good.txt
	ECHO. >> good.txt
)

pause
goto SERVICE

REM -------------------------------------------16. W-34. IIS Exec 명령어 쉘 호출 진단.
:ACCOUNT_W-34
ECHO [W34] IIS Exec 명령어 쉘 호출 진단.

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters" /s | find /i "SSIEnableCmdDirective" | find "1" > NUL

if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-34 : IIS Exec 명령어 쉘 호출 진단 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: IIS 5.0 버전에서 레지스트리 "SSIEnableCmdDirective" 값이 0 이거나, IIS 6.0 버전 이상인 경우 >> good.txt
    ECHO. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt
    
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-34 : IIS Exec 명령어 쉘 호출 진단 - 양호 ]
    ECHO.
    ECHO 설명: IIS 5.0 버전에서 레지스트리 "SSIEnableCmdDirective" 값이 0 이거나, IIS 6.0 버전 이상인 경우
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO [ W-34 : IIS Exec 명령어 쉘 호출 진단 - 취약 ] >> bad.txt
    ECHO 설명: IIS 5.0 버전에서 "SSIEnableCmdDirective" 값이 1이므로 취약하다. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO Step 1: 시작 > 실행 > REGEDIT > HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters 검색 >> bad.txt
    ECHO Step 2: DWORD > SSIEnableCmdDirective 값을 찾아 값을 0으로 입력 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt

    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-34 : IIS Exec 명령어 쉘 호출 진단 - 취약 ]
    ECHO 설명: IIS 5.0 버전에서 "SSIEnableCmdDirective" 값이 1이므로 취약하다.
    ECHO [보안 조치]
    ECHO. >> bad.txt
    ECHO Step 1: 시작 > 실행 > REGEDIT > HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters 검색 >> bad.txt
    ECHO Step 2: DWORD > SSIEnableCmdDirective 값을 찾아 값을 0으로 입력 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt
)

ECHO.

pause
goto SERVICE

REM -------------------------------------------17. W-35. IIS WebDAV 비활성화.    
:ACCOUNT_W-35
ECHO [W35] IIS WebDAV 비활성화.

%SystemRoot%\System32\inetsrv\appcmd.exe list module /name:WebDAVModule > nul 2>&1

if %errorlevel% equ 0 (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-35 : IIS WebDAV 비활성화 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : WebDAV 모듈이 활성화되어 있어 취약하다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO Step 1: 인터넷 정보 서비스[IIS] 관리자 > 서버 선택 > IIS > "ISAPI 및 CGI 제한" 선택, WebDAV 사용여부 확인 >> bad.txt
    ECHO Step 2: 인터넷 정보 서비스[IIS] 관리자 > 서버 선택 > IIS > "ISAPI 및 CGI 제한" 선택 WebDAV 항목 선 택 > [작업]에서 제거하거나 편집 > "확장 경로 실행 허용(A)" 체크 해제 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W-35 : IIS WebDAV 비활성화 - 취약 ] 
    ECHO. 
    ECHO 설명 : WebDAV 모듈이 활성화되어 있어 취약하다. 
    ECHO. 
    ECHO [보안 조치] 
    ECHO Step 1: 인터넷 정보 서비스[IIS] 관리자 > 서버 선택 > IIS > "ISAPI 및 CGI 제한" 선택, WebDAV 사용여부 확인 
    ECHO Step 2: 인터넷 정보 서비스[IIS] 관리자 > 서버 선택 > IIS > "ISAPI 및 CGI 제한" 선택 WebDAV 항목 선 택 > [작업]에서 제거하거나 편집 > "확장 경로 실행 허용(A)" 체크 해제 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO. 
    
) else (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-35 : IIS WebDAV 비활성화 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: IIS WebDAV 모듈이 비활성화 되어있어 양호합니다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-35 : IIS WebDAV 비활성화 - 양호 ] 
    ECHO. 
    ECHO 설명: IIS WebDAV 모듈이 비활성화 되어있어 양호합니다. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO. 
)

pause
goto SERVICE

REM -------------------------------------------18. W-36. NetBIOS 바인딩 서비스 구동 점검.    
:ACCOUNT_W-36
ECHO [W36] NetBIOS 바인딩 서비스 구동 점검.

reg query "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces" /s /v NetbiosOptions | find "0x2"

if not errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-36 : NetBIOS 바인딩 서비스 구동 점검 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: TCP/IP와 NetBIOS 간의 바인딩이 제거 되어 있으므로 양호하다 >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-36 : NetBIOS 바인딩 서비스 구동 점검 - 양호 ]
    ECHO.
    ECHO 설명: TCP/IP와 NetBIOS 간의 바인딩이 제거 되어 있으므로 양호하다
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO [ W-36 : NetBIOS 바인딩 서비스 구동 점검 - 취약 ] >> bad.txt
    ECHO 설명 : TCP/IP의 NetBIOS 설정을 사용하고 있으므로 취약하다 >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO Step 1 : 시작 > 실행 > ncpa.cpl > 로컬 영역 연결 >>bad.txt
    ECHO Step 2 : 속성 > TCP/IP > [일반] 탭에서 [고급] 클릭 > [WINS] 탭에서 TCP/IP에서 "NetBIOS 사용 안 함" 또는, "NetBIOS over TCP/IP 사용 안 함" 선택 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-36 : NetBIOS 바인딩 서비스 구동 점검 - 취약 ]
    ECHO 설명 : TCP/IP의 NetBIOS 설정을 사용하고 있으므로 취약하다
    ECHO [보안 조치]
    ECHO Step 1 : 시작 - 실행 - ncpa.cpl - 로컬 영역 연결
    ECHO Step 2 : 속성 - TCP/IP - [일반] 탭에서 [고급] 클릭 - [WINS] 탭에서 TCP/IP에서 "NetBIOS 사용 안 함" 또는, "NetBIOS over TCP/IP 사용 안 함" 선택
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

pause
goto SERVICE

REM -------------------------------------------19. W-37. FTP 서비스 구동 점검.    
:ACCOUNT_W-37
ECHO [W37] FTP 서비스 구동 점검.

net start | find "Microsoft FTP Service" > nul
if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-37 : FTP 서비스 구동 점검 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: FTP 서비스를 사용하지 않는 경우 또는 secure FTP 서비스를 사용하므로 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-37 : 콘솔 로그온 시 로컬 계정에서 빈 암호 사용제한 - 양호 ]
    ECHO.
    ECHO 설명: FTP 서비스를 사용하지 않는 경우 또는 secure FTP 서비스를 사용하므로 양호하다. 
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

if not errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO [ W-37 : FTP 서비스 구동 점검 - 취약 ] >> bad.txt
    ECHO 설명 : FTP 서비스를 사용하므로 취약하다. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO Step 1: 시작 > 실행 > SERVICES.MSC > Microsoft FTP Publishing Service > 속성 > [일반] 탭에서 "시작 유형" 사용 안 함 으로 설정한 후, FTP 서비스 중지 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-37 : FTP 서비스 구동 점검 - 취약 ]
    ECHO 설명 : FTP 서비스를 사용하므로 취약하다.
    ECHO [보안 조치]
    ECHO "Step 1: 시작 > 실행 > SERVICES.MSC > Microsoft FTP Publishing Service > 속성 > [일반] 탭에서 "시작 유형" 사용 안 함 으로 설정한 후, FTP 서비스 중지"
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

ECHO.

pause
goto SERVICE

REM -------------------------------------------20. W-38. FTP 디렉터리 접근권한 설정.
:ACCOUNT_W-38
ECHO [W38] FTP 디렉터리 접근권한 설정.
setlocal enabledelayedexpansion

set "ftpHomeDirectory=C:\inetpub\ftproot"

icacls "!ftpHomeDirectory!" | findstr /C:"Everyone:(F)" > nul
if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-38 : FTP 디렉터리 접근권한 설정 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: FTP 홈 디렉토리에 Everyone 권한이 없어 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-38 : FTP 디렉터리 접근권한 설정 - 양호 ] 
    ECHO. 
    ECHO 설명: FTP 홈 디렉토리에 Everyone 권한이 없어 양호하다. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO [ W-38 : FTP 디렉터리 접근권한 설정 - 취약 ] >> bad.txt
    ECHO 설명 : FTP 홈 디렉토리에 Everyone 권한이 있어 취약하다. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO - Windows NT^(IIS 4.0^), 2000^(IIS 5.0^), 2003^(IIS 6.0^) >> bad.txt
    ECHO Step 1: 인터넷 정보 서비스^(IIS^) 관리 > FTP 사이트 > 해당 FTP 사이트 > 속성 > [홈 디렉토리] 탭에서 FTP 홈 디렉토리 확인 >> bad.txt
    ECHO Step 2: 탐색기 > 홈 디렉토리 > 속성 > [보안] 탭에서 Everyone 권한 제거>> bad.txt
    ECHO. >> bad.txt
    ECHO - Windows 2008^(IIS 7.0^), 2012^(IIS 8.0^) >> bad.txt
    ECHO Step 1: 제어판 > 관리도구 > 인터넷 정보 서비스^(IIS^) 관리 > 해당 웹사이트 > 마우스 우클릭 > FTP 게시 추가  >> bad.txt
    ECHO Step 2: 이후 진행 과정에서 권한 부여 화면의 액세스 허용 대상 선정 시 [지정한 사용자]만 선택  >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-38 : FTP 디렉터리 접근권한 설정 - 취약 ] 
    ECHO 설명 : FTP 홈 디렉토리에 Everyone 권한이 있어 취약하다. 
    ECHO [보안 조치] 
    ECHO - Windows NT^(IIS 4.0^), 2000^(IIS 5.0^), 2003^(IIS 6.0^) 
    ECHO Step 1: 인터넷 정보 서비스^(IIS^) 관리 > FTP 사이트 > 해당 FTP 사이트 > 속성 > [홈 디렉토리] 탭에서 FTP 홈 디렉토리 확인 
    ECHO Step 2: 탐색기 > 홈 디렉토리 > 속성 > [보안] 탭에서 Everyone 권한 제거
    ECHO. 
    ECHO - Windows 2008^(IIS 7.0^), 2012^(IIS 8.0^) 
    ECHO Step 1: 제어판 > 관리도구 > 인터넷 정보 서비스^(IIS^) 관리 > 해당 웹사이트 > 마우스 우클릭 > FTP 게시 추가  
    ECHO Step 2: 이후 진행 과정에서 권한 부여 화면의 액세스 허용 대상 선정 시 [지정한 사용자]만 선택  
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
)

endlocal


pause
goto SERVICE

REM -------------------------------------------21. W-39. Anonymous FTP 금지.
:ACCOUNT_W-39
ECHO [W39] Anonymous FTP 금지.

net start | find "Microsoft FTP Service" > nul
if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-39 : Anonymous FTP 금지 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: FTP 서비스를 사용하지 않으므로 해당사항 없다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-39 : Anonymous FTP 금지 - 양호 ]
    ECHO.
    ECHO 설명: FTP 서비스를 사용하지 않으므로 해당사항 없다. 
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

if not errorlevel 1 (
    
    reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\ftpsvc\Parameters" /s | find /I "AllowAnonymous" > nul

    if errorlevel 1 (
        ECHO --------------------------------------------------------------------------------- >> good.txt
        ECHO [ W-39 : Anonymous FTP 금지 - 양호 ] >> good.txt
        ECHO. >> good.txt
        ECHO 설명: "익명 연결 허용"이 되어 있지 않으므로 양호하다. >> good.txt
        ECHO --------------------------------------------------------------------------------- >> good.txt
        ECHO. >> good.txt
        ECHO. >> good.txt
        ECHO ---------------------------------------------------------------------------------
        ECHO [ W-39 : Anonymous FTP 금지 - 양호 ]
        ECHO.
        ECHO 설명: "익명 연결 허용"이 되어 있지 않으므로 양호하다.
        ECHO ---------------------------------------------------------------------------------
        ECHO.
        ECHO.
    )
    if not errorlevel 1 (
        ECHO --------------------------------------------------------------------------------- >> bad.txt
        ECHO [ W-39 : Anonymous FTP 금지 - 취약 ] >> bad.txt
        ECHO 설명 : "익명 연결 허용"이 되어 있으므로 취약하다. >> bad.txt
        ECHO [보안 조치] >> bad.txt
        ECHO Step 1: 제어판 > 관리도구 >인터넷 정보 서비스 관리 > 해당 웹사이트 > 마우스 우클릭 >FTP 게시 추가 >> bad.txt
        ECHO Step 2: 이후 진행 과정에서 인증 화면의 익명 체크 박스 해제 >> bad.txt
        ECHO --------------------------------------------------------------------------------- >> bad.txt
        ECHO. >> bad.txt
        ECHO. >> bad.txt
        ECHO ---------------------------------------------------------------------------------
        ECHO [ W-39 : Anonymous FTP 금지 - 취약 ]
        ECHO 설명 : "익명 연결 허용"이 되어 있으므로 취약하다.
        ECHO [보안 조치]
        ECHO Step 1: 제어판 > 관리도구 >인터넷 정보 서비스 관리 > 해당 웹사이트 > 마우스 우클릭 >FTP 게시 추가
        ECHO Step 2: 이후 진행 과정에서 인증 화면의 익명 체크 박스 해제
        ECHO ---------------------------------------------------------------------------------
        ECHO.
        ECHO.
    )
    
    
)

ECHO.

pause
goto SERVICE

REM -------------------------------------------22. W-40. FTP 접근 제어 설정. - 파일로 확인
:ACCOUNT_W-40
ECHO [W40] FTP 접근 제어 설정.

type C:\Windows\System32\inetsrv\config\applicationHost.config |findstr "ipSecurity" | findstr "allowUnlisted=\"true\">" > nul
if %errorlevel%==1 (
            ECHO --------------------------------------------------------------------------------- >> good.txt
            ECHO [ W-40 : FTP 접근 제어 설정 - 양호 ] >> good.txt
            ECHO. >> good.txt
            ECHO 설명: FTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되어있어 양호하다. >> good.txt
            ECHO --------------------------------------------------------------------------------- >> good.txt
            ECHO. >> good.txt
            ECHO. >> good.txt

            ECHO --------------------------------------------------------------------------------- 
            ECHO [ W-40 : FTP 접근 제어 설정 - 양호 ] 
            ECHO. 
            ECHO 설명: FTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되어있어 양호하다. 
            ECHO --------------------------------------------------------------------------------- 
            ECHO. 
            ECHO. 
) else (
            ECHO --------------------------------------------------------------------------------- >> bad.txt
            ECHO. >> bad.txt
            ECHO [ W-40 : FTP 접근 제어 설정 - 취약 ] >> bad.txt
            ECHO. >> bad.txt
            ECHO 설명 : FTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되었지만, 액세스 거부 설정이 누락되어있다. >> bad.txt
            ECHO. >> bad.txt
            ECHO [보안 조치] >> bad.txt
            ECHO. >> bad.txt
            ECHO Step 1: "실행 > INETMGR > 사이트 > 해당 웹페이지 > FTP IP 주소 및 도메인 제한" >> bad.txt
            ECHO Step 2: "[작업]의 허용 항목 추가에서 FTP 접속을 허용할 IP 입력" >> bad.txt
            ECHO Step 3: "[작업]의 기능 설정 편집에서 지정되지 않은 클라이언트에 대한 액세스를 거부 선택" >> bad.txt
						ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
            ECHO --------------------------------------------------------------------------------- >> bad.txt
            ECHO. >> bad.txt
            ECHO. >> bad.txt

            ECHO --------------------------------------------------------------------------------- 
            ECHO. 
            ECHO [ W-40 : FTP 접근 제어 설정 - 취약 ] 
            ECHO. 
            ECHO 설명 : FTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되었지만, 액세스 거부 설정이 누락되어있다. 
            ECHO. 
            ECHO [보안 조치] 
            ECHO. 
            ECHO Step 1: "실행 > INETMGR > 사이트 > 해당 웹페이지 > FTP IP 주소 및 도메인 제한" 
            ECHO Step 2: "[작업]의 허용 항목 추가에서 FTP 접속을 허용할 IP 입력" 
            ECHO Step 3: "[작업]의 기기능 설정 편집에서 지정되지 않은 클라이언트에 대한 액세스를 거부 선택" 
			ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
            ECHO --------------------------------------------------------------------------------- 
            ECHO. 
            ECHO. 
)


pause
goto SERVICE

REM -------------------------------------------23. W-41. DNS Zone Transfer 설정. -
:ACCOUNT_W-41
ECHO [W41] DNS Zone Transfer 설정.

REM DNS Zone Transfer 설정 경로
set "DNSZoneTransferKey=HKLM\SYSTEM\CurrentControlSet\Services\DNS\Parameters"

REM 변수 초기화
set "isServiceRunning=0"
set "isZoneTransferConfigured=0"
set "isZoneTransferServerConfigured=0"

REM DNS 서비스 상태 확인
sc query "DNS" | find "RUNNING" 2>nul
if ERRORLEVEL 0 (
    set "isServiceRunning=1"
)

REM DNS Zone Transfer 설정 확인
reg query "%DNSZoneTransferKey%" /v "ZoneTransfer" | find "0x1" 2>nul
if ERRORLEVEL 0 (
    set "isZoneTransferConfigured=1" 
)

REM DNS Zone Transfer 허용 서버 IP 확인
reg query "%DNSZoneTransferKey%" /v "ZoneTransferServers" | find "서버IP주소"  2>nul
if ERRORLEVEL 0 (
    set "isZoneTransferServerConfigured=1" 
)


if %isServiceRunning% equ 1 (
    if %isZoneTransferConfigured% equ 1 (
        if %isZoneTransferServerConfigured% equ 1 (
            ECHO --------------------------------------------------------------------------------- >> good.txt
            ECHO [ W-41 : DNS Zone Transfer 설정 - 양호 ] >> good.txt
            ECHO. >> good.txt
            ECHO 설명:DNS 서비스가 실행 중이며 Zone Transfer 설정 및 허용 서버 IP가 구성되어 있어 양호하다. >> good.txt
            ECHO --------------------------------------------------------------------------------- >> good.txt
            ECHO. >> good.txt
            ECHO. >> good.txt

            ECHO --------------------------------------------------------------------------------- 
            ECHO [ W-41 : DNS Zone Transfer 설정 - 양호 ] 
            ECHO. 
            ECHO 설명:DNS 서비스가 실행 중이며 Zone Transfer 설정 및 허용 서버 IP가 구성되어 있어 양호하다. 
            ECHO --------------------------------------------------------------------------------- 
            ECHO. 
            ECHO. 
            
        ) else (

            ECHO --------------------------------------------------------------------------------- >> check.txt
            ECHO. >> check.txt
            ECHO [ W-41 : DNS Zone Transfer 설정 - 확인 필요 ] >> check.txt
            ECHO. >> check.txt
            ECHO 설명 : DNS 서비스가 실행 중이며 Zone Transfer 설정은 양호하나, 허용 서버 IP가 설정되어 있지 않아 확인이 필요하다. >> check.txt
            ECHO. >> check.txt
            ECHO [보안 조치] >> check.txt
            ECHO. >> check.txt
            ECHO Step 1: "DNS Zone Transfer를 위한 허용 서버 IP가 설정되어야 합니다." >> check.txt
            ECHO --------------------------------------------------------------------------------- >> check.txt
            ECHO. >> check.txt
            ECHO. >> check.txt

            ECHO ---------------------------------------------------------------------------------
            ECHO.
            ECHO [ W-41 : DNS Zone Transfer 설정 - 확인 필요 ]
            ECHO.
            ECHO 설명 : DNS 서비스가 실행 중이며 Zone Transfer 설정은 양호하나, 허용 서버 IP가 설정되어 있지 않아 확인이 필요하다.
            ECHO.
            ECHO [보안 조치]
            ECHO.
            ECHO Step 1: "DNS Zone Transfer를 위한 허용 서버 IP가 설정되어야 합니다."
            ECHO ---------------------------------------------------------------------------------
            ECHO.
            ECHO.
        )
    ) else (

        ECHO --------------------------------------------------------------------------------- >> check.txt
        ECHO. >> check.txt
        ECHO [ W-41 : DNS Zone Transfer 설정 - 확인 필요 ] >> check.txt
        ECHO. >> check.txt
        ECHO 설명 : DNS 서비스가 실행 중이지만 Zone Transfer 설정이 "다음 서버로만"으로 구성되어 있지 않아 확인이 필요하다. >> check.txt
        ECHO. >> check.txt
        ECHO [보안 조치] >> check.txt
        ECHO. >> check.txt
        ECHO Step 1: DNS Zone Transfer 설정은 "다음 서버로만"으로 구성되어야한다. >> check.txt
        ECHO --------------------------------------------------------------------------------- >> check.txt
        ECHO. >> check.txt
        ECHO. >> check.txt

        ECHO ---------------------------------------------------------------------------------
        ECHO.
        ECHO [ W-41 : DNS Zone Transfer 설정 - 확인 필요 ]
        ECHO.
        ECHO 설명 : DNS 서비스가 실행 중이지만 Zone Transfer 설정이 "다음 서버로만"으로 구성되어 있지 않아 확인이 필요하다.
        ECHO.
        ECHO [보안 조치]
        ECHO.
        ECHO Step 1: DNS Zone Transfer 설정은 "다음 서버로만"으로 구성되어야한다.
        ECHO ---------------------------------------------------------------------------------
        ECHO.
        ECHO.
    )
) else (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-41 : DNS Zone Transfer 설정 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: DNS 서비스가 실행 중이지 않아 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-41 : DNS Zone Transfer 설정 - 양호 ] 
    ECHO. 
    ECHO 설명: DNS 서비스가 실행 중이지 않아 양호하다. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO. 
)


pause
goto SERVICE

REM -------------------------------------------24. W-42. RDS(Remote Data Services) 제거.    
:ACCOUNT_W-42
ECHO [W42] RDS(Remote Data Services) 제거.

REM 취약한 레지스트리 키/디렉터리 목록
set "vulnerable_keys=HKLM\System\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\RDSServer.DataFactory "

set "vulnerable=0"

REM 각 취약한 레지스트리 키/디렉터리를 확인
for %%k in (!vulnerable_keys!) do (
    reg query "%%k" >nul 2>&1
    if !errorlevel! equ 0 (
        set "vulnerable=1"
    ) 
)

if !vulnerable! equ 0 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO "[ W-42 : RDS(Remote Data Services) 제거 - 양호 ]" >> good.txt
    ECHO. >> good.txt
    ECHO 설명: Windows server 2008 이상이거나 취약한 RDS 관련 레지스트리 키/디렉터리가 없어서 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO "[ W-42 : RDS(Remote Data Services) 제거 - 양호 ]" 
    ECHO. 
    ECHO 설명: Windows server 2008 이상이거나 취약한 RDS 관련 레지스트리 키/디렉터리가 없어서 양호하다.
    ECHO --------------------------------------------------------------------------------- 
    ECHO.
    ECHO.
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-42 : "RDS(Remote Data Services) 제거" - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : 취약한 RDS 관련 레지스트리 키/디렉터리가 존재하여 취약하다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO Step 1: "사용하지 않는 경우 IIS 서비스 중지/사용 안 함, 사용할 경우 Registry 키 값 제거 or 관련 패치 적용 *Windows server 2008 이상 양호" >> bad.txt
    ECHO Step 2: 다음의 레지스트리 키/디렉터리 제거 >> bad.txt
    ECHO "HKLM\System\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\RDSServer.DataFactory" >> bad.txt
    ECHO "HKLM\System\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\Advanced.DataFactory" >> bad.txt
    ECHO "HKLM\System\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\VbBusObj.VbBusObjCl" >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt


    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W-42 : "RDS(Remote Data Services) 제거" - 취약 ] 
    ECHO. 
    ECHO 설명 : 취약한 RDS 관련 레지스트리 키/디렉터리가 존재하여 취약하다. 
    ECHO. 
    ECHO [보안 조치] 
    ECHO. 
    ECHO Step 1: "사용하지 않는 경우 IIS 서비스 중지/사용 안 함, 사용할 경우 Registry 키 값 제거 or 관련 패치 적용 *Windows server 2008 이상 양호" 
    ECHO Step 2: 다음의 레지스트리 키/디렉터리 제거 
    ECHO "HKLM\System\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\RDSServer.DataFactory" 
    ECHO "HKLM\System\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\Advanced.DataFactory" 
    ECHO "HKLM\System\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\VbBusObj.VbBusObjCl" 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO. 
)
ECHO.

pause
goto SERVICE


REM -------------------------------------------25. W-43. 최신 서비스팩 적용.
:ACCOUNT_W-43
ECHO [W43] 최신 서비스팩 적용.

for /f "tokens=6 delims=. " %%i in ('ver') do (
    set currentBuild=%%i
)

REM 비교할 빌드 번호 (예: 빌드 19042, Windows 10 버전 20H2)
set desiredBuild=19045

if !currentBuild! geq !desiredBuild! (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-43 : 최신 서비스팩 적용 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: 서비스팩 빌드번호: !windows_version! 이므로 "19045" 버전 이후의 최신 서비스팩이여서 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt

    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-43 : 최신 서비스팩 적용 - 양호 ] 
    ECHO. 
    ECHO 설명: 서비스팩 빌드번호: !windows_version! 이므로 "19045" 버전 이후의 최신 서비스팩이여서 양호하다. 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO.    
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-43 : 최신 서비스팩 적용 - 취약 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : 서비스팩 빌드번호: !windows_version! 이므로 "19045" 버전 이하의 최신 서비스팩이 아니여서 취약하다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO Step 1: "서비스 팩 버전 확인 후 최신 버전이 아닐 경우 다운로드하여 설치" >> bad.txt
    ECHO Step 2: 업데이트 및 서비스 팩 사이트: "http://www.microsoft.com/ko-kr/download/servicepack.aspx" >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt

    ECHO ---------------------------------------------------------------------------------
    ECHO. 
    ECHO [ W-43 : 최신 서비스팩 적용 - 취약 ] 
    ECHO. 
    ECHO 설명 : 서비스팩 빌드번호: !windows_version! 이므로 "19045" 버전 이하의 최신 서비스팩이 아니여서 취약하다. 
    ECHO. 
    ECHO [보안 조치] 
    ECHO.
    ECHO Step 1: "서비스 팩 버전 확인 후 최신 버전이 아닐 경우 다운로드하여 설치" 
    ECHO Step 2: 업데이트 및 서비스 팩 사이트: "http://www.microsoft.com/ko-kr/download/servicepack.aspx" 
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO. 
)
ECHO.

pause
goto SERVICE


REM -------------------------------------------1. W-44. 로그의 정기적 검토 및 보고.
:ACCOUNT_W-44
ECHO [W44] 로그의 정기적 검토 및 보고.

ECHO --------------------------------------------------------------------------------- >> check.txt
ECHO [ W-44 : 로그의 정기적 검토 및 보고 - 확인 필요 ] >> check.txt
ECHO. 
ECHO 설명 : 접속기록 등의 보안 로그, 응용 프로그램 및 시스템 로그 기록에 대해 정기 적으로 검토, 분석, 리포트 작성 및 보고 등의 조치가 이루어지는지 확인이 필요합니다 >> check.txt
ECHO. >> check.txt
ECHO [보안 조치] >> check.txt
ECHO. >> check.txt
ECHO Step 1^) 로그 기록에 대한 정기적 검토 및 분석 실시 >> check.txt
ECHO a. 시작> 제어판> 관리 도구> 이벤트 뷰어 >> check.txt
ECHO b. 응용 프로그램 로그, 보안 로그, 시스템 로그 분석 >> check.txt
ECHO Step 2^) 로그 분석 결과에 대한 일일·월간 보고서 작성 및 보고 >> check.txt
ECHO --------------------------------------------------------------------------------- >> check.txt
ECHO. >> check.txt
ECHO. >> check.txt
ECHO ---------------------------------------------------------------------------------
ECHO [ W-44 : 로그의 정기적 검토 및 보고 - 확인 필요 ] 
ECHO .
ECHO 설명 : 접속기록 등의 보안 로그, 응용 프로그램 및 시스템 로그 기록에 대해 정기 적으로 검토, 분석, 리포트 작성 및 보고 등의 조치가 이루어지는지 확인이 필요합니다
ECHO.
ECHO [보안 조치]
ECHO.
ECHO Step 1^) 로그 기록에 대한 정기적 검토 및 분석 실시 
ECHO a. 시작 ^> 제어판 ^> 관리 도구 ^> 이벤트 뷰어
ECHO b. 응용 프로그램 로그, 보안 로그, 시스템 로그 분석
ECHO Step 2^) 로그 분석 결과에 대한 일일·월간 보고서 작성 및 보고 
ECHO ---------------------------------------------------------------------------------
ECHO.

pause
goto LOG

REM -------------------------------------------2. W-45. 원격으로 액세스할 수 있는 레지스트리 경로.
:ACCOUNT_W-45
ECHO [W45] 원격으로 액세스할 수 있는 레지스트리 경로.

net start | find /I "Remote Registry" > nul
if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-45 : 원격으로 액세스 할 수 있는 레지스트리 경로 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: Remote Registry Service를 사용하지 않으므로 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-45 : 원격으로 액세스 할 수 있는 레지스트리 경로 - 양호 ]
    ECHO.
    ECHO 설명: Remote Registry Service를 사용하지 않으므로 양호하다. . 
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

if not errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO [ W-45 : 원격으로 액세스 할 수 있는 레지스트리 경로 - 취약 ] >> bad.txt
    ECHO 설명 : FTP 서비스를 사용하므로 취약하다. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO Step 1 ^) 시작 ^> 실행 ^> SERVICES.MSC ^> Remote Registry ^> 속성 >> bad.txt
    ECHO Step 2 ^) 시작 유형 → 사용 안 함                                   >> bad.txt
    ECHO Step 3 ^) 서비스 상태 → 중지                                       >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-45 : 원격으로 액세스 할 수 있는 레지스트리 경로 - 취약 ]
    ECHO 설명 : FTP 서비스를 사용하므로 취약하다.
    ECHO [보안 조치]
    ECHO Step 1 ^) 시작 ^> 실행 ^> SERVICES.MSC ^> Remote Registry ^> 속성
    ECHO Step 2 ^) 시작 유형 → 사용 안 함
    ECHO Step 3 ^) 서비스 상태 → 중지
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

pause
goto LOG

REM -------------------------------------------1. W-46. 백신 프로그램 설치.
:ACCOUNT_W-46
ECHO [W46] 백신 프로그램 설치.

ECHO --------------------------------------------------------------------------------- >> check.txt
ECHO [ W-46 : 백신 프로그램 확인 - 확인 필요 ] >> check.txt
ECHO. >> check.txt
ECHO [서비스 목록 확인] >> check.txt
net start | find /v "다음과 같은 Windows 서비스가 시작되었습니다." | find /v "명령을 잘 실행했습니다." >> check.txt
ECHO. >> check.txt
ECHO [실행 중인 프로그램 목록 확인] >> check.txt
tasklist >> check.txt
ECHO.
ECHO.
ECHO 설명 : 바이러스 백신 프로그램이 설치되어 있는지 수동 점검이 필요합니다. >> check.txt
ECHO. >> check.txt
ECHO [보안 조치] >> check.txt
ECHO. >> check.txt
ECHO 나열되지 않은 백신에 대해서도 인지도, 효과성 등을 검토하여 설치할 수 있음 >> check.txt
ECHO * 안철수 연구소: http://www.ahnlab.com >> check.txt
ECHO * 하우리: http://www.hauri.co.kr >> check.txt
ECHO * 노턴라이프락(구 시만텍): https://kr.norton.com/\ >> check.txt
ECHO * 한국트렌드마이크로: http://www.trendmicro.co.kr >> check.txt
ECHO * 알약: https://www.estsecurity.com/  >> check.txt
ECHO --------------------------------------------------------------------------------- >> check.txt
ECHO. >> check.txt
ECHO. >> check.txt
ECHO --------------------------------------------------------------------------------- 
ECHO [ W-46 : 백신 프로그램 확인 - 확인 필요 ] 
ECHO. 
ECHO [서비스 목록 확인]
net start | find /v "다음과 같은 Windows 서비스가 시작되었습니다." | find /v "명령을 잘 실행했습니다."
ECHO.
ECHO [실행 중인 프로그램 목록 확인]
tasklist
ECHO.
ECHO.
ECHO 설명 : 바이러스 백신 프로그램이 설치되어 있는지 수동 점검이 필요합니다.
ECHO.
ECHO [보안 조치] 
ECHO.
ECHO 나열되지 않은 백신에 대해서도 인지도, 효과성 등을 검토하여 설치할 수 있음
ECHO * 안철수 연구소: http://www.ahnlab.com
ECHO * 하우리: http://www.hauri.co.kr
ECHO * 노턴라이프락(구 시만텍): https://kr.norton.com/\ 
ECHO * 한국트렌드마이크로: http://www.trendmicro.co.kr 
ECHO * 알약: https://www.estsecurity.com/ 
ECHO --------------------------------------------------------------------------------- 
ECHO.
ECHO.

pause
goto SECURITY

REM -------------------------------------------2. W-47. SAM 파일 접근 통제 설정.
:ACCOUNT_W-47
ECHO [W47] SAM 파일 접근 통제 설정.

cacls %systemroot%\system32\config\SAM | findstr /i "SAM" | findstr /i "NT AUTHORITY\SYSTEM"

if not errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO [ W-47 : SAM 파일 접근 통제 설정 - 양호 ] >> good.txt
    ECHO. >> good.txt
    ECHO 설명: SAM 파일 접근권한에 Administrator, System 그룹만 모든 권한으로 설정되어 있으므로 양호하다. >> good.txt
    ECHO --------------------------------------------------------------------------------- >> good.txt
    ECHO. >> good.txt
    ECHO. >> good.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-47 : SAM 파일 접근 통제 설정 - 양호 ]
    ECHO.
    ECHO 설명: SAM 파일 접근권한에 Administrator, System 그룹만 모든 권한으로 설정되어 있으므로 양호하다.
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

if errorlevel 1 (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO [ W-47 : SAM 파일 접근 통제 설정 - 취약 ] >> bad.txt
    ECHO 설명 : SAM 파일 접근권한에 Administrator, System 그룹 외 다른 그룹에 권한 이 설정되어 있으므로 취약하다. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO Step 1^) %systemroot%\system32\config\SAM ^> 속성^> 보안 >> bad.txt
    ECHO Step 2^) Administrator, System 그룹 외 다른 사용자 및 그룹 권한 제거 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt
    ECHO ---------------------------------------------------------------------------------
    ECHO [ W-37 : W-47 : SAM 파일 접근 통제 설정 - 취약 ]
    ECHO 설명 : SAM 파일 접근권한에 Administrator, System 그룹 외 다른 그룹에 권한이 설정되어 있으므로 취약하다.
    ECHO [보안 조치]
    ECHO Step 1^) %systemroot%\system32\config\SAM ^> 속성^> 보안
    ECHO Step 2^) Administrator, System 그룹 외 다른 사용자 및 그룹 권한 제거
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

pause
goto SECURITY

REM -------------------------------------------3. W-48. 화면보호기 설정.
:ACCOUNT_W-48
ECHO [W48] 화면보호기 설정.

setlocal enabledelayedexpansion

set regPath=HKEY_CURRENT_USER\Control Panel\Desktop
set regValue1=ScreenSaveActive
set regValue2=ScreenSaveTimeOut
set regValue3=ScreenSaverIsSecure

for /f "tokens=3" %%a in ('reg query "%regPath%" /v "%regValue1%" ^| findstr "%regValue1%"') do (
    set active=%%a
)

for /f "tokens=3" %%b in ('reg query "%regPath%" /v "%regValue2%" ^| findstr "%regValue2%"') do (
    set timeout=%%b
)

for /f "tokens=3" %%c in ('reg query "%regPath%" /v "%regValue3%" ^| findstr "%regValue3%"') do (
    set secure=%%c
)

reg query "%regPath%" /v "%regValue1%" | findstr "%regValue1%" >NUL
if errorlevel 1 goto badw48

if "%active%"=="1" (
    if !timeout! LEQ 600 (
        if "%secure%"=="1" (
            echo -------------------------------------------------------------------------------- >> good.txt
            echo [ W - 48 화면보호기 설정 - 양호 ] >> good.txt
            echo. >> good.txt
            echo 설명 : 화면 보호기를 설정하고 대기 시간이 10분 이하의 값으로 설정되어 있으며, 화면 보호기 해제를 위한 암호를 사용하므로 양호하다. >> good.txt
            echo. >> good.txt
            echo ※ 화면 보호기의 유무인 HKEY_CURRENT_USER\Control Panel\Deskto\ScreenSaveActive 의 레지스트리 값은 '1'로 설정되어 있으나 제어판 ^> 화면보호기 설정에는 반영되어 있지 않을 수 있으므로 확인 요망 >> good.txt
            echo. >> good.txt
            echo -------------------------------------------------------------------------------- 
            echo [ W - 48 화면보호기 설정 - 양호 ]
            echo.
            echo 설명 : 화면 보호기를 설정하고 대기 시간이 10분 이하의 값으로 설정되어 있으며, 화면 보호기 해제를 위한 암호를 사용하므로 양호하다.
            echo.
            echo ※ 화면 보호기의 유무인 HKEY_CURRENT_USER\Control Panel\Deskto\ScreenSaveActive 의 레지스트리 값은 '1'로 설정되어 있으나 제어판 ^> 화면보호기 설정에는 반영되어 있지 않을 수 있으므로 확인 요망            
            echo. 
            goto end48
        ) else ( 
            goto badw48 
        )
    ) else ( 
        goto badw48 
    )
) else (
    :badw48
    echo ---------------------------------------------------------------------------------- >> bad.txt
    echo [ W - 48 화면보호기 설정 - 취약 ] >> bad.txt
    echo. >> bad.txt
    echo 설명 : 화면 보호기가 설정되지 않았거나 암호를 사용하지 않은 경우 또는, 화면 보호기 대기 시간이 10분을 초과한 값으로 설정되어 있으므로 취약하다. >> bad.txt
    echo. >> bad.txt
    echo [보안 조치] >> bad.txt
    echo ■ Windows NT, 2000 >> bad.txt
    echo [Step 1] 바탕화면 ▶ 등록 정보 ▶ 화면 보호기 ▶ "암호 사용" 체크, 대기 시간 "10분" 설정 >> bad.txt
    echo ■ Windows 2003 >> bad.txt
    echo [Step 1] 바탕화면 ▶ 마우스 우클릭 ▶ 속성 ▶ 디스플레이 등록 정보 ▶ [화면 보호기] ▶ "다시 시작 할 때 암호로 보호" 체크 "대기 시간" 10분 설정 >> bad.txt
    echo ■ Windows 2008, 2012 >> bad.txt
    echo [Step 1] 제어판 ▶ 디스플레이 ▶ 화면보호기 변경 ▶ "다시 시작 할 때 로그온 화면 표시" 체크, "대기 시간" 10분 설정 >> bad.txt
    echo ■ Windows 2016, 2019 >> bad.txt
    echo [Step 1] 바탕화면 ▶ 마우스 우클릭 ▶개인 설정 ▶ 잠금 화면 ▶ 화면 보호기 설정 ▶ "다시 시작 할 때 로그온 화면 표시" 체크, "대기 시간" 10분 설정 >> bad.txt
    echo ----------------------------------------------------------------------------------
    echo [ W - 48 화면보호기 설정 - 취약 ]
    echo.
    echo 설명 : 화면 보호기가 설정되지 않았거나 암호를 사용하지 않은 경우 또는, 화면 보호기 대기 시간이 10분을 초과한 값으로 설정되어 있으므로 취약하다.
    echo.
    echo [보안 조치]
    echo ■ Windows NT, 2000
    echo [Step 1] 바탕화면 ▶ 등록 정보 ▶ 화면 보호기 ▶ "암호 사용" 체크, 대기 시간 "10분" 설정
    echo ■ Windows 2003
    echo [Step 1] 바탕화면 ▶ 마우스 우클릭 ▶ 속성 ▶ 디스플레이 등록 정보 ▶ [화면 보호기] ▶ "다시 시작 할 때 암호로 보호" 체크 "대기 시간" 10분 설정
    echo ■ Windows 2008, 2012
    echo [Step 1] 제어판 ▶ 디스플레이 ▶ 화면보호기 변경 ▶ "다시 시작 할 때 로그온 화면 표시" 체크, "대기 시간" 10분 설정
    echo ■ Windows 2016, 2019
    echo [Step 1] 바탕화면 ▶ 마우스 우클릭 ▶개인 설정 ▶ 잠금 화면 ▶ 화면 보호기 설정 ▶ "다시 시작 할 때 로그온 화면 표시" 체크, "대기 시간" 10분 설정
    exit /b
)

:end48

pause
goto SECURITY

REM -------------------------------------------4. W-49. 로그온 하지 않고 시스템 종료 허용 해제.
:ACCOUNT_W-49
ECHO [W49] 로그온 하지 않고 시스템 종료 허용 해제.

REM 변수 초기화
set "isFTPAccessControlConfigured=0"
set "isAllowedIPConfigured=0"
set "isAccessDeniedConfigured=0"

REM FTP 접근 제어 설정 확인
for %%X in ("FTPAccessControl" "AllowedIP" "AccessDenied") do (
    reg query "HKLM\System\CurrentControlSet\Services\MSFTPSVC\Parameters" /v "AllowAnonymous" | find "0x0" > nul
    if %errorlevel% equ 0 (
        set "is%%XConfigured=1"
    )
)

REM 취약성 평가
if %isFTPAccessControlConfigured% equ 1 (
    if %isAllowedIPConfigured% equ 1 (
        if %isAccessDeniedConfigured% equ 1 (
            ECHO --------------------------------------------------------------------------------- >> good.txt
            ECHO [ W-40 : FTP 접근 제어 설정 - 양호 ] >> good.txt
            ECHO. >> good.txt
            ECHO 설명: DFTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되어있어 양호하다. >> good.txt
            ECHO --------------------------------------------------------------------------------- >> good.txt
            ECHO. >> good.txt
            ECHO. >> good.txt

            ECHO --------------------------------------------------------------------------------- 
            ECHO [ W-40 : FTP 접근 제어 설정 - 양호 ] 
            ECHO. 
            ECHO 설명: DFTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되어있어 양호하다. 
            ECHO --------------------------------------------------------------------------------- 
            ECHO. 
            ECHO. 

        ) else (
            ECHO --------------------------------------------------------------------------------- >> bad.txt
            ECHO. >> bad.txt
            ECHO [ W-40 : FTP 접근 제어 설정 - 취약 ] >> bad.txt
            ECHO. >> bad.txt
            ECHO 설명 : FTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되었지만, 액세스 거부 설정이 누락되어있다. >> bad.txt
            ECHO. >> bad.txt
            ECHO [보안 조치] >> bad.txt
            ECHO. >> bad.txt
            ECHO Step 1: "실행 > INETMGR > 사이트 > 해당 웹페이지 > FTP IP 주소 및 도메인 제한" >> bad.txt
            ECHO Step 2: "[작업]의 허용 항목 추가에서 FTP 접속을 허용할 IP 입력" >> bad.txt
            ECHO Step 3: "[작업]의 지능 설정 편집에서 지정되지 않은 클라이언트에 대한 액세스를 거부 선택" >> bad.txt
						ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
            ECHO --------------------------------------------------------------------------------- >> bad.txt
            ECHO. >> bad.txt
            ECHO. >> bad.txt

            ECHO --------------------------------------------------------------------------------- 
            ECHO. 
            ECHO [ W-40 : FTP 접근 제어 설정 - 취약 ] 
            ECHO. 
            ECHO 설명 : FTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되었지만, 액세스 거부 설정이 누락되어있다. 
            ECHO. 
            ECHO [보안 조치] 
            ECHO. 
            ECHO Step 1: "실행 > INETMGR > 사이트 > 해당 웹페이지 > FTP IP 주소 및 도메인 제한" 
            ECHO Step 2: "[작업]의 허용 항목 추가에서 FTP 접속을 허용할 IP 입력" 
            ECHO Step 3: "[작업]의 지능 설정 편집에서 지정되지 않은 클라이언트에 대한 액세스를 거부 선택" 
						ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
            ECHO --------------------------------------------------------------------------------- 
            ECHO. 
            ECHO. 
        )
    ) else (
        ECHO --------------------------------------------------------------------------------- >> bad.txt
        ECHO. >> bad.txt
        ECHO [ W-40 : FTP 접근 제어 설정 - 취약 ] >> bad.txt
        ECHO. >> bad.txt
        ECHO 설명 : FTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되었지만, 허용 IP 주소가 누락되었다. >> bad.txt
        ECHO. >> bad.txt
        ECHO [보안 조치] >> bad.txt
        ECHO. >> bad.txt
        ECHO Step 1: "실행 > INETMGR > 사이트 > 해당 웹페이지 > FTP IP 주소 및 도메인 제한" >> bad.txt
        ECHO Step 2: "[작업]의 허용 항목 추가에서 FTP 접속을 허용할 IP 입력" >> bad.txt
        ECHO Step 3: "[작업]의 지능 설정 편집에서 지정되지 않은 클라이언트에 대한 액세스를 거부 선택" >> bad.txt
				ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
        ECHO --------------------------------------------------------------------------------- >> bad.txt
        ECHO. >> bad.txt
        ECHO. >> bad.txt

        ECHO --------------------------------------------------------------------------------- 
        ECHO. 
        ECHO [ W-40 : FTP 접근 제어 설정 - 취약 ] 
        ECHO. 
        ECHO 설명 : FTP 서버는 특정 IP 주소에서만 접근 가능하도록 설정되었지만, 허용 IP 주소가 누락되었다. 
        ECHO. 
        ECHO [보안 조치] 
        ECHO. 
        ECHO Step 1: "실행 > INETMGR > 사이트 > 해당 웹페이지 > FTP IP 주소 및 도메인 제한" 
        ECHO Step 2: "[작업]의 허용 항목 추가에서 FTP 접속을 허용할 IP 입력" 
        ECHO Step 3: "[작업]의 지능 설정 편집에서 지정되지 않은 클라이언트에 대한 액세스를 거부 선택" 
				ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
        ECHO --------------------------------------------------------------------------------- 
        ECHO. 
        ECHO. 
    )
) else (
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO [ W-40 : FTP 접근 제어 설정 - 확인필요 ] >> bad.txt
    ECHO. >> bad.txt
    ECHO 설명 : FTP 서버 기능이 활성화 되어 있지 않거나 접근 제어 설정이 구성되지 않아서 이경우 모든 클라이언트가 접근할 수 있음 >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO. >> bad.txt
    ECHO Step 1: "실행 > INETMGR > 사이트 > 해당 웹페이지 > FTP IP 주소 및 도메인 제한" >> bad.txt
    ECHO Step 2: "[작업]의 허용 항목 추가에서 FTP 접속을 허용할 IP 입력" >> bad.txt
    ECHO Step 3: "[작업]의 지능 설정 편집에서 지정되지 않은 클라이언트에 대한 액세스를 거부 선택" >> bad.txt
		ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt
    ECHO. >> bad.txt


    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO [ W-40 : FTP 접근 제어 설정 - 확인필요 ] 
    ECHO. 
    ECHO 설명 : FTP 서버 기능이 활성화 되어 있지 않거나 접근 제어 설정이 구성되지 않아서 이경우 모든 클라이언트가 접근할 수 있음 
    ECHO. 
    ECHO [보안 조치] 
    ECHO. 
    ECHO Step 1: "실행 > INETMGR > 사이트 > 해당 웹페이지 > FTP IP 주소 및 도메인 제한" 
    ECHO Step 2: "[작업]의 허용 항목 추가에서 FTP 접속을 허용할 IP 입력" 
    ECHO Step 3: "[작업]의 기능 설정 편집에서 지정되지 않은 클라이언트에 대한 액세스를 거부 선택" 
		ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
    ECHO. 
)

pause
goto SECURITY

REM -------------------------------------------5. W-50. 원격 시스템에서 강제로 시스템 종료.
:ACCOUNT_W-50
ECHO [W50] 원격 시스템에서 강제로 시스템 종료.

secedit /export /cfg "%temp%\list.txt" | findstr "SeRemoteShutdownPrivilege" >NUL

TYPE "%temp%\list.txt" | find "SeRemoteShutdownPrivilege" > list.txt

setlocal enabledelayedexpansion
set searchString=*S-1-5-32-544
set isGood=true

for /f "tokens=3" %%a in (list.txt) do (
    set value=%%a
    if "!value!" neq "!searchString!" (
        set isGood=false
    )
)

if !isGood! == true (
    echo ------------------------------------------------------------------------- >> good.txt
    echo [ W - 50 원격 시스템에서 강제로 시스템 종료 - 양호] >> good.txt
    echo. >> good.txt
    echo 설명 : "원격 시스템에서 강제로 시스템 종료" 정책에 "Administrators"만 존재하므로 양호하다. >> good.txt
    echo. >> good.txt
    echo ------------------------------------------------------------------------- >> good.txt

    echo ------------------------------------------------------------------------- 
    echo [ W - 50 원격 시스템에서 강제로 시스템 종료 - 양호]
    echo.
    echo 설명 : "원격 시스템에서 강제로 시스템 종료" 정책에 "Administrators"만 존재하는 경우
    echo.
    echo ------------------------------------------------------------------------- 
    
) else (
    echo ------------------------------------------------------------------------- >> bad.txt
    echo [ W - 50 원격 시스템에서 강제로 시스템 종료 - 취약] >> bad.txt
    echo. >> bad.txt
    echo 설명 : "원격 시스템에서 강제로 시스템 종료" 정책에 "Administrators" 외 다른 계정 및 그룹이 존재하므로 취약하다. >> bad.txt
    echo. >> bad.txt
    echo [보안 조치] >> bad.txt
    echo ■ Windows NT, 2000, 2003, 2008, 2012, 2016, 2019 >> bad.txt
    echo [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 로컬 정책 ▶ 사용자 권한 할당 >> bad.txt
    echo [Step 2] "원격 시스템에서 강제로 시스템 종료" 정책에 Administrators 외 다른 계정 및 그룹 제거 >> bad.txt
    echo . >> bad.txt
    echo ------------------------------------------------------------------------- >> bad.txt

    echo -------------------------------------------------------------------------
    echo [ W - 50 원격 시스템에서 강제로 시스템 종료 - 취약]
    echo.
    echo 설명 : "원격 시스템에서 강제로 시스템 종료" 정책에 "Administrators" 외 다른 계정 및 그룹이 존재하므로 취약하다.
    echo.
    echo [보안 조치]
    echo ■ Windows NT, 2000, 2003, 2008, 2012, 2016, 2019
    echo [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 로컬 정책 ▶ 사용자 권한 할당
    echo [Step 2] "원격 시스템에서 강제로 시스템 종료" 정책에 Administrators 외 다른 계정 및 그룹 제거
    echo.
    echo -------------------------------------------------------------------------
)

del list.txt

pause
goto SECURITY


echo ****************************************************************************************************
echo           계정 관리 보안 점검 리스트가 종료 되었습니다.
echo ****************************************************************************************************