//
//  ContentView.swift
//  TempManageListSelection
//
//  Created by Fadel Sultan on 09/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @State private var isPresentSquare:Bool = false
    @State private var isPresentMuncipility:Bool = false
    
    var body: some View {
        VStack {
            
            squareView
            muncipilityView
            
            Spacer()
        }.task {
            await viewModel.fetchSquare()
            await viewModel.fetchMuncipility()
        }
    }
}

#Preview {
    ContentView()
}


extension ContentView {
    
    private var squareView:some View {
        Button(action: {
            isPresentSquare.toggle()
        }, label: {
            Text(viewModel.squareSelected?.value ?? "Square List")
                .defaultModifire()
        }).padding(.top )
            .sheet(isPresented: $isPresentSquare, content: {
                ListView(isPresent: $isPresentSquare,
                         items: viewModel.squareList,
                         selectedRow: $viewModel.squareSelected)
            })
    }
    
    private var muncipilityView:some View {
        Button(action: {
            isPresentMuncipility.toggle()
        }, label: {
            Text(viewModel.muncipilitySelected?.value ?? "Muncipility")
                .defaultModifire()
        }).sheet(isPresented: $isPresentMuncipility, content: {
            ListView(isPresent: $isPresentMuncipility,
                     items: viewModel.muncipilityList,
                     selectedRow: $viewModel.muncipilitySelected)
        })
    }
}
