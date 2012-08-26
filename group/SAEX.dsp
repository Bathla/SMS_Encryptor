# Microsoft Developer Studio Project File - Name="SAEX" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=SAEX - Win32 Uni Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "SAEX.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "SAEX.mak" CFG="SAEX - Win32 Uni Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "SAEX - Win32 Uni Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "SAEX - Win32 Uni Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "SAEX - Win32 Uni Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Win32_Un"
# PROP BASE Intermediate_Dir ".\Win32_Un"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL"
# PROP Intermediate_Dir "\Symbian\6.1\Series60\EPOC32\BUILD\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX\WINS\UREL"
# ADD CPP /nologo /Zp4 /MD /W4 /O1 /Op /X /I "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\INC" /I "\Symbian\6.1\Series60\EPOC32\INCLUDE" /D "__SYMBIAN32__" /D "__VC32__" /D "__WINS__" /D "__AVKON_ELAF__" /D "__DLL__" /D "NDEBUG" /D "_UNICODE" /GF /c
# ADD MTL /nologo /mktyplib203 /D /win32
# ADD BASE RSC /l 0x809
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /machine:IX86
# ADD LINK32 "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL\EDLL.LIB" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\euser.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\avkon.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\bafl.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\apparc.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\cone.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\eikcore.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\MSGS.LIB" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\CHARCONV.LIB" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\IMUT.LIB" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\send.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\sendui.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\etext.lib" "\Symbian\6.1\Series60\EPOC32\BUILD\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX\WINS\UREL\SAEX.exp" /nologo /entry:"_E32Dll" /subsystem:windows /dll /machine:IX86 /nodefaultlib /include:"?_E32Dll@@YGHPAXI0@Z" /out:"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL\Z\SYSTEM\APPS\SAEX\SAEX.APP" /WARN:3
# Begin Special Build Tool
SOURCE="$(InputPath)"
PreLink_Cmds=echo Doing first-stage link by name 	nmake -nologo -f "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX.SUP.MAKE" PRELINKUREL 	if errorlevel 1 nmake -nologo -f "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX.SUP.MAKE" STOPLINKUREL
PostBuild_Cmds=nmake -nologo -f "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX.SUP.MAKE" POSTBUILDUREL
# End Special Build Tool

!ELSEIF  "$(CFG)" == "SAEX - Win32 Uni Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Win32_U0"
# PROP BASE Intermediate_Dir ".\Win32_U0"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB"
# PROP Intermediate_Dir "\Symbian\6.1\Series60\EPOC32\BUILD\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX\WINS\UDEB"
# PROP Ignore_Export_Lib 0
# ADD CPP /nologo /Zp4 /MDd /W4 /Zi /Od /X /I "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\INC" /I "\Symbian\6.1\Series60\EPOC32\INCLUDE" /D "__SYMBIAN32__" /D "__VC32__" /D "__WINS__" /D "__AVKON_ELAF__" /D "__DLL__" /D "_DEBUG" /D "_UNICODE" /FR /Fd"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SAEX.PDB" /GF /c
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x809
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /machine:IX86
# ADD LINK32 "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\EDLL.LIB" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\euser.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\avkon.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\bafl.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\apparc.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\cone.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\eikcore.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\MSGS.LIB" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\imut.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\CHARCONV.LIB" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\send.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\sendui.lib" "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\etext.lib" "\Symbian\6.1\Series60\EPOC32\BUILD\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX\WINS\UDEB\SAEX.exp" /nologo /entry:"_E32Dll" /subsystem:windows /dll /pdb:"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SAEX.pdb" /debug /machine:IX86 /nodefaultlib /include:"?_E32Dll@@YGHPAXI0@Z" /out:"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SecureSend.APP" /WARN:3
# SUBTRACT LINK32 /pdb:none
# Begin Special Build Tool
SOURCE="$(InputPath)"
PreLink_Cmds=echo Doing first-stage link by name 	nmake -nologo -f "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX.SUP.MAKE" PRELINKUDEB 	if errorlevel 1 nmake -nologo -f "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX.SUP.MAKE" STOPLINKUDEB
PostBuild_Cmds=nmake -nologo -f "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX.SUP.MAKE" POSTBUILDUDEB
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "SAEX - Win32 Uni Release"
# Name "SAEX - Win32 Uni Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\Saex.cpp
DEP_CPP_SAEX_=\
	"..\..\..\EPOC32\INCLUDE\aknappui.h"\
	"..\..\..\EPOC32\INCLUDE\aknDialog.h"\
	"..\..\..\EPOC32\INCLUDE\aknform.h"\
	"..\..\..\EPOC32\INCLUDE\aknintermediate.h"\
	"..\..\..\EPOC32\INCLUDE\aknlayout.lag"\
	"..\..\..\EPOC32\INCLUDE\AknLayoutDef.h"\
	"..\..\..\EPOC32\INCLUDE\aknlistquerycontrol.h"\
	"..\..\..\EPOC32\INCLUDE\aknlistquerydialog.h"\
	"..\..\..\EPOC32\INCLUDE\aknmultilinequerycontrol.h"\
	"..\..\..\EPOC32\INCLUDE\aknnumed.h"\
	"..\..\..\EPOC32\INCLUDE\aknnumedwin.h"\
	"..\..\..\EPOC32\INCLUDE\aknnumseced.h"\
	"..\..\..\EPOC32\INCLUDE\aknPanic.h"\
	"..\..\..\EPOC32\INCLUDE\aknpopup.h"\
	"..\..\..\EPOC32\INCLUDE\aknpopupfader.h"\
	"..\..\..\EPOC32\INCLUDE\aknpopupheadingpane.h"\
	"..\..\..\EPOC32\INCLUDE\aknpopuplayout.h"\
	"..\..\..\EPOC32\INCLUDE\aknquerycontrol.h"\
	"..\..\..\EPOC32\INCLUDE\aknquerydata.h"\
	"..\..\..\EPOC32\INCLUDE\AknQueryDialog.h"\
	"..\..\..\EPOC32\INCLUDE\aknscbut.h"\
	"..\..\..\EPOC32\INCLUDE\aknscrlb.h"\
	"..\..\..\EPOC32\INCLUDE\aknutils.h"\
	"..\..\..\EPOC32\INCLUDE\aknview.h"\
	"..\..\..\EPOC32\INCLUDE\aknviewappui.h"\
	"..\..\..\EPOC32\INCLUDE\AknWsEventObserver.h"\
	"..\..\..\EPOC32\INCLUDE\apacmdln.h"\
	"..\..\..\EPOC32\INCLUDE\apadef.h"\
	"..\..\..\EPOC32\INCLUDE\apaflrec.h"\
	"..\..\..\EPOC32\INCLUDE\apaid.h"\
	"..\..\..\EPOC32\INCLUDE\apgtask.h"\
	"..\..\..\EPOC32\INCLUDE\apparc.h"\
	"..\..\..\EPOC32\INCLUDE\avkon.hrh"\
	"..\..\..\EPOC32\INCLUDE\avkon.rsg"\
	"..\..\..\EPOC32\INCLUDE\badesca.h"\
	"..\..\..\EPOC32\INCLUDE\baerrhan.h"\
	"..\..\..\EPOC32\INCLUDE\bamdesca.h"\
	"..\..\..\EPOC32\INCLUDE\barsc.h"\
	"..\..\..\EPOC32\INCLUDE\basched.h"\
	"..\..\..\EPOC32\INCLUDE\bitbase.h"\
	"..\..\..\EPOC32\INCLUDE\bitdev.h"\
	"..\..\..\EPOC32\INCLUDE\bitdev.inl"\
	"..\..\..\EPOC32\INCLUDE\bitmap.h"\
	"..\..\..\EPOC32\INCLUDE\bitstd.h"\
	"..\..\..\EPOC32\INCLUDE\bldvariant.hrh"\
	"..\..\..\EPOC32\INCLUDE\charconv.h"\
	"..\..\..\EPOC32\INCLUDE\coeaui.h"\
	"..\..\..\EPOC32\INCLUDE\coeauib.h"\
	"..\..\..\EPOC32\INCLUDE\coeccntx.h"\
	"..\..\..\EPOC32\INCLUDE\coecntrl.h"\
	"..\..\..\EPOC32\INCLUDE\coecobs.h"\
	"..\..\..\EPOC32\INCLUDE\coedef.h"\
	"..\..\..\EPOC32\INCLUDE\coehelp.h"\
	"..\..\..\EPOC32\INCLUDE\coeinput.h"\
	"..\..\..\EPOC32\INCLUDE\coemain.h"\
	"..\..\..\EPOC32\INCLUDE\coemop.h"\
	"..\..\..\EPOC32\INCLUDE\coeview.h"\
	"..\..\..\EPOC32\INCLUDE\e32base.h"\
	"..\..\..\EPOC32\INCLUDE\e32base.inl"\
	"..\..\..\EPOC32\INCLUDE\e32def.h"\
	"..\..\..\EPOC32\INCLUDE\e32des16.h"\
	"..\..\..\EPOC32\INCLUDE\e32des8.h"\
	"..\..\..\EPOC32\INCLUDE\e32hal.h"\
	"..\..\..\EPOC32\INCLUDE\e32keys.h"\
	"..\..\..\EPOC32\INCLUDE\e32pccd.h"\
	"..\..\..\EPOC32\INCLUDE\e32std.h"\
	"..\..\..\EPOC32\INCLUDE\e32std.inl"\
	"..\..\..\EPOC32\INCLUDE\e32svr.h"\
	"..\..\..\EPOC32\INCLUDE\eikalign.h"\
	"..\..\..\EPOC32\INCLUDE\eikamnt.h"\
	"..\..\..\EPOC32\INCLUDE\eikapp.h"\
	"..\..\..\EPOC32\INCLUDE\eikappui.h"\
	"..\..\..\EPOC32\INCLUDE\eikaufty.h"\
	"..\..\..\EPOC32\INCLUDE\eikbctrl.h"\
	"..\..\..\EPOC32\INCLUDE\eikbtgpc.h"\
	"..\..\..\EPOC32\INCLUDE\eikbtgrp.h"\
	"..\..\..\EPOC32\INCLUDE\eikbutb.h"\
	"..\..\..\EPOC32\INCLUDE\eikcal.h"\
	"..\..\..\EPOC32\INCLUDE\eikcba.h"\
	"..\..\..\EPOC32\INCLUDE\eikccpu.h"\
	"..\..\..\EPOC32\INCLUDE\eikcmbut.h"\
	"..\..\..\EPOC32\INCLUDE\eikcmobs.h"\
	"..\..\..\EPOC32\INCLUDE\eikcolor.hrh"\
	"..\..\..\EPOC32\INCLUDE\eikctgrp.h"\
	"..\..\..\EPOC32\INCLUDE\eikdef.h"\
	"..\..\..\EPOC32\INCLUDE\eikdgfty.h"\
	"..\..\..\EPOC32\INCLUDE\eikdialg.h"\
	"..\..\..\EPOC32\INCLUDE\eikdoc.h"\
	"..\..\..\EPOC32\INCLUDE\eikdpobs.h"\
	"..\..\..\EPOC32\INCLUDE\eikedwin.h"\
	"..\..\..\EPOC32\INCLUDE\eikedwob.h"\
	"..\..\..\EPOC32\INCLUDE\eikenv.h"\
	"..\..\..\EPOC32\INCLUDE\eikfctry.h"\
	"..\..\..\EPOC32\INCLUDE\eikfpne.h"\
	"..\..\..\EPOC32\INCLUDE\eikimage.h"\
	"..\..\..\EPOC32\INCLUDE\eiklay.h"\
	"..\..\..\EPOC32\INCLUDE\eiklbed.h"\
	"..\..\..\EPOC32\INCLUDE\eiklbm.h"\
	"..\..\..\EPOC32\INCLUDE\eiklbo.h"\
	"..\..\..\EPOC32\INCLUDE\eiklbv.h"\
	"..\..\..\EPOC32\INCLUDE\eiklbx.h"\
	"..\..\..\EPOC32\INCLUDE\eiklibry.h"\
	"..\..\..\EPOC32\INCLUDE\eikmfne.h"\
	"..\..\..\EPOC32\INCLUDE\eikmobs.h"\
	"..\..\..\EPOC32\INCLUDE\eiksbfrm.h"\
	"..\..\..\EPOC32\INCLUDE\eiksbobs.h"\
	"..\..\..\EPOC32\INCLUDE\eikscbut.h"\
	"..\..\..\EPOC32\INCLUDE\eikscrlb.h"\
	"..\..\..\EPOC32\INCLUDE\eikseced.h"\
	"..\..\..\EPOC32\INCLUDE\Eikspane.h"\
	"..\..\..\EPOC32\INCLUDE\eikspmod.h"\
	"..\..\..\EPOC32\INCLUDE\eiksrv.h"\
	"..\..\..\EPOC32\INCLUDE\eiksrv.pan"\
	"..\..\..\EPOC32\INCLUDE\eiksrvc.h"\
	"..\..\..\EPOC32\INCLUDE\eiksrvs.h"\
	"..\..\..\EPOC32\INCLUDE\eiktxlbm.h"\
	"..\..\..\EPOC32\INCLUDE\eiktxlbx.h"\
	"..\..\..\EPOC32\INCLUDE\eikunder.h"\
	"..\..\..\EPOC32\INCLUDE\eikvcurs.h"\
	"..\..\..\EPOC32\INCLUDE\f32file.h"\
	"..\..\..\EPOC32\INCLUDE\f32file.inl"\
	"..\..\..\EPOC32\INCLUDE\fbs.h"\
	"..\..\..\EPOC32\INCLUDE\fepbase.h"\
	"..\..\..\EPOC32\INCLUDE\fldbase.h"\
	"..\..\..\EPOC32\INCLUDE\fldbltin.h"\
	"..\..\..\EPOC32\INCLUDE\fldinfo.h"\
	"..\..\..\EPOC32\INCLUDE\fldset.h"\
	"..\..\..\EPOC32\INCLUDE\flogger.h"\
	"..\..\..\EPOC32\INCLUDE\flogger.inl"\
	"..\..\..\EPOC32\INCLUDE\fntstore.h"\
	"..\..\..\EPOC32\INCLUDE\frmframe.h"\
	"..\..\..\EPOC32\INCLUDE\frmlaydt.h"\
	"..\..\..\EPOC32\INCLUDE\frmparam.h"\
	"..\..\..\EPOC32\INCLUDE\frmtlay.h"\
	"..\..\..\EPOC32\INCLUDE\frmtview.h"\
	"..\..\..\EPOC32\INCLUDE\frmvis.h"\
	"..\..\..\EPOC32\INCLUDE\gdi.h"\
	"..\..\..\EPOC32\INCLUDE\gdi.inl"\
	"..\..\..\EPOC32\INCLUDE\gulalign.h"\
	"..\..\..\EPOC32\INCLUDE\gulbordr.h"\
	"..\..\..\EPOC32\INCLUDE\gulcolor.h"\
	"..\..\..\EPOC32\INCLUDE\guldef.h"\
	"..\..\..\EPOC32\INCLUDE\gulftflg.hrh"\
	"..\..\..\EPOC32\INCLUDE\gulicon.h"\
	"..\..\..\EPOC32\INCLUDE\gulutil.h"\
	"..\..\..\EPOC32\INCLUDE\imcvcodc.h"\
	"..\..\..\EPOC32\INCLUDE\imcvcodc.inl"\
	"..\..\..\EPOC32\INCLUDE\imcvdata.h"\
	"..\..\..\EPOC32\INCLUDE\imcvtext.h"\
	"..\..\..\EPOC32\INCLUDE\imutdll.h"\
	"..\..\..\EPOC32\INCLUDE\lafmain.h"\
	"..\..\..\EPOC32\INCLUDE\lafpublc.h"\
	"..\..\..\EPOC32\INCLUDE\mclient.h"\
	"..\..\..\EPOC32\INCLUDE\medobsrv.h"\
	"..\..\..\EPOC32\INCLUDE\mentact.h"\
	"..\..\..\EPOC32\INCLUDE\miutatch.h"\
	"..\..\..\EPOC32\INCLUDE\miutconv.h"\
	"..\..\..\EPOC32\INCLUDE\miuthdr.h"\
	"..\..\..\EPOC32\INCLUDE\miuthdr.inl"\
	"..\..\..\EPOC32\INCLUDE\miutset.h"\
	"..\..\..\EPOC32\INCLUDE\MIUTSTD.HRH"\
	"..\..\..\EPOC32\INCLUDE\mmsconst.h"\
	"..\..\..\EPOC32\INCLUDE\mparser.h"\
	"..\..\..\EPOC32\INCLUDE\msvapi.h"\
	"..\..\..\EPOC32\INCLUDE\msvapi.inl"\
	"..\..\..\EPOC32\INCLUDE\msvarray.h"\
	"..\..\..\EPOC32\INCLUDE\msvids.h"\
	"..\..\..\EPOC32\INCLUDE\msvipc.h"\
	"..\..\..\EPOC32\INCLUDE\msvipc.inl"\
	"..\..\..\EPOC32\INCLUDE\msvreg.h"\
	"..\..\..\EPOC32\INCLUDE\msvreg.inl"\
	"..\..\..\EPOC32\INCLUDE\msvstd.h"\
	"..\..\..\EPOC32\INCLUDE\msvstd.hrh"\
	"..\..\..\EPOC32\INCLUDE\msvstd.inl"\
	"..\..\..\EPOC32\INCLUDE\msvstore.h"\
	"..\..\..\EPOC32\INCLUDE\msvuids.h"\
	"..\..\..\EPOC32\INCLUDE\mtclbase.h"\
	"..\..\..\EPOC32\INCLUDE\mtclbase.inl"\
	"..\..\..\EPOC32\INCLUDE\mtclreg.h"\
	"..\..\..\EPOC32\INCLUDE\mtmdef.hrh"\
	"..\..\..\EPOC32\INCLUDE\mtmuids.h"\
	"..\..\..\EPOC32\INCLUDE\openfont.h"\
	"..\..\..\EPOC32\INCLUDE\POP3CMDS.H"\
	"..\..\..\EPOC32\INCLUDE\s32buf.h"\
	"..\..\..\EPOC32\INCLUDE\s32buf.inl"\
	"..\..\..\EPOC32\INCLUDE\s32file.h"\
	"..\..\..\EPOC32\INCLUDE\s32file.inl"\
	"..\..\..\EPOC32\INCLUDE\s32page.h"\
	"..\..\..\EPOC32\INCLUDE\s32page.inl"\
	"..\..\..\EPOC32\INCLUDE\s32share.h"\
	"..\..\..\EPOC32\INCLUDE\s32share.inl"\
	"..\..\..\EPOC32\INCLUDE\s32std.h"\
	"..\..\..\EPOC32\INCLUDE\s32std.inl"\
	"..\..\..\EPOC32\INCLUDE\s32stor.h"\
	"..\..\..\EPOC32\INCLUDE\s32stor.inl"\
	"..\..\..\EPOC32\INCLUDE\S32STRM.H"\
	"..\..\..\EPOC32\INCLUDE\s32strm.inl"\
	"..\..\..\EPOC32\INCLUDE\saex.rsg"\
	"..\..\..\EPOC32\INCLUDE\savenotf.h"\
	"..\..\..\EPOC32\INCLUDE\sendas.h"\
	"..\..\..\EPOC32\INCLUDE\sendas.inl"\
	"..\..\..\EPOC32\INCLUDE\sendui.h"\
	"..\..\..\EPOC32\INCLUDE\smut.h"\
	"..\..\..\EPOC32\INCLUDE\smut.inl"\
	"..\..\..\EPOC32\INCLUDE\tagma.h"\
	"..\..\..\EPOC32\INCLUDE\txtetext.h"\
	"..\..\..\EPOC32\INCLUDE\txtetext.inl"\
	"..\..\..\EPOC32\INCLUDE\txtfmlyr.h"\
	"..\..\..\EPOC32\INCLUDE\txtfmlyr.inl"\
	"..\..\..\EPOC32\INCLUDE\txtfmstm.h"\
	"..\..\..\EPOC32\INCLUDE\txtfrmat.h"\
	"..\..\..\EPOC32\INCLUDE\txtfrmat.inl"\
	"..\..\..\EPOC32\INCLUDE\txtglobl.h"\
	"..\..\..\EPOC32\INCLUDE\txtglobl.inl"\
	"..\..\..\EPOC32\INCLUDE\txtlaydc.h"\
	"..\..\..\EPOC32\INCLUDE\txtmfmtx.h"\
	"..\..\..\EPOC32\INCLUDE\txtmrtsr.h"\
	"..\..\..\EPOC32\INCLUDE\txtrich.h"\
	"..\..\..\EPOC32\INCLUDE\txtrich.inl"\
	"..\..\..\EPOC32\INCLUDE\txtstyle.h"\
	"..\..\..\EPOC32\INCLUDE\txtstyle.inl"\
	"..\..\..\EPOC32\INCLUDE\uikon.hrh"\
	"..\..\..\EPOC32\INCLUDE\vwsdef.h"\
	"..\..\..\EPOC32\INCLUDE\w32std.h"\
	"..\INC\msvapi.h"\
	"..\INC\Saex.h"\
	"..\INC\Saex.hrh"\
	"..\INC\utf.h"\
	
# End Source File
# Begin Source File

SOURCE=\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\Saex.mmp
# PROP Exclude_From_Build 1
# End Source File
# Begin Source File

SOURCE=\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\Saex.rss

!IF  "$(CFG)" == "SAEX - Win32 Uni Release"

# PROP Intermediate_Dir "\Symbian\6.1\Series60\EPOC32\BUILD\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX\WINS"
USERDEP__SAEX_R="\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\INC\SAEX.HRH"	
# Begin Custom Build - Building resources from Saex.rss
InputPath=\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\Saex.rss

"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL\Z\SYSTEM\APPS\SAEX\SAEX.rSC.dummy" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nmake -nologo -f "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX.SUP.MAKE"   "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL\Z\SYSTEM\APPS\SAEX\SAEX.r"

# End Custom Build

!ELSEIF  "$(CFG)" == "SAEX - Win32 Uni Debug"

# PROP Intermediate_Dir "\Symbian\6.1\Series60\EPOC32\BUILD\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX\WINS"
USERDEP__SAEX_R="\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\INC\SAEX.HRH"	
# Begin Custom Build - Building resources from Saex.rss
InputPath=\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\Saex.rss

"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SAEX.rSC.dummy" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nmake -nologo -f "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX.SUP.MAKE"   "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SAEX.r"

# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\Saex.uid.cpp
DEP_CPP_SAEX_U=\
	"..\..\..\EPOC32\INCLUDE\e32def.h"\
	"..\..\..\EPOC32\INCLUDE\e32des16.h"\
	"..\..\..\EPOC32\INCLUDE\e32des8.h"\
	"..\..\..\EPOC32\INCLUDE\e32std.h"\
	"..\..\..\EPOC32\INCLUDE\e32std.inl"\
	
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\INC\Saex.h
# End Source File
# Begin Source File

SOURCE=\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\INC\Saex.hrh
# End Source File
# End Group
# End Target
# End Project
