//
//  BillTrackerAppApp.swift
//  BillTrackerApp
//
//  Created by Fadel Sultan on 15/11/2023.
//

import SwiftUI
import Intents

@main
struct BillTrackerAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    donateIntent()
                    
                    INPreferences.requestSiriAuthorization { status in
                      if status == .authorized {
                        print("Hey, Siri!")
                      } else {
                        print("Nay, Siri!")
                      }
                    }

                })
        }
    }
    
    private func donateIntent() {
        let intent = BillTrackerIntent()
        intent.suggestedInvocationPhrase = "Add New Invoice"
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: \(error.description)")
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    }
}

