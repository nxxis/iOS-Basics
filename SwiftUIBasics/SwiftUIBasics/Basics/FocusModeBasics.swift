//
//  FocusModeBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 31/07/2023.
//

import SwiftUI

struct FocusModeBasics: View {
    
    @State var name: String = ""
    @FocusState var isUsernameFocused: Bool
    var body: some View {
        VStack {
            TextField("add your name here", text: $name)
                .focused($isUsernameFocused)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.gray)
                .brightness(0.3)
                .cornerRadius(10)
            
            Button("Toogle Focus") {
                isUsernameFocused.toggle()
            }
        }
        .padding(40)
    }
}

struct FocusModeBasics_Previews: PreviewProvider {
    static var previews: some View {
        FocusModeBasics()
    }
}
