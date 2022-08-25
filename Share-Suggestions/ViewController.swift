//
//  ViewController.swift
//  Share-Suggestions
//
//  Created by Awais Fayyaz on 22/08/2022.
//

import UIKit
import Intents

class ViewController: UIViewController {

  @IBOutlet weak var lblResultSendIntent: UILabel!
  @IBOutlet weak var lblResultReceivedIntent: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func btnGenerateReceivedIntent(_ sender: UIButton) {
    
    let groupName = INSpeakableString(spokenPhrase: "M Afham")
    
    
    let sendMessageIntent = INSendMessageIntent.init(recipients: nil,
                                                     outgoingMessageType: .outgoingMessageText,
                                                     content: "Testing",
                                                     speakableGroupName: groupName,
                                                     conversationIdentifier: "com.fhetch.message",
                                                     serviceName: nil, sender: nil, attachments: nil)

    let image = INImage(named: "Image1") // Important To work
    sendMessageIntent.setImage(image, forParameterNamed: \.speakableGroupName)

    IntentHandler.donateInteractionUsing(intent: sendMessageIntent, isOutgoing: false)
    //UserActivityHandler.donateUserActivity()
  
  
  }
  
  @IBAction func generateSendMessageIntent(_ sender: UIButton) {
    // Create an INSendMessageIntent to donate an intent for a conversation with Juan Chavez.
    let groupName = INSpeakableString(spokenPhrase: "M Afham")
    
    
    let sendMessageIntent = INSendMessageIntent.init(recipients: nil,
                                                     outgoingMessageType: .outgoingMessageText,
                                                     content: "Testing",
                                                     speakableGroupName: groupName,
                                                     conversationIdentifier: "com.fhetch.message",
                                                     serviceName: nil, sender: nil, attachments: nil)
    
    let image = INImage(named: "Image1")
    sendMessageIntent.setImage(image, forParameterNamed: \.speakableGroupName)

    IntentHandler.donateInteractionUsing(intent: sendMessageIntent, isOutgoing: true)
  }
  

}

