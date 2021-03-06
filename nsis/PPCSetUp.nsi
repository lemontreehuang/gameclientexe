; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines

!define PRODUCT_NAME "开源车行"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "opensource, Inc."
!define PRODUCT_WEB_SITE "https://github.com/getouthh"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\ppc.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------


!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "MUI.nsh"
; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME

;!insertmacro MUI_PAGE_COMPONENTS
Page Custom PageEnter PageLeave
Var dialog
Var editcontrol
Var label
Var hwnd
Var Appname
!define MUI_PAGE_CUSTOMFUNCTION_Pre DirectoryEnter
 !define MUI_PAGE_CUSTOMFUNCTION_LEAVE "DirectoryLeave"

; Directory page
!insertmacro MUI_PAGE_DIRECTORY

; Instfiles page
!insertmacro MUI_PAGE_INSTFILES

; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\ppc.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files

!insertmacro MUI_LANGUAGE "SimpChinese"
; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "OpenPPcSetup.exe"
InstallDir "$PROGRAMFILES\车行"
;InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite on
  SetOutPath "$INSTDIR\face"
  File /r "..\Release\game\ppc\face\*.*"
  SetOutPath "$INSTDIR\res"
  File /r "..\Release\game\ppc\res\*.*"
  SetOutPath "$INSTDIR\resource"
  File /r "..\Release\game\ppc\resource\*.*"
  SetOutPath "$INSTDIR"
  File "..\Release\game\ppc\ppc.exe"
  File "..\Release\game\ppc\ChannelModule.dll"
  File "..\Release\game\ppc\ChatComm.dll"
  File "..\Release\game\ppc\ClientShare.dll"
  File "..\Release\game\ppc\Companion.dll"
  File "..\Release\game\ppc\ComService.dll"
  File "..\Release\game\ppc\DownLoad.dll"
  File "..\Release\game\ppc\GameFrame.dll"
  File "..\Release\game\ppc\GameRank.dll"
  File "..\Release\game\ppc\PropertyModule.dll"
  File "..\Release\game\ppc\SkinControls.dll"
  File "..\Release\game\ppc\SkinResource.dll"
  File "..\Release\game\ppc\SocketModule.dll"
  File "..\Release\game\ppc\sqlite3.dll"
  File "..\Release\game\ppc\sub.exe"
  File "..\Release\game\ppc\UserFace.dll"
  File "..\Release\game\ppc\VideoService.dll"
   File "..\Release\game\ppc\zipd.dll"
  File "..\Release\game\ppc\mfc100.dll"
  File "..\Release\game\ppc\msvcp100.dll"
  File "..\Release\game\ppc\msvcr100.dll"
  CreateDirectory "$SMPROGRAMS\$Appname车行"
  CreateShortCut "$SMPROGRAMS\$Appname车行.lnk" "$INSTDIR\ppc.exe"
  CreateShortCut "$DESKTOP\$Appname车行.lnk" "$INSTDIR\ppc.exe"
  WriteINIStr $INSTDIR\info.ini info appname $Appname
  WriteINIStr $INSTDIR\info.ini info setupappname $Appname
SectionEnd

Section -AdditionalIcons
 ; WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
 ; CreateShortCut "$SMPROGRAMS\车行\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$Appname车行\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\ppc.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\ppc.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function .onInit
  
FunctionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) 已成功地从你的计算机移除。"
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "你确实要完全移除 $(^Name) ，其及所有的组件？" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\ppc.exe"
  Delete "$INSTDIR\ppc.db"

 Delete "$INSTDIR\ppc.exe"
  Delete "$INSTDIR\ChannelModule.dll"
  Delete "$INSTDIR\ChatComm.dll"
  Delete "$INSTDIR\ClientShare.dll"
  Delete "$INSTDIR\Companion.dll"
  Delete "$INSTDIR\ComService.dll"
  Delete "$INSTDIR\DownLoad.dll"
  Delete "$INSTDIR\GameFrame.dll"
  Delete "$INSTDIR\GameRank.dll"
  Delete "$INSTDIR\glib-2-vs10.dll"
  Delete "$INSTDIR\gobject-2-vs10.dll"
  Delete "$INSTDIR\gthread-2-vs10.dll"
  Delete "$INSTDIR\icudt.dll"
  Delete "$INSTDIR\icudtl.dat"
  Delete "$INSTDIR\libintl.dll"
  Delete "$INSTDIR\oren.dll"
  Delete "$INSTDIR\PropertyModule.dll"
  Delete "$INSTDIR\SkinControls.dll"
  Delete "$INSTDIR\SkinResource.dll"
  Delete "$INSTDIR\SocketModule.dll"
  Delete "$INSTDIR\sqlite3.dll"
  Delete "$INSTDIR\sub.exe"
  Delete "$INSTDIR\UserFace.dll"
  Delete "$INSTDIR\VideoService.dll"
   Delete "$INSTDIR\zipd.dll"
Delete "$INSTDIR\mfc100.dll"
  Delete "$INSTDIR\msvcp100.dll"
  Delete "$INSTDIR\msvcr100.dll"
   ReadINIStr $0 $INSTDIR\info.ini info setupappname
   strcmp $0 "" +5 0
  Delete "$SMPROGRAMS\$0车行\Uninstall.lnk"
  Delete "$SMPROGRAMS\$0车行\Website.lnk"
  Delete "$DESKTOP\$0车行.lnk"
  Delete "$SMPROGRAMS\$0车行.lnk"

  RMDir "$SMPROGRAMS\$0车行"
  RMDir "$INSTDIR"


  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd




Function PageInitFunc
  ;StrCmp $SHOW_PAGE "show" 0 +2 # 如果没有设置“show”则跳过下面的页面显示
FunctionEnd
Function PageEnter       ;这是一个函数的定义，这个函数名字是test，这个函数是为了生成一个页面，页面里面可以自定义控件，就如同MFC里面的控件一样
    nsDialogs::Create 1018
    Pop $dialog                         ;创建一个对话框后会返回这个对话框的HWND（同句柄）到堆栈，这个HWND必须保存到某个自定义变量中去，否则会被覆盖掉，
                                        ;  这个HWND可以保存在自定义变量中，为了以后对该控件进行其它操作。
    ${NSD_CreateText} 30% 20% 30% 8% $Appname
        Pop $editcontrol                                 ;同样创建一个控件也会返回一个HWND到堆栈中，可以保存到自定义变量中去，我就是把这个文本控件的返回值
        ${NSD_OnChange} $editcontrol editchanged         ;从堆栈中Pop到自定义变量，本例中是将其转存在hwnd这个自定义变量中去。
     ${NSD_CreateLabel} 0 10% 100% 12u "请给程序起个桌面快捷名字,方便桌面查找"
                        Pop $Label
    ;${NSD_CreateLabel} 0% 12% 100% 70% "Testing"
        ;Pop $label

    nsDialogs::Show
FunctionEnd

Function editchanged
    Pop $hwnd                        ;将文本编辑控件的HWND保存到$hwnd这个变量中去。
    ${NSD_GetText} $hwnd $0          ;调用GetText函数获取该控件的输入内容，并保存到$0这个系统变量中去。
    StrCpy $Appname $0               ;我直接对$0系统变量进行其他操作，会出现系统错误，所以我把$0这个系统变量中的值保存到一个自定义变量$User中去，这个
    StrCpy $Appname "$Appname"
    WriteINIStr $TEMP\openppcinfo.ini info setupappname $Appname
FunctionEnd                          ;在上面修改XML文件是就用到了这个变量来获取控件的输入内容。



Function PageLeave
strcmp $Appname "" +1 +3
 MessageBox MB_OK "请输入合适快捷名字"
 abort
FunctionEnd

Function DirectoryLeave
  IfFileExists "$INSTDIR\*.*" 0 End
    MessageBox MB_OK|MB_ICONEXCLAMATION "$INSTDIR 目录里有文件存在,为了方便管理,请选择一个空目录安装"
    Abort
  End:
FunctionEnd


Function DirectoryEnter
  ReadINIStr $0 $TEMP\openppcinfo.ini info setupappname
  StrCpy $INSTDIR "$PROGRAMFILES\$0车行"
FunctionEnd

