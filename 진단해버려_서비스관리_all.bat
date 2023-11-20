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





REM -------------------------------------------1. W-19. 공유 권한 및 사용자 그룹 설정.
:ACCOUNT_W-19
ECHO [W19] 공유 권한 및 사용자 그룹 설정.

ECHO --------------------------------------------------------------------------------- >> check.txt
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
ECHO [Step 2] 시작 ▶ 실행 ▶ regedit ▶ HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer "(값 0)" >> bad.txt
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
ECHO [Step 2] 시작 ▶ 실행 ▶ regedit ▶ HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer -^> 값 0
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

del secpol.txt



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




REM -------------------------------------------11. W-29. IIS 파일 업로드 및 다운로드 제한.   
:ACCOUNT_W-29
ECHO [W29] IIS 파일 업로드 및 다운로드 제한.

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
    ECHO Step 1: 인터넷 정보 서비스[IIS] 관리자 ^> 서버 선택 ^> IIS ^> "ISAPI 및 CGI 제한" 선택, WebDAV 사용여부 확인 >> bad.txt
    ECHO Step 2: 인터넷 정보 서비스[IIS] 관리자 ^> 서버 선택 ^> IIS ^> "ISAPI 및 CGI 제한" 선택 WebDAV 항목 선 택 ^> [작업]에서 제거하거나 편집 ^> "확장 경로 실행 허용(A)" 체크 해제 >> bad.txt
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
    ECHO Step 1: 인터넷 정보 서비스[IIS] 관리자 ^> 서버 선택 ^> IIS ^> "ISAPI 및 CGI 제한" 선택, WebDAV 사용여부 확인 
    ECHO Step 2: 인터넷 정보 서비스[IIS] 관리자 ^> 서버 선택 ^> IIS ^> "ISAPI 및 CGI 제한" 선택 WebDAV 항목 선 택 ^> [작업]에서 제거하거나 편집 ^> "확장 경로 실행 허용(A)" 체크 해제 
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




REM -------------------------------------------20. W-38. FTP 디렉터리 접근권한 설정.
:ACCOUNT_W-38
ECHO [W38] FTP 디렉터리 접근권한 설정.

%SystemRoot%\System32\inetsrv\appcmd.exe list config "web" -section:system.ftpServer/security/authorization | findstr /i "*" > nul

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
    ECHO. >> bad.txt
    ECHO 설명 : FTP 홈 디렉토리에 Everyone 권한이 있어 취약하다. >> bad.txt
    ECHO. >> bad.txt
    ECHO [보안 조치] >> bad.txt
    ECHO - Windows NT^(IIS 4.0^), 2000^(IIS 5.0^), 2003^(IIS 6.0^) >> bad.txt
    ECHO Step 1: 인터넷 정보 서비스^(IIS^) 관리 ^> FTP 사이트 ^> 해당 FTP 사이트 ^> 속성 ^> [홈 디렉토리] 탭에서 FTP 홈 디렉토리 확인 >> bad.txt
    ECHO Step 2: 탐색기 ^> 홈 디렉토리 ^> 속성 ^> [보안] 탭에서 Everyone 권한 제거>> bad.txt
    ECHO. >> bad.txt
    ECHO - Windows 2008^(IIS 7.0^), 2012^(IIS 8.0^) >> bad.txt
    ECHO Step 1: 제어판 ^> 관리도구 ^> 인터넷 정보 서비스^(IIS^) 관리 ^> 해당 웹사이트 ^> 마우스 우클릭 ^> FTP 게시 추가  >> bad.txt
    ECHO Step 2: 이후 진행 과정에서 권한 부여 화면의 액세스 허용 대상 선정 시 [지정한 사용자]만 선택  >> bad.txt
    ECHO --------------------------------------------------------------------------------- >> bad.txt
    ECHO. >> bad.txt

    ECHO --------------------------------------------------------------------------------- 
    ECHO [ W-38 : FTP 디렉터리 접근권한 설정 - 취약 ] 
    ECHO. 
    ECHO 설명 : FTP 홈 디렉토리에 Everyone 권한이 있어 취약하다. 
    ECHO. 
    ECHO [보안 조치] 
    ECHO - Windows NT^(IIS 4.0^), 2000^(IIS 5.0^), 2003^(IIS 6.0^) 
    ECHO Step 1: 인터넷 정보 서비스^(IIS^) 관리 ^> FTP 사이트 ^> 해당 FTP 사이트 ^> 속성 ^> [홈 디렉토리] 탭에서 FTP 홈 디렉토리 확인 
    ECHO Step 2: 탐색기 ^> 홈 디렉토리 ^> 속성 ^> [보안] 탭에서 Everyone 권한 제거
    ECHO. 
    ECHO - Windows 2008^(IIS 7.0^), 2012^(IIS 8.0^) 
    ECHO Step 1: 제어판 ^> 관리도구 ^> 인터넷 정보 서비스^(IIS^) 관리 ^> 해당 웹사이트 ^> 마우스 우클릭 ^> FTP 게시 추가  
    ECHO Step 2: 이후 진행 과정에서 권한 부여 화면의 액세스 허용 대상 선정 시 [지정한 사용자]만 선택  
    ECHO --------------------------------------------------------------------------------- 
    ECHO. 
)





REM -------------------------------------------21. W-39. Anonymous FTP 금지.
:ACCOUNT_W-39
ECHO [W39] Anonymous FTP 금지.

%SystemRoot%\System32\inetsrv\appcmd.exe list config "web" -section:system.applicationHost/sites | findstr /i /C:"anonymousAuthentication enabled" | find /i "false"
if %errorlevel% EQU 0 (
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
) else (
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
    ECHO Step 1: 제어판 ^> 관리도구 ^>인터넷 정보 서비스 관리 ^> 해당 웹사이트 ^> 마우스 우클릭 ^>FTP 게시 추가
    ECHO Step 2: 이후 진행 과정에서 인증 화면의 익명 체크 박스 해제
    ECHO ---------------------------------------------------------------------------------
    ECHO.
    ECHO.
)

ECHO.




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
            ECHO --------------------------------------------------------------------------------- 
            ECHO. 
            ECHO. 
)





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




 
 





echo ****************************************************************************************************
echo           계정 관리 보안 점검 리스트가 종료 되었습니다.
echo ****************************************************************************************************