//
//  ShareViewController.swift
//  Share-extension
//
//  Created by Awais Fayyaz on 22/08/2022.
//

import UIKit
import Social
import Intents

class ShareViewController: SLComposeServiceViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Populate the recipient property with the metadata in case the user tapped a suggestion from the share sheet.
          let intent = self.extensionContext?.intent as? INSendMessageIntent
          if intent != nil {
              let conversationIdentifier = intent!.conversationIdentifier
            print("conversationIdentifier: \(conversationIdentifier as Any)")
              //self.recipient = recipient(identifier: conversationIdentifier!)
          }
    
  }
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
      let groupName = INSpeakableString(spokenPhrase: "Awais Z")
      
      
      let sendMessageIntent = INSendMessageIntent.init(recipients: nil,
                                                       outgoingMessageType: .outgoingMessageText,
                                                       content: "Testing",
                                                       speakableGroupName: groupName,
                                                       conversationIdentifier: "com.fhetch.message",
                                                       serviceName: nil, sender: nil, attachments: nil)
      IntentHandler.donateInteractionUsing(intent: sendMessageIntent, isOutgoing: true)
      
      self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
      
      
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
