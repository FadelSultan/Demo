//
//  ContentView.swift
//  FSCoverFlow
//
//  Created by Fadel Sultan on 17/01/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {

    /// View properties
    @State private var enableReflection:Bool = false
    @State private var listType:[String] = ["Normal" , "Clip" , "Slid"]
    @State private var typeSelection:Int = 0
    
    private let images = [UIImage(named: "image")!,UIImage(named: "image")!,UIImage(named: "image")!]

    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Spacer(minLength: 0)

                CoverFlowView(
                    enableReflection: enableReflection,
                    displayType: typeSelection == 0 ? .normal : typeSelection == 1 ? .clip : .slid,
                    images: images
                )
                
                Spacer(minLength: 0)
                
                propertiesView
            }
            .navigationTitle("FSCoverFlow")
            
        }
        .preferredColorScheme(.dark)
    }
}

@available(iOS 17.0, *)
#Preview {
    ContentView()
}

@available(iOS 17.0, *)
extension ContentView {
    private var propertiesView:some View {
        VStack(alignment: .leading,spacing: 10)  {
            Toggle("Toggle reflection", isOn: $enableReflection)
            
            Text("Display Type")
                .font(.headline)
                .foregroundStyle(.gray)
            
            Picker("Type", selection: $typeSelection) {
                ForEach(listType.indices ,id: \.self) { index in
                    Text(listType[index])
                        .font(.headline)
                }
            }.pickerStyle(.segmented)
        }
        .padding(15)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
        .padding(15)
    }
}
