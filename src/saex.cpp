/*

        SAEX.CPP - source file for SAEX application
        

*/

 
#include <txtrich.h>                // for CRichText
#include <eikenv.h>                 // for CEikonEnv 
#include <smut.h>                   // for message type UIDs
#include <sendas.h>                 // for CSendAs
#include <msvuids.h>                // for Message type UIDs
#include <miutset.h>                // for KUidMsgTypeSMTP
#include <AknQueryDialog.h>         // for CAknTextQueryDialog
#include <mtmuids.h>                // for KUidMtmQueryCanSendMsg etc. capability query UIDs
#include <txtfmlyr.h>               // for CParaFormatLayer, CCharFormatLayer 
#include <sendui.h>                 // for CSendAppUi
#include <mmsconst.h>               // for KUidMsgTypeMultimedia

#include "saex.h"                   // own definitions
#include "saex.hrh"                 // own resource header
#include <saex.rsg>
#include <imcvcodc.h>				//base64
#include <utf.h>

// this is the content of the message
const TInt iCipherKeyLength = 3;                  // length of our message tag
const TUint8 cipherKey[4]="gr8";

// Own constants
const TUid KUidSAEX = { 0x101F402D };       // SAEX application UID 
const TInt KMaxTelephoneNumberLength = 30;  // maximum length for a gsm number
const TUid KSAEXViewId = { 1 };             // ID of SAEX view

const TInt iPlainTextLength=7;

//
// CSAEXContainer
//

/*
-------------------------------------------------------------------------------

    CSAEXContainer::ConstructL()

    Description: 2nd phase Constructor.

    Return value: N/A

-------------------------------------------------------------------------------
*/
void CSAEXContainer::ConstructL()
    {
    CreateWindowL();
    }


/*
-----------------------------------------------------------------------------

    CSAEXContainer::Draw()

    Simple Draw method.

-----------------------------------------------------------------------------
*/
void CSAEXContainer::Draw(const TRect& /*aRect*/) const
    {
        CWindowGc& gc = SystemGc();
        gc.Clear();
    
        // Draw text "SAEX for Series 60"
        gc.SetPenColor(KRgbBlack); 
        const CFont* fontUsed = iEikonEnv->TitleFont();
        gc.UseFont(fontUsed);

        TInt baseline = (Rect().Height() / 2) - fontUsed->AscentInPixels() * 2; // set text 2 * text ascent abowe the centerline
        TInt margin=0; // margin is zero so that the text will be cenetred

        _LIT(K1stLine,"Secure Messaging");
        gc.DrawText(K1stLine,Rect(),baseline,CGraphicsContext::ECenter, margin);
        
        baseline = (Rect().Height() / 2) + fontUsed->AscentInPixels()*2; // 2nd line goes below the centerline

        _LIT(K2ndLine,"by Aman");
        gc.DrawText(K2ndLine,Rect(),baseline,CGraphicsContext::ECenter, margin);
    }

//
// CSAEXAppView
//

/*
-----------------------------------------------------------------------------

    CSAEXAppView::NewL()

    2nd phase construction.

    Return values:      CSAEXAppView*

-----------------------------------------------------------------------------
*/
CSAEXAppView* CSAEXAppView::NewL()
    {
    CSAEXAppView* self = NewLC();
    CleanupStack::Pop(); // self
    return self;
    }

/*
-----------------------------------------------------------------------------

    CSAEXAppView::NewLC()

    2nd phase construction.

    Return values:      CSAEXAppView*

-----------------------------------------------------------------------------
*/
CSAEXAppView* CSAEXAppView::NewLC()
    {
    CSAEXAppView* self = new(ELeave) CSAEXAppView();
    CleanupStack::PushL(self);
    self->ConstructL();
    return self;
    }

/*
-----------------------------------------------------------------------------

    CSAEXAppView::CSAEXAppView()

    C++ constructor

-----------------------------------------------------------------------------
*/
CSAEXAppView::CSAEXAppView()
    {
    }

/*
-----------------------------------------------------------------------------

    CSAEXAppView::ConstructL()

    2nd phase constructor.

    Return values:      CSAEXAppView*

-----------------------------------------------------------------------------
*/
void CSAEXAppView::ConstructL()
    {
    }

/*
-------------------------------------------------------------------------------

    ~CSAEXAppView()

    Description: Destructor.

    Return value: N/A

-------------------------------------------------------------------------------
*/
CSAEXAppView::~CSAEXAppView()
    {
    if(iContainer)
        AppUi()->RemoveFromStack(iContainer);
    }

/*
-------------------------------------------------------------------------------

    CSAEXAppView::Id()

    Description: Returns the id of the view object.

    Return value: TUid

-------------------------------------------------------------------------------
*/
TUid CSAEXAppView::Id() const
    {
    return KSAEXViewId;
    }

/*
-------------------------------------------------------------------------------

    CSAEXAppView::DoActivateL()

    Description: Activate this view.

    Return value: N/A

-------------------------------------------------------------------------------
*/
void CSAEXAppView::DoActivateL(const TVwsViewId& /*aPrevViewId*/, TUid /*aCustomMessageId*/, const TDesC8& /*aCustomMessage*/ )
    {
    if (!iContainer) // container hasn't been created yet
        {
        // Then construct the UI components
        iContainer = new(ELeave) CSAEXContainer;             
        iContainer->ConstructL();             // Construct a view control
        iContainer->SetRect(ClientRect());    // Sets view control's extent to the space available
        }

    iContainer->ActivateL();                  // Activate the view control
    }


/*
-------------------------------------------------------------------------------

    CSAEXAppView::DoDeactivate()

    Description: Deactivate this view.

    Return value: N/A

-------------------------------------------------------------------------------
*/
void CSAEXAppView::DoDeactivate()
    {
    if (iContainer)
        {
        delete iContainer;
        iContainer = NULL;
        }
    }


//
// CSAEXAppUi
//

/*
-----------------------------------------------------------------------------

  CSAEXAppUi::ConstructL()                          
  
  2nd phase constructor

-----------------------------------------------------------------------------
*/
void CSAEXAppUi::ConstructL()
    {

    BaseConstructL();                                   // init this AppUi with standard values

	iSession=NULL;	
	iSession=CMsvSession::OpenSyncL(*this);

    iRecipient=HBufC::NewL(KMaxTelephoneNumberLength);  // for recipient sms number
    iRecipient->Des() = _L("09416043351");                             

    // Create SendUi
    iSUI = CSendAppUi::NewL(ESAEXCmdSendUi); 

    // Series60 view launching
    CSAEXAppView* view = CSAEXAppView::NewLC(); 
    AddViewL(view);                     // add created view to this AppUi
    ActivateLocalViewL( view->Id() );   // activate view
    CleanupStack::Pop(); // view
    }

/*
-----------------------------------------------------------------------------

    CSAEXAppUi::~CSAEXAppUi()

    Destructor.

-----------------------------------------------------------------------------
*/
CSAEXAppUi::~CSAEXAppUi()
    {  
   delete iRecipient;

		if(iSession)
		{
			delete iSession;
			iSession=NULL;
		}
	

    if(iSUI)
        delete iSUI;	
   
    }



/*
-----------------------------------------------------------------------------

    CSAEXAppUi::HandleCommandL(TInt aCommand)

    Handle the commands from CBA and menu items

-----------------------------------------------------------------------------
*/
void CSAEXAppUi::HandleCommandL(TInt aCommand)
    {
    switch (aCommand)
        {
    case ESAEXCmdSendUi:
        SendUI();    
        break;
    case ESAEXCmdCreate:
        CmdCreateL();
        break;
	case ESAEXCmdEncryptDrafts:
			CmdEncryptDrafts();
		break;
    case EAknSoftkeyExit:
    case EClose:
        CmdExitL();
        break;
    default:
        break;
        }
    }


void CSAEXAppUi::CmdEncryptDrafts()
{	
		TMsvSelectionOrdering order( KMsvNoGrouping, EMsvSortByDate, ETrue );
		CMsvEntry* folderEntry = CMsvEntry::NewL( *iSession,KMsvDraftEntryId, order );
		CleanupStack::PushL( folderEntry );   
		CMsvEntrySelection* folderSelection = folderEntry->ChildrenWithTypeL(
        KUidMsvMessageEntry );
		CleanupStack::PushL( folderSelection );
		CMsvEntry *msgEntry; 
		const TInt count( folderSelection->Count() );
        TMsvId msgEntryId = ( *folderSelection )[ count-1 ];	  
		msgEntry=iSession->GetEntryL( msgEntryId);
		
		if( msgEntry!= KErrNone )
		{
				CleanupStack::PushL(msgEntry);	//1

				CParaFormatLayer* paraLayer = CParaFormatLayer::NewL();
				CleanupStack::PushL(paraLayer);		//2
				CCharFormatLayer* charLayer = CCharFormatLayer::NewL(); 
				CleanupStack::PushL(charLayer);		//3
				CRichText* cipherBody = CRichText::NewL(paraLayer, charLayer); 
				CRichText * plainBody=CRichText::NewL(paraLayer, charLayer); 

				CleanupStack::PushL(cipherBody);	//4	
				CleanupStack::PushL(plainBody);		//5

				CMsvStore* store= msgEntry->ReadStoreL();
				CleanupStack::PushL(store);	//6

				store->RestoreBodyTextL(*plainBody);				

				CSendAs* iSendAs=NULL;   
				iSendAs = CSendAs::NewL(*this);				

						if(iSendAs)
							{
								CleanupStack::PushL(iSendAs);        
								iSendAs->SetMtmL(KUidMsgTypeSMS);        

								if(iSendAs->AvailableServices().Count()<1)
										{
											CEikonEnv::Static()->InfoMsg(_L("No SMS services available."));
											User::Leave(KErrNotFound);
										}
       
								iSendAs->SetService(0); 
       
								User::LeaveIfError(iSendAs->QueryMessageCapability(KUidMtmQueryCanSendMsg, EFalse));
								User::LeaveIfError(iSendAs->QueryMessageCapability(KUidMtmQueryMaxBodySize, ETrue));
        
								iSendAs->CreateMessageL();

								iSendAs->AddRecipientL( iRecipient->Des() );						
										
								encryptBody(plainBody,cipherBody);								
								iSendAs->SetBodyL(*cipherBody);

								User::LeaveIfError(iSendAs->ValidateMessage());
								iSendAs->SaveMessageL(ETrue); // message is saved into Outbox(drafts)

								CleanupStack::PopAndDestroy(1,iSendAs);//iSendAs
										
								}		

					CleanupStack::PopAndDestroy(6, msgEntry);	//~6
			}
		CleanupStack::PopAndDestroy( 2 ); 	
									

}


void CSAEXAppUi::encryptBody(CRichText*plainBody,CRichText* cipherBody)
{
	TPtrC16 plainText=_L("");
	TCharFormat charFormat;
	plainBody->GetChars(plainText,charFormat,0);
	

	TInt plainLength=plainText.Length();
	if(plainLength==iPlainTextLength+1)
		{

			TBuf8<iPlainTextLength*2> plainEqv;
			CnvUtfConverter::ConvertFromUnicodeToUtf8(plainEqv,plainText);			
			


			TUint8 encryptedString[(iPlainTextLength*iCipherKeyLength*2)] ;
			

			TInt counter=0;

			for (TInt p=0;p<iCipherKeyLength;p++)
					{
						for(TInt q=0;q<iPlainTextLength;q++)
						{
							encryptedString[counter]= (TUint8)plainEqv[q] + cipherKey[p]; //cipherKey[p];				
							encryptedString[counter+1]=0;
							counter+=2;
						}
					}
					
					TPtrC8 encryptedText(encryptedString,iPlainTextLength*iCipherKeyLength*2);				

					TBuf8<iPlainTextLength*8> encryptedText8;										
					TImCodecB64 base64; 
					base64.Initialise(); 
					base64.Encode(encryptedText,encryptedText8);

					TBuf16<iPlainTextLength*8> encryptedText16;	
					
					CnvUtfConverter::ConvertToUnicodeFromUtf8(encryptedText16,encryptedText8);						
			
					cipherBody->InsertL(0,encryptedText16);				
				
		}
	


}

void CSAEXAppUi::decryptBody(CRichText *cipherBody,CRichText* plainBody )
{

	TBuf8<iPlainTextLength*8> cipherEqv;
	TBuf8<2*iPlainTextLength*iCipherKeyLength> cipherString;
	TPtrC16 cipherText=_L("");
	TCharFormat charFormat;

	cipherBody->GetChars(cipherText ,charFormat,0);	

	CnvUtfConverter::ConvertFromUnicodeToUtf8(cipherEqv,cipherText);	
	TImCodecB64 base64; 
	base64.Initialise(); 
	base64.Decode(cipherEqv, cipherString); 
	
	
		TInt cipherLength=cipherString.Length();
		if(cipherLength==42)	//this is for 7 letter string
		{
		
			TUint8 decryptedText[iPlainTextLength+1];
			TInt counter=0;			

			for (TInt p=0;p<iCipherKeyLength;p++)
					{
						for(TInt q=0;q<iPlainTextLength;q++)
						{
							decryptedText[q]= (TUint8)cipherString[counter] - cipherKey[p]; //cipherKey[p];				
							counter+=2;
						}
					}


				decryptedText[iPlainTextLength]='\0';
				TBuf16<8> decryptedText16;
				TPtrC8 decryptedText8(decryptedText);										

				CnvUtfConverter::ConvertToUnicodeFromUtf8(decryptedText16,decryptedText8);	
				//CEikonEnv::Static()->AlertWin(decryptedText16);

				plainBody->InsertL(0,decryptedText16);
					
				
			}
				//ygDCAM4A1QDJAMYAkgDLAMMAzwDWAMoAxwCTAMwAxADQANcAywDIAJQA

	
}



void CSAEXAppUi::SendUI()
    {
	TMsvSelectionOrdering order( KMsvNoGrouping, EMsvSortByDate, ETrue );
    CMsvEntry* folderEntry = CMsvEntry::NewL( *iSession,KMsvGlobalInBoxIndexEntryId, order );
    CleanupStack::PushL( folderEntry );    
    CMsvEntrySelection* folderSelection = folderEntry->ChildrenWithTypeL(
        KUidMsvMessageEntry );
    CleanupStack::PushL( folderSelection );

	const TInt count( folderSelection->Count() );	 
	{
		CMsvEntry *msgEntry; 
       TMsvId msgEntryId = ( *folderSelection )[ count-1 ];	  
		msgEntry=iSession->GetEntryL( msgEntryId);
		CleanupStack::PushL(msgEntry);

		if( msgEntry!= KErrNone )
		{

				if(true)//msgEntry->Entry().iType)//KUidMsvMessageEntry)
				{				
					CParaFormatLayer* paraLayer = CParaFormatLayer::NewL();
					CleanupStack::PushL(paraLayer); 
					CCharFormatLayer* charLayer = CCharFormatLayer::NewL(); 
					CleanupStack::PushL(charLayer); 
					CRichText* cipherBody = CRichText::NewL(paraLayer, charLayer); 
					CRichText * plainBody=CRichText::NewL(paraLayer, charLayer); 

					CleanupStack::PushL(cipherBody); 
					CleanupStack::PushL(plainBody); 

					CMsvStore* store= msgEntry->ReadStoreL();
					CleanupStack::PushL(store);

					store->RestoreBodyTextL(*cipherBody);

					CSendAs* iSendAs=NULL;   
					iSendAs = CSendAs::NewL(*this);				

					if(iSendAs)
						{
								CleanupStack::PushL(iSendAs);        
								iSendAs->SetMtmL(KUidMsgTypeSMS);        

								if(iSendAs->AvailableServices().Count()<1)
									{
										CEikonEnv::Static()->InfoMsg(_L("No SMS services available."));
										User::Leave(KErrNotFound);
									}
        
								iSendAs->SetService(0); 
        
								User::LeaveIfError(iSendAs->QueryMessageCapability(KUidMtmQueryCanSendMsg, EFalse));
								User::LeaveIfError(iSendAs->QueryMessageCapability(KUidMtmQueryMaxBodySize, ETrue));

        
								iSendAs->CreateMessageL();

								iSendAs->AddRecipientL( iRecipient->Des() );
								//iSendAs->SetSubjectL( KIGainTag ); 
								
								decryptBody(cipherBody,plainBody);								
								iSendAs->SetBodyL(*plainBody);									
								

								User::LeaveIfError(iSendAs->ValidateMessage());
								iSendAs->SaveMessageL(ETrue); // message is saved into Outbox(drafts)

								CleanupStack::PopAndDestroy(1,iSendAs);//plainBody and iSendAs

								
						}		

							CleanupStack::PopAndDestroy(5, paraLayer);	

					}
					else
					{
								CEikonEnv::Static()->AlertWin(_L("No SMS found."));
								User::Leave(KErrNotFound);
					
					}
						CleanupStack::PopAndDestroy(1, msgEntry);	
		}


	 }	 
	 	CleanupStack::PopAndDestroy( 2 ); 	
   


    }



TBool CSAEXAppUi::CapabilityOK(TUid /*aCapability*/, TInt /*aResponse*/)
    {
    return ETrue;
    }


void CSAEXAppUi::HandleSessionEventL(TMsvSessionEvent, TAny* , TAny *, TAny *)
{

}

void CSAEXAppUi::CreateNewSMSMessageL()
    {
    
   	TMsvSelectionOrdering order( KMsvNoGrouping, EMsvSortByDate, ETrue );
    CMsvEntry* folderEntry = CMsvEntry::NewL( *iSession,KMsvDraftEntryId, order );
    CleanupStack::PushL( folderEntry );    
    CMsvEntrySelection* folderSelection = folderEntry->ChildrenWithTypeL(
        KUidMsvMessageEntry );
    CleanupStack::PushL( folderSelection );

	const TInt count( folderSelection->Count() );
	 for ( TInt i( 0 ); i < count; i++ )
	 {
		CMsvEntry *msgEntry; 		
       TMsvId msgEntryId = ( *folderSelection )[ i ];	  
		msgEntry=iSession->GetEntryL( msgEntryId);
		CleanupStack::PushL(msgEntry);

		if( msgEntry!= KErrNone )
		{

				if(true)//msgEntry->Entry().iType)//KUidMsvMessageEntry)
				{				
					CParaFormatLayer* paraLayer = CParaFormatLayer::NewL();
					CleanupStack::PushL(paraLayer); 
					CCharFormatLayer* charLayer = CCharFormatLayer::NewL(); 
					CleanupStack::PushL(charLayer); 
					CRichText* cipherBody = CRichText::NewL(paraLayer, charLayer); 
					CRichText * plainBody=CRichText::NewL(paraLayer, charLayer); 

					CleanupStack::PushL(cipherBody); 
					CleanupStack::PushL(plainBody); 

					CMsvStore* store= msgEntry->ReadStoreL();
					CleanupStack::PushL(store);

					store->RestoreBodyTextL(*cipherBody);

					CSendAs* iSendAs=NULL;   
					iSendAs = CSendAs::NewL(*this);				

					if(iSendAs)
						{
								CleanupStack::PushL(iSendAs);        
								iSendAs->SetMtmL(KUidMsgTypeSMS);        

								if(iSendAs->AvailableServices().Count()<1)
									{
										CEikonEnv::Static()->InfoMsg(_L("No SMS services available."));
										User::Leave(KErrNotFound);
									}
        
								iSendAs->SetService(0); 
        
								User::LeaveIfError(iSendAs->QueryMessageCapability(KUidMtmQueryCanSendMsg, EFalse));
								User::LeaveIfError(iSendAs->QueryMessageCapability(KUidMtmQueryMaxBodySize, ETrue));

        
								iSendAs->CreateMessageL();

								iSendAs->AddRecipientL( iRecipient->Des() );
								//iSendAs->SetSubjectL( KIGainTag ); 
								
								decryptBody(cipherBody,plainBody);								
								iSendAs->SetBodyL(*plainBody);									
								

								User::LeaveIfError(iSendAs->ValidateMessage());
								iSendAs->SaveMessageL(ETrue); // message is saved into Outbox(drafts)

								CleanupStack::PopAndDestroy(1,iSendAs);//plainBody and iSendAs

								
						}		

							CleanupStack::PopAndDestroy(5, paraLayer);	

					}
					else
					{
								CEikonEnv::Static()->AlertWin(_L("No SMS found."));
								User::Leave(KErrNotFound);
					
					}
						CleanupStack::PopAndDestroy(1, msgEntry);	
		}


	 }	 
	 	CleanupStack::PopAndDestroy( 2 ); 	

    }



void CSAEXAppUi::CmdCreateL()
    {
    // set up a new messages and save them into Drafts folder
    CreateNewSMSMessageL();
    }




void CSAEXAppUi::CmdExitL()
    {
    CBaActiveScheduler::Exit(); // Call the CBaActiveScheduler's Exit 
                                // function that stops the application's thread
                                // and destroys it.
    }





CSAEXDocument* CSAEXDocument::NewL(CEikApplication& aApp)
    {
    CSAEXDocument* self = new(ELeave) CSAEXDocument(aApp);
    CleanupStack::PushL(self);
    self->ConstructL();
    CleanupStack::Pop(); //self.
    return self;
    }


CSAEXDocument::CSAEXDocument(CEikApplication& aApp)
    : CEikDocument(aApp)
    {
    }


void CSAEXDocument::ConstructL()
    {    
    }


CEikAppUi* CSAEXDocument::CreateAppUiL()
    {
    return (new(ELeave) CSAEXAppUi);
    }



TUid CSAEXApplication::AppDllUid() const
    {
    return KUidSAEX;
    }


CApaDocument* CSAEXApplication::CreateDocumentL()
    {
    return (CSAEXDocument::NewL(*this));
    }





EXPORT_C CApaApplication* NewApplication()
    {
    return (new CSAEXApplication);
    }




GLDEF_C TInt E32Dll(TDllReason)
    {
    return KErrNone;
    }
