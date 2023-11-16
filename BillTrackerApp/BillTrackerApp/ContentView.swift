//
//  ContentView.swift
//  BillTrackerApp
//
//  Created by Fadel Sultan on 15/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var billData = [[String: Any]]()
    
    var body: some View {
        ZStack {
            List {
                ForEach(0..<billData.count , id: \.self) { index in
                    HStack {
                        if let title = billData[index]["title"] as? String {
                            Text(title)
                        }
                        Spacer()
                        if let price = billData[index]["price"] as? Int {
                            Text("\(price)")
                        }
                    }
                }
            }.onAppear {
                if let userDefaults = UserDefaults(suiteName: "group.com.fadeldev.temp") {
                    if let billData = userDefaults.array(forKey: "BillData") as? [[String: Any]] {
                        self.billData = billData
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
