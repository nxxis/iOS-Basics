//
//  ExtractedFunctionsBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 26/07/2023.
//

import SwiftUI

struct ExtractedFunctionsBasics: View {
    
    @State var backgroudColor: Color = Color.green
    
    var body: some View {
        ZStack {
            
            backgroudColor.ignoresSafeArea()
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack(spacing: 20) {
            Text("Hello")
                .font(.largeTitle)
            
            Button {
                buttonPressed()
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(20)
                    .shadow(radius: 5)
        }
    }
}
    
    
    private func buttonPressed() {
        backgroudColor = .blue
    }
}

struct ExtractedFunctionsBasics_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedFunctionsBasics()
    }
}
