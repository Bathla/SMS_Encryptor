/*

        SAEX.H - header file for SAEX application
        

*/

#ifndef __SAEX_H__
#define __SAEX_H__

#if !defined(__MSVAPI_H__)
#include <msvapi.h>                         // for MSendAsObserver and CSendAs 
#endif

#if !defined(__AKNVIEW_H__)
#include <aknview.h>                        // for CAknView
#endif

#if !defined(__AKNVIEWAPPUI_H__)
#include <aknviewappui.h>                   // for CAknViewAppUi
#endif

#if !defined(__EIKAPP_H__) 
#include <eikapp.h>                         // for CEikApplication
#endif

#if !defined(__EIKDOC_H__)
#include <eikdoc.h>                         // for CEikDocument
#endif

#if !defined(__EIKDIALG_H__)
#include <eikdialg.h>                       // for CEikDialog, CCoeControl
#endif

#if !defined(__SENDAS_H__)
#include <sendas.h>                         // for MSendAsObserver and CSendAs 
#endif



// Forward declarations


//
// Container class to draw text on screen
//
class CSAEXContainer : public CCoeControl
    {
public:
    void ConstructL();

private:
    void Draw(const TRect& aRect) const;

    };

//
// Application View class
//
class CSAEXAppView : public CAknView
    {
public:
    static CSAEXAppView* NewL();
    static CSAEXAppView* NewLC();
    ~CSAEXAppView();

public:
    TUid Id() const;
protected:
private:
    void DoActivateL(const TVwsViewId& /*aPrevViewId*/, TUid /*aCustomMessageId*/, const TDesC8& /*aCustomMessage*/);
    void DoDeactivate();
private:
    CSAEXAppView();
    void ConstructL();
private:
    CSAEXContainer* iContainer;
    };


//
// Application Ui class, this contains all application functionality
//
class CSAEXAppUi :  public CAknViewAppUi, public MSendAsObserver,public MMsvSessionObserver
    {
public:
    void ConstructL();
    ~CSAEXAppUi();
    void HandleCommandL(TInt aCommand);

    // from MSendAsObserver
    TBool CapabilityOK(TUid aCapability, TInt aResponse);
	void HandleSessionEventL(TMsvSessionEvent, TAny* , TAny *, TAny *);

private:
    void CmdCreateL();
    void CmdExitL();
	void decryptBody(CRichText *cipherBody,CRichText* plainBody );

    void CreateNewSMSMessageL();    
    void SendUI();
	void CmdEncryptDrafts();
	void encryptBody(CRichText*plainBody,CRichText* cipherBody);

private:
    HBufC* iRecipient;              // recipients gsm number
    CSendAppUi* iSUI;
	CMsvSession * iSession;
    };


//
// Application document class
//
class CSAEXDocument : public CEikDocument
    {
public:
    static CSAEXDocument* NewL(CEikApplication& aApp);
    CEikAppUi* CreateAppUiL();
protected:
private:
    CSAEXDocument(CEikApplication& aApp);
    void ConstructL();
    };


//
// Application class
//
class CSAEXApplication : public CEikApplication
    {
public:
    TUid AppDllUid() const;
private:
    CApaDocument* CreateDocumentL();
    };


#endif // __SAEX_H__
