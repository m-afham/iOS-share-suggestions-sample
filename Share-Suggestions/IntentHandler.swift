//
//  IntentHandler.swift
//  Share-Suggestions
//
//  Created by Awais Fayyaz on 23/08/2022.
//

import Foundation
import Intents

struct IntentHandler {
  static func donateInteractionUsing(intent: INSendMessageIntent, isOutgoing: Bool) {
    
    // Donate the intent.
    let interaction = INInteraction(intent: intent, response: nil)
    interaction.direction = isOutgoing ? .outgoing : .incoming
    interaction.groupIdentifier = "TestIdentifier123"
    interaction.donate(completion: { error in
      DispatchQueue.main.async {
        if error != nil {
          print("Interaction donate Failure with error: \(error as Any)")
        } else {
            // Do something, e.g. send the content to a contact.
          print("Successfully donated interaction")
        }
      }
    })
  }
}

struct UserActivityHandler {
  static func donateUserActivity() {
    let userActivity = NSUserActivity.init(activityType: "com.practice.sendMessage")
    userActivity.title = "Title of user activity"
    userActivity.isEligibleForPrediction = true
    userActivity.isEligibleForSearch = true
    userActivity.persistentIdentifier = "com.practice.sendMessage"
    userActivity.becomeCurrent()
    
  }
}
