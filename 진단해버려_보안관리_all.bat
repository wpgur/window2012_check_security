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




REM -------------------------------------------4. W-49. 로그온 하지 않고 시스템 종료 허용 해제.
:ACCOUNT_W-49
ECHO [W49] 로그온 하지 않고 시스템 종료 허용 해제.

set regPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
set regValue=ShutdownWithoutLogon

for /f "tokens=3" %%i in ('reg query "%regPath%" /v "%regValue%" ^| findstr "%regValue%"') do (
    set shutdownValue=%%i
)

if "%shutdownValue%"=="0" (
    echo -------------------------------------------------------------------------------- >> good.txt
    echo [ W - 49 로그온 하지 않고 시스템 종료 허용 해제 - 양호 ] >> good.txt
    echo. >> good.txt
    echo 설명 : "로그온 하지 않고 시스템 종료 허용"이 "사용 안 함"으로 설정되어 있어 양호하다. >> good.txt
    echo. >> good.txt
    echo --------------------------------------------------------------------------------
    echo [ W - 49 로그온 하지 않고 시스템 종료 허용 해제 - 양호 ]
    echo. 
    echo 설명 : "로그온 하지 않고 시스템 종료 허용"이 "사용 안 함"으로 설정되어 있어 양호하다. 
    echo. 
) else (
    echo ---------------------------------------------------------------------------------- >> bad.txt
    echo [ W = 49 로그온 하지 않고 시스템 종료 허용 해제 - 취약 ] >> bad.txt
    echo. >> bad.txt
    echo 설명 : "로그온 하지 않고 시스템 종료 허용"이 "사용"으로 설정되어 있어 취약하다. >> bad.txt
    echo. >> bad.txt
    echo [보안 조치] >> bad.txt
    echo ■ Windows NT  >> bad.txt
    echo [Step 1] HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\ShutdownWithoutLogon = 0  >> bad.txt
    echo ■ Windows 2000  >> bad.txt
    echo [Step 1] 시작 ▶ 실행 SECPOL.MSC ▶ 로컬 정책 ▶ 보안 옵션  >> bad.txt
    echo [Step 2] "로그온 하지 않고 시스템 종료 허용"을 "사용 안 함"으로 설정  >> bad.txt
    echo ■ Windows 2003, 2008, 2012, 2016, 2019  >> bad.txt
    echo [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 로컬 정책 ▶ 보안 옵션  >> bad.txt
    echo [Step 2] "시스템 종료: 로그온 하지 않고 시스템 종료 허용"을 "사용 안 함"으로 설정  >> bad.txt
	ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
    echo ----------------------------------------------------------------------------------
    echo [ W = 49 로그온 하지 않고 시스템 종료 허용 해제 - 취약 ]
    echo.
    echo 설명 : "로그온 하지 않고 시스템 종료 허용"이 "사용"으로 설정되어 있어 취약하다.
    echo.
    echo [보안 조치]
    echo ■ Windows NT
    echo [Step 1] HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\ShutdownWithoutLogon = 0
    echo ■ Windows 2000
    echo [Step 1] 시작 ▶ 실행 SECPOL.MSC ▶ 로컬 정책 ▶ 보안 옵션
    echo [Step 2] "로그온 하지 않고 시스템 종료 허용"을 "사용 안 함"으로 설정
    echo ■ Windows 2003, 2008, 2012, 2016, 2019
    echo [Step 1] 시작 ▶ 실행 ▶ SECPOL.MSC ▶ 로컬 정책 ▶ 보안 옵션
    echo [Step 2] "시스템 종료: 로그온 하지 않고 시스템 종료 허용"을 "사용 안 함"으로 설정
	ECHO ※ 이후 레지스트리 값이 변경되지 않을 수 있으므로 레지스트리 값도 설정 값과 맞는지 확인 필요 >> bad.txt
)




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




 
 





echo ****************************************************************************************************
echo           계정 관리 보안 점검 리스트가 종료 되었습니다.
echo ****************************************************************************************************