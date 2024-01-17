//
//  ListView.swift
//  TempManageListSelection
//
//  Created by Fadel Sultan on 09/01/2024.
//

import SwiftUI

struct ListView<T:ListProtocol>: View {
    
    @Binding var isPresent:Bool
    let items:[T]
    @Binding var selectedRow:T?
    
    
    @State private var textSearch:String = ""
    private var filter:[T] {
        return textSearch.isEmpty ? items : items.filter({$0.value.contains(textSearch)})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(filter , id: \.self) { item in
                    rowView(item: item)
                }
            }
            .searchable(text: $textSearch,prompt: "البحث ...")
        }
    }
}

#Preview {
    ListView(isPresent: .constant(true), items: [SquareModel(id: 1, value: "مربع ١", outputMsg: nil, errorMsg: nil, success: true)], selectedRow: .constant(SquareModel(id: 1, value: "مربع ١", outputMsg: nil, errorMsg: nil, success: true)))
}


extension ListView {
    private func rowView(item:T) -> some View {
        HStack {
            Spacer()
            
            Text(item.value)
                .font(.headline)
                .foregroundStyle(Color.white)
                
            Circle()
                .fill(Color.white)
                .frame(width: 5 , height: 5)
            
        }
        
        .padding(.trailing,10)
        .frame(height: 50)
        .background(Color.pink.opacity(0.8).clipShape(RoundedRectangle(cornerRadius: 10)))
        .padding(.horizontal)
        .onTapGesture {
            selectedRow = item
            isPresent.toggle()
        }
    }
}
