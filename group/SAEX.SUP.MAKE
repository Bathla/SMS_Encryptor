
PATH=C:\Symbian\6.1\Shared\epoc32\gcc\bin;C:\Symbian\6.1\Shared\epoc32\tools;C:\Program Files\Common Files\Symbian\Tools;C:\WINNT\system32;C:\WINNT;C:\WINNT\System32\Wbem;C:\Program Files\Rational\Quantify\cache;E:\Data From ASingh\Mercury Tools;C:\WINNT\Microsoft.NET\Framework\v1.1.4322;C:\Program Files\doxygen\bin;C:\WINNT\system32\drivers;C:\Program Files\Quark\Mercury\Application Server;C:\Program Files\Common Files\Compuware;C:\WINNT\system32\;c:\winnt\perl\bin;C:\jdk1.4\bin;C:\jdk1.4\jre\bin;E:\Program Files\Microsoft Visual Studio .NET 2003\Vc7\bin;E:\Program Files\Microsoft Visual Studio .NET 2003\Common7\IDE;C:\Nokia\Update_Manager\bin;;F:\Nokia\Tools\Nokia_Developers_Suite_for_J2ME_2_2\bin;F:\Program Files\Microsoft Visual Studio .NET 2003\SDK\v1.1\Bin;F:\Program Files\Microsoft Visual Studio .NET 2003\Vc7\bin;F:\Program Files\Microsoft Visual Studio .NET 2003\Common7\IDE;C:\Program Files\Common Files\System\ado;C:\Program Files\Microsoft SQL Server\80\Tools\BINN;C:\Program Files\AppForge\Platf;C:\Progr

# EPOC DEFINITIONS

EPOCBLD = \Symbian\6.1\Series60\EPOC32\BUILD\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX\WINS\ #
EPOCTRG = \Symbian\6.1\Series60\EPOC32\RELEASE\WINS\ #
EPOCLIB = \Symbian\6.1\Series60\EPOC32\RELEASE\WINS\ #
EPOCLINK = \Symbian\6.1\Series60\EPOC32\RELEASE\WINS\ #
EPOCSTATLINK = \Symbian\6.1\Series60\EPOC32\RELEASE\WINS\ #

EPOCBLDUDEB = $(EPOCBLD)UDEB
EPOCTRGUDEB = $(EPOCTRG)UDEB
EPOCLIBUDEB = $(EPOCLIB)UDEB
EPOCLINKUDEB = $(EPOCLINK)UDEB
EPOCSTATLINKUDEB = $(EPOCSTATLINK)UDEB

EPOCBLDUREL = $(EPOCBLD)UREL
EPOCTRGUREL = $(EPOCTRG)UREL
EPOCLIBUREL = $(EPOCLIB)UDEB
EPOCLINKUREL = $(EPOCLINK)UDEB
EPOCSTATLINKUREL = $(EPOCSTATLINK)UREL


TRGDIR = Z\SYSTEM\APPS\SAEX

DATADIR = Z\SYSTEM\DATA

LIBRARY :

MAKEWORKLIBRARY : "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB"

"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB" :
	@perl -S emkdir.pl "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB"


# BUILD - UDEB

LIBS= \
	"$(EPOCLINKUDEB)\EUSER.LIB" \
	"$(EPOCLINKUDEB)\AVKON.LIB" \
	"$(EPOCLINKUDEB)\BAFL.LIB" \
	"$(EPOCLINKUDEB)\APPARC.LIB" \
	"$(EPOCLINKUDEB)\CONE.LIB" \
	"$(EPOCLINKUDEB)\EIKCORE.LIB" \
	"$(EPOCLINKUDEB)\SEND.LIB" \
	"$(EPOCLINKUDEB)\SENDUI.LIB" \
	"$(EPOCLINKUDEB)\ETEXT.LIB"	\
	"$(EPOCLINKUDEB)\MSGS.LIB"	\
	"$(EPOCLINKUDEB)\CHARCONV.LIB" \
	"$(EPOCLINKUDEB)\IMUT.LIB"  
	




LINK_OBJS= \
	"$(EPOCBLDUDEB)\SAEX.obj" \
	"$(EPOCBLDUDEB)\SAEX.UID.obj"

STAGE1_LINK_FLAGS="$(EPOCSTATLINKUDEB)\EDLL.LIB" \
 $(LIBS) /nologo /entry:"_E32Dll" /subsystem:windows /dll /debug \
 /incremental:no /machine:IX86 /nodefaultlib /include:"?_E32Dll@@YGHPAXI0@Z" /out:"$(EPOCBLDUDEB)\SAEX.APP" /WARN:3

PRELINKUDEB : $(LINK_OBJS) "$(EPOCSTATLINKUDEB)\EDLL.LIB" $(LIBS)
	link.exe @<<
		$(STAGE1_LINK_FLAGS) $(LINK_OBJS)
<<
	del "$(EPOCBLDUDEB)\SAEX.APP"
	del "$(EPOCBLDUDEB)\SAEX.exp"
	dumpbin /exports /out:"$(EPOCBLDUDEB)\SAEX.inf" "$(EPOCBLDUDEB)\SAEX.lib"
	del "$(EPOCBLDUDEB)\SAEX.lib"
	perl -S makedef.pl -Inffile "$(EPOCBLDUDEB)\SAEX.inf" -1 ?NewApplication@@YAPAVCApaApplication@@XZ "$(EPOCBLD)SAEX.def" 
	del "$(EPOCBLDUDEB)\SAEX.inf"
	lib.exe  /nologo /machine:i386 /nodefaultlib /name:"SAEX.APP" /def:"$(EPOCBLD)SAEX.def" /out:"$(EPOCBLDUDEB)\SAEX.lib"
	del "$(EPOCBLDUDEB)\SAEX.lib"
	@echo First-stage link successful


STOPLINKUDEB : DELEXPOBJUDEB
	@echo Stopped the build by removing the export object,
	@echo if present, because the pre-link stage failed


POSTBUILDUDEB : DELEXPOBJUDEB


DELEXPOBJUDEB :
	if exist "$(EPOCBLDUDEB)\SAEX.exp" del "$(EPOCBLDUDEB)\SAEX.exp"



# BUILD - UREL

LIBS= \
	"$(EPOCLINKUREL)\EUSER.LIB" \
	"$(EPOCLINKUREL)\AVKON.LIB" \
	"$(EPOCLINKUREL)\BAFL.LIB" \
	"$(EPOCLINKUREL)\APPARC.LIB" \
	"$(EPOCLINKUREL)\CONE.LIB" \
	"$(EPOCLINKUREL)\EIKCORE.LIB" \
	"$(EPOCLINKUREL)\SEND.LIB" \
	"$(EPOCLINKUREL)\SENDUI.LIB" \
	"$(EPOCLINKUREL)\ETEXT.LIB"	\
	"$(EPOCLINKUREL)\CHARCONV.LIB"

LINK_OBJS= \
	"$(EPOCBLDUREL)\SAEX.obj" \
	"$(EPOCBLDUREL)\SAEX.UID.obj"

STAGE1_LINK_FLAGS="$(EPOCSTATLINKUREL)\EDLL.LIB" \
 $(LIBS) /nologo /entry:"_E32Dll" /subsystem:windows /dll \
 /incremental:no /machine:IX86 /nodefaultlib /include:"?_E32Dll@@YGHPAXI0@Z" /out:"$(EPOCBLDUREL)\SAEX.APP" /WARN:3

PRELINKUREL : $(LINK_OBJS) "$(EPOCSTATLINKUREL)\EDLL.LIB" $(LIBS)
	link.exe @<<
		$(STAGE1_LINK_FLAGS) $(LINK_OBJS)
<<
	del "$(EPOCBLDUREL)\SAEX.APP"
	del "$(EPOCBLDUREL)\SAEX.exp"
	dumpbin /exports /out:"$(EPOCBLDUREL)\SAEX.inf" "$(EPOCBLDUREL)\SAEX.lib"
	del "$(EPOCBLDUREL)\SAEX.lib"
	perl -S makedef.pl -Inffile "$(EPOCBLDUREL)\SAEX.inf" -1 ?NewApplication@@YAPAVCApaApplication@@XZ "$(EPOCBLD)SAEX.def" 
	del "$(EPOCBLDUREL)\SAEX.inf"
	lib.exe  /nologo /machine:i386 /nodefaultlib /name:"SAEX.APP" /def:"$(EPOCBLD)SAEX.def" /out:"$(EPOCBLDUREL)\SAEX.lib"
	del "$(EPOCBLDUREL)\SAEX.lib"
	@echo First-stage link successful


STOPLINKUREL : DELEXPOBJUREL
	@echo Stopped the build by removing the export object,
	@echo if present, because the pre-link stage failed


POSTBUILDUREL : DELEXPOBJUREL


DELEXPOBJUREL :
	if exist "$(EPOCBLDUREL)\SAEX.exp" del "$(EPOCBLDUREL)\SAEX.exp"



DEPEND= \
	"\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\INC\SAEX.HRH"

"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SAEX.r" : "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SAEX.rSC.dummy"

"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SAEX.rSC.dummy" : "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.RSS" $(DEPEND)
	perl -S epocrc.pl -I "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC" -I "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\INC" -I- -I "..\..\..\..\..\..\Symbian\6.1\Series60\EPOC32\INCLUDE" -DLANGUAGE_SC -u "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.RSS" -o"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SAEX.rSC" -h"..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.rs~" -t"$(EPOCBLDUDEB)"
	echo this is a dummy output file > "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UDEB\Z\SYSTEM\APPS\SAEX\SAEX.rSC.dummy"
	call <<"MayRewriteHdr.bat"
	@echo off
	diff "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.rs~" "..\..\..\..\..\..\Symbian\6.1\Series60\EPOC32\INCLUDE\SAEX.RSG" >NUL
	if errorlevel==1 copy "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.rs~" "\Symbian\6.1\Series60\EPOC32\INCLUDE\SAEX.RSG"
<<
	del "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.rs~"

"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL\Z\SYSTEM\APPS\SAEX\SAEX.r" : "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL\Z\SYSTEM\APPS\SAEX\SAEX.rSC.dummy"

"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL\Z\SYSTEM\APPS\SAEX\SAEX.rSC.dummy" : "\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.RSS" $(DEPEND)
	perl -S epocrc.pl -I "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC" -I "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\INC" -I- -I "..\..\..\..\..\..\Symbian\6.1\Series60\EPOC32\INCLUDE" -DLANGUAGE_SC -u "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.RSS" -o"\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL\Z\SYSTEM\APPS\SAEX\SAEX.rSC" -h"..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.rs~" -t"$(EPOCBLDUREL)"
	echo this is a dummy output file > "\Symbian\6.1\Series60\EPOC32\RELEASE\WINS\UREL\Z\SYSTEM\APPS\SAEX\SAEX.rSC.dummy"
	call <<"MayRewriteHdr.bat"
	@echo off
	diff "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.rs~" "..\..\..\..\..\..\Symbian\6.1\Series60\EPOC32\INCLUDE\SAEX.RSG" >NUL
	if errorlevel==1 copy "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.rs~" "\Symbian\6.1\Series60\EPOC32\INCLUDE\SAEX.RSG"
<<
	del "..\..\..\..\..\..\SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\SRC\SAEX.rs~"


RECREATEWORKSPACE :
	cd \SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP
	perl -S makmake.pl -D \SYMBIAN\6.1\SERIES60\SERIES60EX\SENDASEXAMPLE\GROUP\SAEX.MMP VC6

