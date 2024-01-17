//
//  EXView.swift
//  TempManageListSelection
//
//  Created by Fadel Sultan on 09/01/2024.
//

import Foundation
import SwiftUI

struct DefaultModifire:ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.pink.clipShape(RoundedRectangle(cornerRadius: 10)))
            .padding(.horizontal)
    }
    
    
}


extension View {
    func defaultModifire() -> some View {
        modifier(DefaultModifire())
    }
}
