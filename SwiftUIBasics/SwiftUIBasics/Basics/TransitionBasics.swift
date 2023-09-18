//
//  TransitionBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 27/07/2023.
//

import SwiftUI

struct TransitionBasics: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("Button") {
                    withAnimation {
                        showView.toggle()
                    }
                }
                .padding(.top, 100)
                Spacer()
            }
            
            
            if showView {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.red)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                        .transition(.move(edge: .bottom))
            }
            
         
        }
        .ignoresSafeArea()
    }
}

struct TransitionBasics_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TransitionBasics()
        }
    }
}
