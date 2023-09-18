//
//  ViewModifiers.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 01/08/2023.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(30)
            .shadow(radius: 6)
    }
}

extension View {
    func defaultButton(backgroundColor: Color) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifiersAdv: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
                .defaultButton(backgroundColor: .gray)
                .font(.headline)
                
            
            Text("Hello, EB!")
                .defaultButton(backgroundColor: .blue)
                .font(.body)
                
        }
        .padding(30)
    }
}

struct ViewModifiersAdv_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifiersAdv()
    }
}
